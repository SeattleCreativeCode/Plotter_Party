import processing.svg.*;


float WIDTH_INCH = 4;
float HEIGHT_INCH = 6;

float DPI = 72; // dots per inch

float MARGIN = .25;

int WIDTH_SIZE;
int HEIGHT_SIZE;

float WIDTH_DRAW;
float HEIGHT_DRAW;

int totalLines = 20;
int totalLayers = 3;
color[] layerColors = {#FF0000, #00FF00, #0000FF};

int timeSeed = 0;

void settings() {
  WIDTH_SIZE = int(WIDTH_INCH*DPI);
  HEIGHT_SIZE = int(HEIGHT_INCH*DPI);

  WIDTH_DRAW = WIDTH_SIZE-(MARGIN*2);
  HEIGHT_DRAW = HEIGHT_SIZE-(MARGIN*2);

  size(WIDTH_SIZE, HEIGHT_SIZE, P2D);
}

void setup() {
  cursor(CROSS);
  noiseSeed(0);
  randomSeed(0);
  noFill();
  
  timeSeed = generateTimeSeed();
}

void draw() {
  background(255);
  render(false);
}

void render(boolean write) {
  if (!write) {
    stroke(127);
    rect(0, 0, width-1, height-1);
  }

  for (int layer = 0; layer<totalLayers; layer++) {
    stroke(layerColors[layer]);
    renderLines(layer, write);
  }
}

void renderLines(int layer, boolean write) {

  if (write) {
    beginRecord(SVG, "output/filename_"+timeSeed+"_layer"+(layer+1)+".svg");

    // gives an outline for print registration
    stroke(127);
    rect(0, 0, width-1, height-1);
  }

  float noiseMod = (layer+1)*(noise(1)*.1);
  for (int l = 0; l<totalLines; l++) {
    float x1 = noise(l, 0+noiseMod)*WIDTH_DRAW + MARGIN;
    float y1 = noise(l, 10+noiseMod)*HEIGHT_DRAW + MARGIN;

    float x2 = noise(l, 20+noiseMod)*WIDTH_DRAW + MARGIN;
    float y2 = noise(l, 30+noiseMod)*HEIGHT_DRAW + MARGIN;

    line(x1, y1, x2, y2);
  }

  if (write) {
    endRecord();
  }
}

int generateTimeSeed() {
  return  year()+month()+day()+hour()+minute()+second()+millis();
}

void mouseClicked() {
  timeSeed = generateTimeSeed();
  println(timeSeed);
  noiseSeed( timeSeed );
  randomSeed( timeSeed );
}

void keyPressed() {
    if (key == 's' || key == 'S') {
      render(true);
    }
}

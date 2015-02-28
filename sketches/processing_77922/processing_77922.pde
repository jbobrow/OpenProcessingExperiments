
PFont font;
String[] Age = {
  "18:", 
  "20:", 
  "21:", 
  "23:", 
  "28:", 
  "62:", 
  "63:", 
  "67:", 
  "68:", 
  "72:", 
  "74:", 
  "76:", 
  "80:", 
  "87:", 
  "89:",
};

float[] longtermmemory = {
  0.8, 
  0.75, 
  0.625, 
  0.75, 
  0.45, 
  0.925, 
  0.45, 
  0.9, 
  0.9, 
  0.65, 
  0.9, 
  0.95, 
  0.25, 
  0.9, 
  0.55,
};

float[] shorttermmemory = {
  0.5, 
  0.607143, 
  0.607143, 
  0.571428571, 
  0.428571429, 
  0.6428575, 
  0.5, 
  0.357142857, 
  0.428571429, 
  0.4642855, 
  0.357142857, 
  0.785714286, 
  0.428571429, 
  0.642857143, 
  0.5,
};
void setup() {
  size(600, 400);
  frameRate(8);
}

void draw() {
  background(153, 204, 255);
  font = loadFont("ArialMT-48.vlw");
  textFont(font, 20);
  fill(0, 46, 184);
  text("Graph comparing Short and Long Term Memory with Age", 60, 30);

  int x=0;

  for (int i=0;i<15;i++) {

    if (mouseX>x && mouseX<=x+40) {

      fill(0);

      textFont(font, 15);

      text(("Age"), 10, 360);
      text(Age[i], 10, 380);
      text(("Long term memory"), 60, 360);
      text(longtermmemory[i], 60, 380);
      text(("Long term memory"), 60, 360);
      text(longtermmemory[i], 60, 380);
      text(("Short term memory"), 200, 360);
      text(shorttermmemory[i], 200, 380);

      fill((20), (150), (110));
    }

    else {
      fill(50);
    }


    float h = map(longtermmemory[i], 0.25, 0.95, 0, 150);
    rect(x+4, (height-(h))-200, 25, h);

    float s = map(shorttermmemory[i], 0.357142857, 0.785714286, 0, 150);
    rect(x+4, 210, 25, s);

    x+=40;
  }
}



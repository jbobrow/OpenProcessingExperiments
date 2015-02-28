
//5.1) Create a 400x400px sketch that uses a function to abstract a repetitive form. Then, draw this form multiple times to create a composition.
//Graduate Challenge: In addition to the above requirements, your program must also implement and use a "helper" function.


void setup() {
  size(400, 400);
  background(0);
}


void draw() {
}

void mousePressed() { //when mouse is pressed the backgroud redraws as black and the lines draw with random, but constrained stroke weight and color
  background(0);
  for (int w=0; w<width; w+=20) {
    for (int h=0; h<height; h+=10) {
      horzLine(w, h);
      randomColor();
        strokeWeight(random(1, 10));
        smooth();
    }
  }
}

void randomColor() { // this randomly assigns stroke colors to the lines

  int randomNum = floor(random(1, 8));

  if (randomNum == 1) {
    stroke(0);
  }; 
  if (randomNum == 2) { // yellow
    stroke(255, 200, 0);
  }; 
  if (randomNum == 3) {
    stroke(50);
  };
    if (randomNum == 4) {
    stroke(0);
  };
}


void horzLine(float x, float y) { //yellow and grey lines
  pushMatrix();
  translate(x, y);
  line(5, 5, 15, 5);
  popMatrix(); 
}



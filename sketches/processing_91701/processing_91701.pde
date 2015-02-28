
//Idee, Quelle http://www.processing.org/discourse/beta/num_1215767092.html#1

int radius1 = 5;
int rMove1 = +1;
int minRadius1 = 5, maxRadius1 = 200;
int xPos1 = 100;
int yPos1 = 200;

int radius2 = 5;
float rMove2 = 0;
int minRadius2 = 20, maxRadius2 = 180;
int xPos2 = 300;
int yPos2 = 200;

int x = mouseX;
int y = mouseY;

boolean doitAgain = false;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
}

void draw() {
  if(mousePressed || doitAgain==true) {
    waterDrop();
    doitAgain=true;
  }
}

void mouseClicked() {
  doitAgain=false;
}

int counter = 0;

void waterDrop() {
   fill(color(random(255),random(255),random(255)));
   ellipse(mouseX, mouseY, radius2, radius2);
   rMove2 += 0.02;
   radius2 = (int) ((maxRadius2 - minRadius2) * sin(rMove2) + minRadius2);
}



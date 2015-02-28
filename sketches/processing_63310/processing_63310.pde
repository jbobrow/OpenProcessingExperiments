
//Übung 2.1 Simple Rollover 
float rx = 50;
float ry = 50;
float rwidth = 300;
float rhight = 300;
float f = 75;

void setup(){
  size (400,400);
}

void draw(){
  background (255);
  f = random (0,255);
 if (mouseX >= rx && mouseX <= rx + rwidth && mouseY >= ry && mouseY <= ry + rhight){
  fill (f);
  }
 else {
  fill (255);
}
rect (rx, ry, rwidth, rhight);
}


void mousePressed(){
  saveFrame("simple.png");
}


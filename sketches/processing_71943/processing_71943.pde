
int numCircles = 10;
int spacing = 150;
float speed = 100;

void setup() {
  size(500,500);
  smooth();
  background(0);
}

void draw() { 
  background(0);
  
  
  rotate(speed);
  speed+=0.05;

  for (int x = 100; x < height+100; x+=150) {
    for (int y = 100; y < width+100; y += 150){
      int R,G,B;
      R = int(random(0,255));
      G = int(random(0,255));
      B = int(random(0,255));
     //bullseye(x,y,mouseX-2,R,G,B);
       bullseye(x,y,R,G,B);
    }
  }
}

//void bullseye(int xCen, int yCen, int rad, int R, int G, int B){
  void bullseye(int xCen, int yCen, int R, int G, int B){
  stroke(R,G,B);
  strokeWeight(3);
 // int spacing = rad;
  //noFill();
  fill(random(0,255), random(0,255), random(0,255),5);
  // bullseye
  for (int i=0;i < numCircles;i++)
  {
    ellipse(xCen, yCen, i*spacing, i*spacing);
  }
}


//a visualizer-esque graph that responds to an input 
//(in this case the mouse-coordinates)
//move mouse from corner to corner to see effect

void setup() {
  size(800, 800);
}


void draw() {


  int x=mouseY;
  int y=mouseX;
  float z=random(.5);
  background(5);
  stroke(250);
  strokeWeight(2);
  noFill();
  beginShape();

  for (int a=0; a<=width; a+=20) {

    vertex(a, height/2-x*z);
    vertex(a+10, height/2-x*z);
    vertex(a+10, height/2+y*z);
    vertex(a+20, height/2+y*z);
  }
  endShape();

  line(0, height/2, width, height/2);
}




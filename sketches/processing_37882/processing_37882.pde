
void setup() {
  size(400, 400);
  background(0);//black background
  smooth();
}

void draw() {
  for (int i=0; i <=360; i+=15) {

    fill(i, i+200, i+200);// sets fill of the drawing primitives
    pushMatrix();
    translate(width/2, height/2);//divides sketch into quadrants
    rotate(radians(i));//creates a radial composition


    rect(250, 0, 10, 20);//shapes and sizes of the radial primitives
    rect(225, 0, 20, 10);
    rect(200, 0, 10, 20);
    rect(175, 0, 20, 10);
    rect(150, 0, 10, 10);
    ellipse(125, 0, 10, 10);
    ellipse(100, 0, 10, 10);
    ellipse(75, 0, 10, 10);
    rect(50, 0, 10, 5);
    rect(25, 0, 5, 10);
    rect(12.5, 0, 2, 2);
    popMatrix();
  }
}



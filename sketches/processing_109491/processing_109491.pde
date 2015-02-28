


//----------
void setup() {
  size(600, 600, OPENGL,P3D);
}

//----------
void draw() {
background(250);
  noFill();
  beginShape();

vertex(500,50);
bezierVertex(mouseY,mouseX,150,200,width/2,height/2);
endShape();
line(400,20,mouseX,mouseY);
line(150,30,width/2,height/2);


}




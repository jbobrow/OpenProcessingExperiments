
void setup() {
  
  size(240,240);
  noStroke();
  
  for (int i=0; i<3; i++) {
    pushMatrix();
    for (int j=0; j<3; j++) {
      fullsquare();
      translate(0,80);
    }
    popMatrix();
    translate(80,0);
  }
}

void tessellate() { 
  beginShape();
  vertex(0,0);
  vertex(40,0);
  vertex(30,10);
  vertex(40,10);
  vertex(40,20);
  vertex(20,20);
  vertex(40,40);
  vertex(20,60);
  vertex(20,40);
  vertex(10,40);
  vertex(10,50);
  vertex(0,40);
  vertex(0,0);
  endShape();
}

void fullsquare() { //this function puts four of the tessellate function together
  pushMatrix();
  fill(0); //different fills for different shapes
  tessellate();
  translate(0,80); //slides to bottom left
  rotate(3*PI/2);
  fill(255);
  tessellate();
  rotate(PI/2); //undoes the last rotate so I can translate it more easily
  translate(80,0); //slides to bottom right
  rotate(PI);
  fill(0);
  tessellate();
  rotate(PI);
  translate(0,-80); //slides to top right
  rotate(PI/2);
  fill(255);
  tessellate();
  popMatrix(); //back to the top left
}

                                

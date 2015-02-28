
float angle1= 0;
float angle2=0;

void setup(){
  size(400,400,P3D);
  smooth();
  background(0);
  stroke(255,10);
}

void draw(){
  translate(width/2, height/2, 0);
  rotateX(mouseX);
  rotateY(mouseY);
  scale(100);
   noFill();
 //box(200);
 
beginShape();
 
  vertex(-1, -1, -1);
  vertex( 1, -1, -1);
  vertex( 0,  0,  1);

  vertex( 1, -1, -1);
  vertex( 1,  1, -1);
  vertex( 0,  0,  1);

  vertex( 1, 1, -1);
  vertex(-1, 1, -1);
  vertex( 0, 0,  1);

  vertex(-1,  1, -1);
  vertex(-1, -1, -1);
  vertex( 0,  0,  1);
  endShape();
 
}




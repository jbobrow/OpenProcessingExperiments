
//Maddy C CP1 14/15
float z=0;
void setup ()
{
  size(600,600,P3D);
}
void draw()
{
  background(0);
  translate(300,300,0);
  rotateY(-mouseX*.009);
  strokeWeight(10);
  noFill();
  //support
  stroke(255);
  translate(0,0,45);
  triangle(0,0,-150,250,150,250);
  translate(0,0,-45);
  translate(0,0,-45);
  triangle(0,0,-150,250,150,250);
  translate(0,0,45);
 
  rotateZ(z);
 
  //frame
  stroke(255,0,0);
  rotateY(PI/2);
  rect(-35,0,70,250);
  rotateX(PI/4);
 
  stroke(255,0,255);
  rect(-35,0,70,250);
  rotateX(PI/4);
 
  stroke(128,0,255);
  rect(-35,0,70,250);
  rotateX(PI/4);
 
  stroke(0,0,255);
  rect(-35,0,67,250);
  rotateX(PI/4);
 
  stroke(0,255,255);
  rect(-35,0,70,250);
  rotateX(PI/4);
 
  stroke(0,255,0);
  rect(-35,0,70,250);
  rotateX(PI/4);
 
  stroke(255,255,0);
  rect(-35,0,70,250);
  rotateX(PI/4);
 
  stroke(128,255,0);
  rect(-35,0,70,250);
  rotateY(-PI/2);
 
  stroke(255);
  translate(0,0,35);
  ellipse(0,0,500,500);
  translate(0,0,-35);
  translate(0,0,-35);
  ellipse(0,0,500,500);
  translate(0,0,35);
 
  //box1
  stroke(255,0,128);
  fill(255,0,0);
  translate(250,0,0);
  rotateZ(PI/4-z);
  box(50);
  rotateZ(-(PI/4-z));
  translate(-250,0,0);
  //box2
  stroke(255,128,0);
  fill(255,255,0);
  translate(0,250,0);
  rotateZ(PI/4-z);
  box(50);

  rotateZ(-(PI/4-z));
  translate(0,-250,0);
  //box3
  translate(0,-250,0);
  rotateZ(PI/4-z);
  box(50);
  rotateZ(-(PI/4-z));
  translate(0,250,0);
  //box4
  stroke(255,0,128);
  fill(255,0,0);
  translate(-250,0,0);
  rotateZ(PI/4-z);
  box(50);
  rotateZ(-(PI/4-z));
  translate(250,0,0);
 
  rotateZ(-PI/4);
 
  //box5
  stroke(0,255,255);
  fill(0,255,0);
  translate(250,0,0);
  rotateZ(-z);
  box(50);
  rotate(z);
  translate(-250,0,0);
  //box6
  stroke(0,0,255);
  fill(128,0,255);
  translate(0,250,0);
  rotate(-z);
  box(50);
  rotate(z);
  translate(0,-250,0);
  //box7
  stroke(0,0,255);
  fill(128,0,255);
  translate(0,-250,0);
  rotate(-z);
  box(50);
  rotate(z);
  translate(0,250,0);
  //box8
  stroke(0,255,255);
  fill(0,255,0);
  translate(-250,0,0);
  rotateZ(-z);
  box(50);
  rotate(z);
  translate(250,0,0);
  stroke(0,0,0);
  z=z-(PI/200);

}

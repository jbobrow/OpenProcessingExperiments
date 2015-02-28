
PImage sky;
float xPos=200;
float yPos=0;
float yVel;
//r is orientation of small triangle
int r=0;

void setup() {
  size(500, 500);
  background(0, 0, 255);
  frameRate(20);
  //background image
  sky=loadImage("clouds.gif");
  yVel=random(10, 15);
}

void draw() {
  background(0, 0, 255);
  //background image
  image(sky, 0, 0, 500, 500);

  //draw main triangle
  noFill();
  stroke(0);
  strokeWeight(random(3, 6));
  triangle(0, 500, 250, 0, 500, 500); 
  smooth();
  line(250, 0, 250, 400);
  line(250, 400, 0, 500);
  line(250, 400, 500, 500);

  //call smallTri function
  smallTri();
}

//function to draw small triangles
void smallTri() {
  pushMatrix(); 
  pushMatrix();
  //make triangle move up and down
  translate(xPos, yPos=yPos+yVel);
  println(yPos);
  //scale big triangle to 1/5 of size
  scale(.2);
  print("rotation is ");
  println(r);
  rotate(radians(r));
  smooth();
  fill(255, 90);
  smooth();
  noStroke();
  triangle(250, 0, 0, 500, 500, 500); 
  //keep triangle in frame and change rotation
  if (yPos>500 || yPos<0) {
    yVel=-1*yVel;
    r=r+180;
    //keep rotation either 0 or 180;
    if (r==360) {
      r=0;
    }
    if (r==0) {
      xPos=200;
      translate(xPos+100, yPos=yPos+yVel);
    }
    if (r==180) {
      xPos=300;
      translate(xPos, yPos=yPos+yVel);
    }
  }
  print("trans is ");
  println(xPos);
  popMatrix();
  popMatrix();
}



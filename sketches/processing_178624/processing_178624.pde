
//make a smoke by using 2d vertex or many ellipse
//put them in position of x,y,z
//stand your chimley-man still
//and go on with your red color
//try to move at the point where people can stand up as a base in between or ladder

PImage img;

void setup() {
  size(600, 1000, P3D);
}
//rot = rotation
float  lArmRot=0, rArmRot=0;
float deg = radians(5);

float delta = 30;
float r = 160;


void draw() {
  background(176, 224, 230);
  img = loadImage("preview_image.png");
  image(img, width/2, 180, 55, 55);

  for ( int i=1; i<100; i++ ) {
    fill(255);
    stroke(255);
    ellipse ( i*width/(i+1)+100, 220-10*i, 130, 10);
  }

  translate(width/2, height/2, -1000);
  rotateX(90); // makes up direction as +z axis 


  // right arm
  pushMatrix();
  translate(0, 0, 590);
  rotate(rArmRot);
  fill(10);
  ellipse( 0, 0, 330, 350);
  popMatrix();


  // left arm
  pushMatrix();
  translate(0, 0, -400);
  rotate(lArmRot);
  ellipse( 0, 0, 400, 450);
  noFill();
  stroke(0);
  strokeWeight(3);
  translate(0, 0, 50);
  ellipse(0, 0, 400, 400);
  popMatrix();


  //  rotateX(radians(mouseX/100));

  for (float z =-1000; z< 600; z+=5) {
    beginShape(QUAD_STRIP); 
    for (float deg =0; deg < 360; deg += delta) {
      float theta = radians (deg);
      float x = r* cos(theta);
      float y = r* sin(theta);
      fill(255, 0, 0, 200);
      vertex(x, y, z);
    }
    endShape();
  }
}


void mouseMoved() {
  int x = mouseX - width/2;
  int y = mouseY - height/2;


  boolean right=false;
  if (mouseX-pmouseX<0) right=true;

  //dist = distance

    if (dist(x, y, 100, 0) <1500) {
    if (right) rArmRot-=deg;
  } else rArmRot +=deg;
  if (dist(x, y, -100, 0)<100) {
    if (right) lArmRot-=deg;
  } else lArmRot +=deg;
}




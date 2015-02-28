
PImage img;
void setup() {
  size(600, 600, P3D);
  //img = loadImage("eng.png");
 // imageMode(CENTER);
}

void draw () {
background (0, 50, 150);
  //background (0, 150, 80);
 // image(img, 300, 200, 600, 400);

  translate (width/2, height/2, 0);
  rotateX(radians(((mouseX/(float)width)*180)-90));
  rotateY(radians(((mouseY/(float)width)*180)-90));

  //body
  pushMatrix();
  scale(1, 1.5, .5); 
  fill(200, 0, 20);
  box(100);
  popMatrix();

  translate (0, -100, 0);
  //head
  pushMatrix();
  scale(1.5, 1, 1);
  fill(255); 
  box(50);
  popMatrix();


  translate (-60, 80, 0);
  //l_arm
  pushMatrix();
  rotateX(radians(sin(frameCount/8)*40));
  scale(.2, 1, .1); 
  box(100);
  popMatrix();

  translate (120, 0, 0);
  //r_arm
  pushMatrix();
  rotateX(radians(sin(frameCount/8.5)*40));
  scale(.2, 1, .1); 
  box(100);
  popMatrix();

  translate (-30, 100, 0);
  //right feet_1
  pushMatrix();
  //rotateX(radians(sin(frameCount/15)*40));
  scale(0.5, 1, .2); 
  fill(255);
  box(50);
  popMatrix();


  translate (-60, 0, 0);
  //left feet 
  pushMatrix();
  //rotateX(radians(sin(frameCount/15)*40));
  scale(0.5, 1, .2);
  fill(255); 
  box(50);
  popMatrix();


  translate (0, 50, 0);
  //left boot
  pushMatrix();
  rotateX(radians(sin(frameCount/7)*40));
  scale(0.5, 1.5, .2);
  fill(0); 
  box(50);
  popMatrix();

  translate (60, 0, 0);
  //right boot
  pushMatrix();
  rotateX(radians(sin(frameCount/7.5)*40));
  scale(0.5, 1.5, .2);
  fill(0); 
  box(50);
  popMatrix();

  translate (-30, -300, 0);
  //head
  pushMatrix();
  scale(1.5, 1.8, 1);
  fill(0); 
  box(50);
  popMatrix();


  translate (0, 200, 30);
  //belt
  pushMatrix();
  scale(1, .1, .1); 
  fill(0); 
  box(100);
  popMatrix();


  translate (-20, -140, 0);
  //l_eye
  pushMatrix();
  scale(.2, .2, .1); 
  if (mousePressed) {
    fill(255);
  }
  else {
    fill(0);
  } 
  box(50);
  popMatrix();

  translate (40, 0, 0);
  //r_eye
  pushMatrix();
  scale(.2, .2, .1); 
  if (mousePressed) {
    fill(255);
  }
  else {
    fill(0);
  } 

  box(50);
  popMatrix();

  translate (-20, 25, 0);
  //mouth
  pushMatrix();
  scale(0.5, .4, .1); 
  if (mousePressed) {
    fill(0);
  }
  else {
    fill(230, 0, 10);
  }
  box(50);
  popMatrix();
}




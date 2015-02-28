
int tubeRes = 90;
float[] tubeX = new float[tubeRes];
float[] tubeY = new float[tubeRes];
PImage img_1, img_2, img_3;
float angle = 367.0 / tubeRes;
float h=100;
PFont font, font2;
boolean bover = false;
boolean locked = false;
////
int sides=68;
float r=50;
float ang=0;

void setup() {
  size(1024, 768, P3D);
  background(255, 0, 0);
  font=loadFont("Apple-Chancery-48.vlw");
  font2=loadFont("Arial-ItalicMT-48.vlw");
  img_1 = loadImage("1.jpg");
  img_2 = loadImage("2.jpg");
  img_3 = loadImage("3.jpg");
  //lights();
  for (int i = 0; i < tubeRes; i++) {
    tubeX[i] = cos(radians(i * angle));
    tubeY[i] = sin(radians(i * angle));
  }
  noStroke();

  ////
}

void draw() {
  background(0);
  ang+=.1;
  fill(255);

  textFont(font, 38);
  textAlign(LEFT, TOP);
  text( "Spiritual World", 30, 30);
  textAlign(CENTER, TOP);
  textFont(font, 38);
  text( "Heaven", width/2-230, 180);
  text( "Paradise", width/2-230, 310);
  textFont(font, 30);

  text( "Good Spiritual ", width/2-230, 460);
  text( "World", width/2-230, 500);

  textFont(font2, 22);
  text( "Pressed mouse to rotate", width-180, height-140);
  textFont(font2, 12);
  text( "release Date.2012.03.25", width-180, height-100);
  translate(width / 2, h);



  if (mousePressed) {
    rotateX(map((mouseY)/3, 0, height, -PI, PI));
    rotateY(map((mouseX)/3, 0, width, 3*-PI, 3*PI));
    rotateZ(map((mouseY)/3, 0, width, -3*PI, 3*PI));
  }
  else {
    rotateX(-.3);
    rotateY(radians(ang));
  }
  translate(0, 80);
  beginShape(QUAD_STRIP);
  texture(img_1);
  // draw top shape

  // draw body2
  for (int i = 0; i < tubeRes; i++) {
    float x = tubeX[i] * h/2;
    float z = tubeY[i] * h/2;
    float u = img_1.width / tubeRes * i;
    vertex(x, -h, z, u, 0);
    vertex(x, h, z, u, img_1.height);
  }
  endShape();

  translate(0, 120);
  beginShape(QUAD_STRIP);
  texture(img_2);
  // draw top shape

  // draw body3
  for (int i = 0; i < tubeRes; i++) {
    float x = tubeX[i] * h/2;
    float z = tubeY[i] * h/2;
    float u = img_2.width / tubeRes * i;
    vertex(x*1.5, 80+-h/2*1.5, z*1.5, u, 0);
    vertex(x*1.5, 80+h/2*1.5, z*1.5, u, img_2.height);
  }
  endShape();
  translate(0, 120);
  beginShape(QUAD_STRIP);
  texture(img_3);
  // draw top shape

  // draw body3
  for (int i = 0; i < tubeRes; i++) {
    float x = tubeX[i] * h/2;
    float z = tubeY[i] * h/2;
    float u = img_3.width / tubeRes * i;
    vertex(x*2, 150+-h/2*2, z*2, u, 0);
    vertex(x*2, 150+h/2*2, z*2, u, img_3.height);
  }
  endShape();/*
  beginShape(QUADS);
   texture(img);
   vertex(0, -100, 0, 0, 0);
   vertex(100, -100, 0, 100, 0);
   vertex(100, 100, 0, 100, 100);
   vertex(0, 100, 0, 0, 100);
   endShape();
   */
}/*
void mousePressed() {
 locked = true;
 println("go");
 }
 
 void mouseDragged() {
 if (locked) {
 println("go");
 rotateX(map((mouseX+mouseY)/3, 0, height, -PI, PI));
 rotateY(map((mouseX+mouseY)/3, 0, width, -PI, PI));
 rotateZ(map((mouseX+mouseY)/3, 0, width, -PI, PI));
 }
 }
 
 void mouseReleased() {
 locked = false;
 }
 */



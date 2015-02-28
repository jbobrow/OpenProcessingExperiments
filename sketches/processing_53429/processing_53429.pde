
PShape m_01;
PShape m_02;
PShape m_03;
PShape m_04;
PShape m_05;
PShape m_06;
PShape m_07;
PShape m_08;
PShape m_09;
PImage tutu;
PImage window;

float angle;
float angle1;
float angle2;
float angle3;
float angle4;
float angle5;
float angle6;
float angle7;
float angle8;
float angle9;
float speed;

void setup() {
  size(500,500);
  smooth();
  frameRate(2);
  m_01 = loadShape("misplaced_01.svg");
  m_02 = loadShape("misplaced_02.svg");
  m_03 = loadShape("misplaced_03.svg");
  m_04 = loadShape("misplaced_04.svg");
  m_05 = loadShape("misplaced_05.svg");
  m_06 = loadShape("misplaced_06.svg");
  m_07 = loadShape("misplaced_07.svg");
  m_08 = loadShape("misplaced_08.svg");
  m_09 = loadShape("misplaced_09.svg");
  tutu = loadImage("tutu.gif");
  window= loadImage("bwDSC_0334.jpg");
  angle = 0.0;
  angle1 = 0.0;
  angle2 = 0.0;
  angle3 = 0.0;
  angle4 = 0.0;
  angle5 = 0.0;
  angle6 = 0.0;
  angle7 = 0.0;
  angle8 = 0.0;
  angle9 = 0.0;
  speed = 0.01;
  
  smooth();
  frameRate(60);
}

void draw() {
  background(0);
  
  //orbit
  float orb = sin (angle) *200;
  float orb2 = sin (angle +100) *200;
  float orb3 = cos (angle +120) *200;
  float orb4 = sin (angle+150) *200;
  float orb5 = sin (angle +50) *200;
  float orb6 = sin (angle +110) *200;
  float orb7 = cos (angle +130) *200;
  float orb8 = sin (angle +20) *200;
  float orb9 = sin (angle +70) *200;

  pushMatrix();
  rotate(angle);
  translate (mouseX, mouseY);
  shape(m_01, 0, 0, 100,100);
  popMatrix();
  
  pushMatrix();
  translate(orb2, 0);
  translate (mouseX, mouseY);
  shape(m_02, mouseX, mouseY, 50,50);
  popMatrix();
  
  pushMatrix();
  translate(0, orb3);
  translate (mouseX, mouseY);
  shape(m_03, 0, 0, 200,200);
  popMatrix();
  
  pushMatrix();
  rotate(-angle);
  translate(orb4, 0);
  translate (mouseX, mouseY);
  shape(m_04, mouseX/2, mouseY/2, 80,80);
  popMatrix();
  
  pushMatrix();
  translate(orb5, 0);
  translate (mouseX, mouseY);
  shape(m_05, mouseX*.5, mouseY*.5, 70,70);
  popMatrix();
  
  pushMatrix();
  translate(0, orb6);
  translate (mouseX, mouseY);
  shape(m_06, mouseX, mouseY, 110,110);
  popMatrix();
  
  pushMatrix();
  translate(orb7, 0);
  translate (mouseX, mouseY);
  shape(m_07, mouseX, mouseY, 170,170);
  popMatrix();
  
  pushMatrix();
  translate(orb8, 0);
  translate (mouseX, mouseY);
  shape(m_08, mouseX, mouseY, 60,60);
  popMatrix();
  
  pushMatrix();
  translate(orb9, 0);
  translate (mouseX, mouseY);
  shape(m_09, mouseX, mouseY, 250,250);
  popMatrix();
 
  
  angle += speed;
  angle2 += .005;
  angle3 += .0045;
  angle4 += .0040;
  angle5 += .0035;
  angle6 += .005;
  angle7 += .025;
  angle8 += .02;
  angle9 += .001;
  

  /*shape(m_03, x*3, y, a,a);
  shape(m_04, x, y*2, a,a);
  shape(m_05, width+x, y, a,a);
  shape(m_06, x, height-y, a,a);
  shape(m_07, x*2, y*2, a,a);
  shape(m_08, width-x, y*2, a,a);
  shape(m_09, x, y, a,a);
  image(tutu, mouseX,y, 200,200);
  image(window,x, mouseY, 200,200);
  */

}


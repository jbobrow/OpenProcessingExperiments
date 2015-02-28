
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
PImage gate;

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

}

void draw() {
  background(0);
  float x = random(width-30);
  float y = random(height-30);
  float a = random(300,300);
  shape(m_01, width-x, y, a,a);
  shape(m_02, x, mouseY, a,a);
  shape(m_03, x*3, y, a,a);
  shape(m_04, x, y*2, a,a);
  shape(m_05, width+x, y, a,a);
  shape(m_06, x, height-y, a,a);
  shape(m_07, x*2, y*2, a,a);
  shape(m_08, width-x, y*2, a,a);
  shape(m_09, x, y, a,a);
  image(tutu, mouseX,y, 200,200);
  image(window,x, mouseY, 200,200);

}


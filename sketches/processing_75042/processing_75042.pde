
int x = 0;
int y = 0;

int x2 = 0;
int y2 = 0;

int x3 = 0;
int y3 = 0;

int x4 = 0;
int y4 = 0;


PFont font;
String txt = "right";
String txt2 = "left";
String txt3 = "up";
String txt4 = "down";



void setup() {
  size(400, 400);

  font = loadFont("Verdana-45.vlw");
  textFont(font);
}

void draw() {
  
  textFont(font, 45);
  background(0);
  fill(255);
  
  stroke(255);
  line(x-130, 0, x-130, 400);
  text(txt, x-100, 200); 
  x = x+5;
  
  if (x>500) {

    x = -100;
  }

  line(x2+520, 0, x2+520, 400);
  text(txt2, x2+400, 200); 
  x2 = x2-5;
  
  if (x2<-500) {

    x2 = 100;
  }

  line(0, y3+500, 400, y3+500);
  text(txt3, 175, y3+425); 
  y3 = y3-5;
 
  if (y3<-500) {

    y3 = +100;
  }

  line(0, y4-100, 400, y4-100);
  text(txt4, 140, y4); 
  y4 = y4+5;
  
  if (y4>500) {

    y4 = -100;
  }
  
}


int x = 5;
float a = 400;
float b = 5;
float c = -5;
float d = 400;
PFont font;

void setup(){
  size(500,400);
  font = loadFont("Courier-45.vlw");
  
}

void draw(){
  
  fill(b,50,a);
  textFont(font);
  textSize(c);
  text("WIZARDS ETC",-13,c);
  
  fill(d,45,150);
  textFont(font);
  textSize(d);
  text("DO NOT START",0,(200+d));
  
  
  
}

void mouseDragged(){
  a = a - 10;
  b = b + 10;
  c = c + 5;

  
}

void mousePressed(){
  d = d - 10;
  
}

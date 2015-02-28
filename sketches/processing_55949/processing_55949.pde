
int x = 5;
float a = 400;
PFont font;

void setup(){
  size(450,400);
  background(1,67,90);
  font = loadFont("Courier-45.vlw");
  
}


void draw(){
  
  fill(a,45,150);
  textFont(font);
  textSize(a);
  text("You can't stop the",0,(100+a));
  
  fill(a,45,150);
  textFont(font);
  textSize(a);
  text("Blood From a Turnip",140,(100+a));
  
  fill(a,45,150);
  textFont(font);
  textSize(a);
  text("late night puppet salon",280,(100+a));
  
}

void mousePressed(){
  a = a - 10;
  redraw();
  
}


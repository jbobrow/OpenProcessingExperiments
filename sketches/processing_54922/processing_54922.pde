
void setup(){
  size (500,500);
  background (bg,142,125);
  frameRate (60);
  smooth();
}

float o = 30; //opacity of shapes
float x = random(50); //width of shape
float y = random(50); //height of shape
int color1 = #D6E266; //color of stroke
int color2 = #FFFAC7; //colo of fill
float bg = 26;

void draw(){
  stroke(color1,o);
  fill (color2,o);
  ellipse(random(500),random(500), x,y);
  stroke(color2,o);
  fill (color1,o);
  ellipse(random(500),random(500),x,y);
}

void mouseDragged(){
  x = random(100);
  y = random(100);
  o = 100;
}

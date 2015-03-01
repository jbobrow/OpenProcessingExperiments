
//Keith Pomana
//DMS110
//Eyeball Mapping

int x,y;
float xinthebox;
float yinthebox;
int x_cord;
int y_cord;
int spacing;

void setup () {
  background(255,255,255);
  size(640,480);
  }
  
void draw () {
  background(255);
  fill(0,0,255);
  x = mouseX;
  y = mouseY;
  x_cord = 320-70;
  y_cord = 240;
  spacing = 150;
  xinthebox = map(x, 0, 639, x_cord-40, x_cord+40);
  yinthebox = map(y, 0, 479, y_cord-40, y_cord+40);
  ellipse(xinthebox,yinthebox,50,50);
  ellipse(xinthebox+spacing,yinthebox,50,50);
  noFill();
  ellipse(x_cord,y_cord,150,150);
  ellipse(x_cord+spacing,y_cord,150,150);
}

void mousePressed(){
   
}



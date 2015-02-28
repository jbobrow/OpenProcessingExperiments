
int xPost;
int yPost;
int speed;
int gravity;
int h;

void setup() {
  size(500,500);
  xPost=250;
  yPost=0;
  speed=0;
  gravity=-10;
  h=100;
}

void draw() {
  background(255);
  fill(255,0,0);
  ellipse(xPost,yPost,50,50);
  
  yPost=yPost+speed;
  
  if (yPost>500) {
    speed=+gravity++;
  }
  
  else if (yPost<=h) {
    speed=-gravity;
    h=h+5;
  }  
 
}


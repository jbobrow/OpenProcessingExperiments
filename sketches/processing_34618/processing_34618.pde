
void setup(){
  size(450,450);
  stroke(0);
  background(255);
  frameRate(24);
}

int x=0;
int y=0;
int rwidth=450;
int rheight=0;
int scaling=5;

void draw(){
  x=x+scaling;
  y=x;
  rwidth=rwidth-2*scaling;
  rheight=rwidth;
  rect(x,y,rwidth,rheight);
  if (x>450){
    x=0;
    rwidth=450;
  }
}                                                               

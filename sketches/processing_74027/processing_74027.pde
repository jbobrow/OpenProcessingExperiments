
//bouncing ball
int x;
int y;
int w=15;
int inc=3;

void setup(){
size(500,500);
smooth();
x = w/2;
}

void draw(){
  background(#FF9C1A);
  float r=random(10);
  //ellipse(x,y+r*20,15,15);
  fill(random(255),random(255),random(255));
  ellipse(x,y+50,w,w);
  ellipse(x,y+100,w,w);
  ellipse(x,y+150,w,w);
  ellipse(x,y+200,w,w);
  ellipse(x,width/2,w,w);
  ellipse(x,y+300,w,w);
  x+=inc;
  if(x>width-w/2 || x<w/2){
    inc=-inc;
  }
  }

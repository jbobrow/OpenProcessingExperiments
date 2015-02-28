
int x=0;
void draw(){
  frameRate(30);
  background(0,0,0);
  rect(x,50,5,5);
  fill(255);
  if(x>=100)
  {x=0;
  }
  x=x+1;
}

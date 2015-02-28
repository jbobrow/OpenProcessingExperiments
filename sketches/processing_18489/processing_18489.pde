
void setup(){
  size(300,300);
  noStroke();
  fill(255,0,0);
  ellipse(x,0.5*height,50,50);
  fill(241,238,10);
  ellipse(x+50,0.5*height,50,50);
  fill(0,0,255);
  ellipse(2*x,0.5*height,50,50);
  fill(0,255,0);
  ellipse(width-x,0.5*height,50,50);
  fill(245,152,35);
  ellipse(x/2,0.5*height,50,50);
}
int x=120;
void draw(){
  fill(221,3,245);
  ellipse(mouseX,0.5*height,20,20);
}



void setup(){
  size(300,300);
  colorMode(HSB,width);
  frameRate(50);
}
int x=0;
void draw(){
  background(0,0,300);
  smooth();
  noStroke();
  fill(x,60,200);
  ellipse(width/2,height/2,x,x);
   fill(x,100,180);
  ellipse(width/2,height/2,7*x/8,7*x/8);
  fill(x,140,160);
  ellipse(width/2,height/2,3*x/4,3*x/4);
  fill(x,180,140);
  ellipse(width/2,height/2,5*x/8,5*x/8);
  fill(x,220,120);
  ellipse(width/2,height/2,x/2,x/2);
  fill(x,260,100);
  ellipse(width/2,height/2,3*x/8,3*x/8);
  fill(x,300,80);
  ellipse(width/2,height/2,x/4,x/4);
  x++;
}


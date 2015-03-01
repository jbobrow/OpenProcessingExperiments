
void setup() { 
  size(500, 500); 
  noStroke();
  smooth();
}
void draw() { 
  background(255);
  float x= mouseX;
  float y = mouseY;
  fill(#dd7ca3,150);
  float a=map(x,0,width,0,width/2);
  ellipse(width/2-a,height/2-a,30+x/3,30+x/3);
  ellipse(width/2+a,height/2+a,30+x/3,30+x/3);
  fill(#57b6a2,150);
  ellipse(width/2+a,height/2-a,30+x/3,30+x/3);
  ellipse(width/2-a,height/2+a,30+x/3,30+x/3);
}
 



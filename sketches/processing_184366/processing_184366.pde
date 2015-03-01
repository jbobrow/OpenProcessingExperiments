
void setup() {
  size (500,500);}
  
void draw() {
 int x = 50;
  background(255);
  stroke(random(0,255),0,0);
  strokeWeight(5);
  line(random(0+x,width/2-x),random(x,width/2-x), random(0+x,width/2-x), random(x,width/2-x));
  line(random(width/2+x,width-x), random(x,width/2-x), random(width/2+x,width-x), random(x,width/2-x));
  line(random(0+x,width/2-x), random(height/2+x,height-x), random(0+x,width/2-x), random(height/2+x,height-x));
  line(random(width/2+x,width-x), random(height/2+x,height-x), random(width/2+x,width-x), random(height/2+x,height-x));
  
}



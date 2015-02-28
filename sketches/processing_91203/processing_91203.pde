
void setup() {
  size(1000,500);
  background(0);
}
 
void draw() {
//background(0);
stroke(255);
 for (int a; a<200; a++){xbox(random(width), random(height), random(200));}
 noLoop();
}
 
void xbox(float x, float y, int size) {
noFill();
strokeWeight(2);
stroke(255,100);
 rect(x-size/2,y-size/2,size,size)
 line(x-size/2,y-size/2,x+size/2,y+size/2)
 line(x+size/2,y-size/2,x-size/2,y+size/2)
 ellipse(x,y,size/10,size/10);
}

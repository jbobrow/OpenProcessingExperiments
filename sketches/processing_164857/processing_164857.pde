
void setup(){
  size(500,500);
  smooth();
  noStroke();
}
void draw(){
  background(0);
  fill(100,255,20,60);
  float a=dist(width,height,mouseX,mouseY);
  ellipse(500,0,a,a);
    fill(70,255,50,60);
  ellipse(0,500,a*2,a*2);
  stroke(255);
  line(a/2,0,a*3,500);
  line(a/0.5,0,a/3,500);

}



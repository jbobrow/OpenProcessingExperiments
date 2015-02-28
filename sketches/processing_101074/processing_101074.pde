
int s=1;
void setup(){
  size(200,200);
  background(0);
  frameRate(30);
}
void draw(){
  stroke(random(255),random(255),random(255));
  line(s,1,s,height);
  s=s+5;}

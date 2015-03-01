
void setup(){
  size(600,600);
  background(255);
}
int i;
void draw(){
  translate(width/2,height/2);
  rotate(radians(i));
  stroke(0);
  strokeWeight(0.1);
  noFill();
  translate(width/2,height/2);
  rectMode(CENTER);
  rect(3+i/50,3-i/50,-i/5,-i/5);
  i=i+3;

}



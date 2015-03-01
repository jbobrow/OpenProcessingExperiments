
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
  rectMode(CENTER);
  rect(0,0,i,i);
  i=i+1;

}



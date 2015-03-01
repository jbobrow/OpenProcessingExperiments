
void setup(){
  size(600,600);
  background(255);
}
int i=1;
void draw(){
  translate(width/2,height/2);
  stroke(0);
  strokeWeight(0.2);
  noFill();
  rectMode(CENTER);
  translate(i/100,i/100);
  rotate(radians(i+10));
  rect(i/10,i/10,50+i/10,50+i/10);
  
  i=i+4;

}




void setup(){
  size(600,600);
  background(255);
}
int i;
void draw(){
  translate(width/2,height/2);
  rotate(radians(10+10*i));
  stroke(0);
  strokeWeight(0.2);
  noFill();
  rectMode(CORNER);
  //translate(width/2,height/2);
  rect(10+i/100,10-i/100,i/10,i/10);
  
  i=i+4;

}



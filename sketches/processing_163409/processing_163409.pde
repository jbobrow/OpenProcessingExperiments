
void setup(){
  size(600,600);
  background(255);
}
int i;
void draw(){
  translate(width/2,height/2);
  rotate(radians(i));
  stroke(0);
  strokeWeight(0.2);
  noFill();
  translate(width/2,height/2);
  rectMode(CENTER);
  rect(i/20,i/20,i/3,i/3);
  if(i<20000){ 
    i=i+5;
  }

}



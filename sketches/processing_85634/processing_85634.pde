
float length;
float wide;
 
void setup (){
  size(500,500);
  background(150,200,200);
  length= random(0,450);
  wide= random(0,450);
  strokeWeight(3);
  smooth();
}
 
void draw () {
  translate(width/2,height/2);
  rotate(radians(frameCount%30));
  noFill();
  stroke(random(0,255),random(0,255),random(0,255));
  ellipse(0,0,length,wide);
  length= random(0,450);
  wide= random(0,450);
}




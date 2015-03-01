
void setup(){
  size(500,400);
  smooth();
  noStroke();
  frameRate(120);
}
int rotateY = 0;
void draw(){
  int greyScale = 20; 
  background(0);
  println(frameRate);
  translate(width/2, height/2);
  scale(0.1);
  for(int i = 0; i<=360; i+=45){
  pushMatrix();
  rotate(radians(i+rotateY));
  fill(greyScale);
  ellipse(100, 0, 70,70);
  popMatrix();
  greyScale+=15;
  }
  if(frameCount % 10 == 0){
    
  rotateY+=45;
  }
}

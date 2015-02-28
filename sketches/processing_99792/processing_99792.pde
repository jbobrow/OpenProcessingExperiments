
PFont maTypo=createFont("Segoe Print",40);
void setup(){
  size(400,400);
  smooth();
  background(0);
}
void draw(){

}
void keyReleased(){
  
  stroke(255,255,255,70);
  strokeWeight(5);
  textFont(maTypo);
  textAlign(CENTER,CENTER);
  float x=random(0,360);
  float y=random(20,380);
  fill(random(0,127),random(0,127),random(0,127),127);
  ellipse(x,y,65,65);
  fill(random(128,255),random(128,255),random(128,255));
  text(key,x,y-15);
}



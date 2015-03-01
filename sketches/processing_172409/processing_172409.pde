
/* @pjs font="CooperBlackStd-48.vlw"; */
PFont font;
float angle=0.0;
float speed=0.05;

void setup(){
  size(300,300);
  font=loadFont("CooperBlackStd-48.vlw");
  noStroke();
  textAlign(CENTER);
}
void draw(){
  fill(0);
  rect(0,0,width,height);
  fill(random(mouseX),random(mouseY),100);
  textFont(font);
  angle+=speed;
  float diameter=150+(sin(angle+speed)*45);
    text("love",diameter,diameter);
}

  



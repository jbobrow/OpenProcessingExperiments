
int nd;
void setup(){
  size(295,300);
  background(0);
  smooth();
  frameRate(15);
  cursor(CROSS);
}
void draw(){
  noStroke();
  fill(0,50);
  rect(0,0,width,height);
  fill(255);
  strokeWeight(2);
  nd=100;
  float ad=TWO_PI/nd;
  translate(mouseX,mouseY);
  ellipse(0,0,height/4,height/4
  );
  for(int i=0; i<nd; i++){
    rotate(ad);
    stroke(random(200,255),random(150,255),0);
    line(height/20,0,random(height/7,height/3),0);
  }
}



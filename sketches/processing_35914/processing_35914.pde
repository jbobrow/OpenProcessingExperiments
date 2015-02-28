
float recth = 100;
float rectha = 100;
float recthb = 100;
float rectw = 600;
void setup(){
  background(255);
  size(700,400);
}

void draw(){
  background(0);
  strokeWeight(3);
  stroke(230,120);
  fill(180,120);
  rect(250,recth,150,500);
  //rect(100,recth,100,500);
  //rect(200,recth,100,500);
  rect(rectw,100,800,150);
}
void mouseDragged(){
  recth = mouseY;
  rectw = mouseX;}




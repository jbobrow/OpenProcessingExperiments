
void setup(){
  size(600,600);
}

void draw(){
  background(255);
  
  float qx = 0;
  float qy = 0;
  float b = 0;
  float a = 0;
  float c = 0;
  
  a = random (2000);
  
  line(width/2, a, width/2, height);
  line(a,width/2,width,height/2);
  
  if(mouseX > width/2){
    qx = width/2;
  }
  if(mouseY > height/2){
    qy = height/2;}
    a = random (255);
    b = random (255);
    c = random (255);
  fill(a,b,c);
  rect(qx,qy,width/2,height/2);
}
    void keyPressed() {
  saveFrame("test.png");
}



int value; 

void setup(){
  size(500,500);
  background(22,24,52);
  smooth();
  noStroke();
  ellipseMode(CENTER);
  value = 100;
}
void draw(){
  noStroke();
  fill(value);
   drawCircle(20, 20, 16, 16);
   drawCircle(100, 20, 12, 12);
   drawCircle(300, 60, 10, 10);
   drawCircle(40, 460, 20, 20);
   drawCircle(100, 300, 22, 22);
   drawCircle(200, 90, 18, 18);
   drawCircle(30, 210, 14, 14);
   drawCircle(180, 20, 10, 10);
   drawCircle(30, 210, 14, 14);
   drawCircle(180, 20, 10, 10);
}
void drawCircle(int circX, int circY, int diameter, color c){
  noStroke();
  fill(value);
  ellipse(circX, circY, diameter, diameter);
  dotFunction(250);
}
void dotFunction(int yPos){
  ellipse(width/2, yPos, 100, 100);
}
void mousePressed(){
  if(value == 100){
    value = 220;
  }
  else{
    value = 100;
  }
}


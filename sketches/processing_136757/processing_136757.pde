
//int r=0;
//int g=0;
//int b=0;
float z = 0;
void setup(){
  size(600,600);
  background(0);
}
 
void draw(){
  noFill();
  stroke(161, 84, 150);
  if (mousePressed){
    z+= 5;//increases size
//fill(r,g,b);
    ellipse(mouseX,mouseY, 10+z,10+z);
  }
  else{}
}
  //mouse released returns to fixed size
  void mouseReleased() {
    z= 20;
}




void setup () {

  size(400, 400);
}
  
  
  void draw() {
  background (255);
  int x =0;
  int y =0;
  float angle= 0;
  
  for (x=0; x <=width; x+=20){
    for (y=0; y <= height; y+=20){
      pushMatrix();
      translate (x,y);
      rotate(angle);
      line(0,0,10,10);
      popMatrix();
      angle += mouseX/1000.0;
     }
  }
}


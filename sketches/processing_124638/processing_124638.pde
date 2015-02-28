
void setup(){
  size(600,600);
}

void draw(){
  background(255);
 
  int radius = 100;
  float step = 10;
  
  pushMatrix();
  translate(mouseX,mouseY);
    for( float i = 0; i < 360/step; i++ ){
      line(-width*2,-radius,width*2,-radius);
      rotate(step*PI/180);
    }
  popMatrix();
}

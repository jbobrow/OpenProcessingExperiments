


void setup(){
  
  size(600, 600, P3D);
  background(3,76,255);
}

void draw(){
  
pushMatrix();
  
  float a = 0.0;
  float inc = TWO_PI/100.0;
  
  for (int i = 0; i < 1; i++) {
  translate(width/2, height/2);
  rotateX(TWO_PI*(frameCount%1000)/1000);
  rotateY(TWO_PI*(frameCount%1000)/5);
  line(i*4,200,500,i*4,50,a);
  stroke(254,255,5);}

popMatrix();  
  
    if (mousePressed) {
  //background(3,76,255);
    stroke(255,0,0);
  
   translate(width/2, height/2);
   rotateX(TWO_PI*(frameCount%100)/100);
   rotateY(TWO_PI*(frameCount%100)/100);
   box(100);    
   } else {
   fill(3,255,17,220);

  }
}


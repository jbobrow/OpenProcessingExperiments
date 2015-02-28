
void setup(){
  size (900,700,P3D);
  background (0);
}

void draw(){
  background (0);
  sun();
  earth();
  moon();
  sat();
}
 
void sun(){
  translate (450,350);
  fill(250,200,0);
  sphere(50);
  rotateX(radians(millis()/20));
  rotateY(radians(millis()/20));
}
 
void earth(){
  translate(200,150);
  fill (0,190,255);
  sphereDetail(15);
  sphere(25);
  rotateX(radians(millis()/10));
  rotateY(radians(millis()/10));
}
 
void moon(){
  translate (50,150);
  fill(255);
  sphereDetail(10);
  sphere(12);
  rotateX(radians(millis()/5));
  rotateY(radians(millis()/5));
}

void sat(){
 translate(25,25);
   fill (0,250,200);
  sphere(6);
}
 





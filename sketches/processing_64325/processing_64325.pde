
float t;
 
void setup() {
  size(300, 330, P3D);
   
  colorMode(HSB,360,100,100);
   
  smooth();
}
 
void draw() {
  background(0);
//7:12
  for (int j = -3; j < 7; j++) {
    for (int i = 0; i < 12; i++) {
      noStroke();
      fill(i*30,100,100);
       
      float angleXY = j * 20 ;
      float angleXZ = i * 30  ;
      float x = width/2 + cos(radians(angleXY+t)) * cos(radians(angleXZ)) * 100;
      float y = height/2 + sin(radians(angleXY+t)) * 100;
      float z = cos(radians(angleXY)) * sin(radians(angleXZ)) * 100;
 
      pushMatrix();
      translate(x, y, z);
      ellipse(0,0,5,5);
      popMatrix();
    }
  }
  t++;
}


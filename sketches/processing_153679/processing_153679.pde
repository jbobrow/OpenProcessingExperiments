
int x;
float y;
float z;
float rad;
float pad;
float angle  ;
float qad;
float zad;
void setup(){
  smooth();
  size(400, 400, OPENGL);
}
void draw(){
  background(0);
  translate(width/2, height/2, -height/2);
  scale(10);
  angle += 0.005;
  rotateX(radians((mouseY)));
  rotateZ(radians((mouseX)));
  for(float i = 1; i < 2; i += 1){
    for(float j = 1; j< 3; j += 0.1){
      for(float k = 1; k <5 ; k += 0.1){
   
        stroke(random(0, 255), random(0, 255), random(0,255), random(0, 255)); 
        rad = 20*sin(i*3);
        pad = 20*cos(i*3);
        qad = 0*sin(j*3);
        zad = 0*cos(j*3);
        line(i++, qad,  zad, j++, rad, pad);
 
      }
    }
  }
}




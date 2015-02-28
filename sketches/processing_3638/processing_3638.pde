
float o,t = 320;

void setup (){
  size (700,700,P3D); 
}

PImage a;

void draw (){ 
  background (200,176,188);  
  a = loadImage ("7.jpg"); 
  translate (t,t,o);
  rotateX (o += .01);
  rotateY (o);
  for (float i=0;  i < 6; i += .5){
    image (a,50,0,300,337);
    rotateX(i+.3 * o);
    rotateY(i);
  }
}







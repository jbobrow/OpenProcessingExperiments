
PImage pelota;
float a=0.0;
float speed = 10;
float grav=0.1;
void setup() {
  size(600, 600);  
  pelota = loadImage("ball.png");
  background(0);  
}

void draw() {
   background(3,3,3); 
   image (pelota, 190,a,100,100);
 
 movimiento (); 
 rebote ();
  }
void movimiento (){
  a = a + speed;
  speed = speed + grav;
}
void rebote (){
if (a>=600|| a<=0){
  speed = speed*-0.70;
}
}

void mousePressed(){
  saveFrame ("1.JPG");
  noLoop();
}
void keyPressed(){
  loop();
}


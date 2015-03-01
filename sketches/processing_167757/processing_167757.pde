
float x = 0.0;
float y = 50.0;
float angle = 0.0;
float speed = 0.8;
 
void setup (){
  size (300, 300);
  background (0);
  stroke (255, 130);
  randomSeed (150);
   
}
 
void draw (){
  angle += random (1, -1);
  x += -cos (angle) * speed;
  y += -sin (angle) * speed;
  translate (150, 150);
  rotate (angle/speed);
  beginShape ();
  stroke (200, 100, 213, 25);
  vertex (0, 100);
 vertex ( 0, -150);
 stroke (100, 100, 225, 25);
 vertex (0, 200);
 vertex (0, -300);
 endShape ();
}


float move=1;
float speed=1;
void setup () {
 size (500, 500,P3D);
 smooth();
 }
 
void draw () {
  frameRate(24);
  rectMode(CENTER);
 background (0,50);
 stroke(0);
 noFill();
 drawCircle (width/2, height/2, 200); // call function
 
}
 
//recursive function
 void drawCircle (float x, float y, float radius) {
 noStroke();
   ellipse  (x, y, radius, radius);
 
// exit condition
 if (radius >3) {

rotateY(radians((1+move)/100));
rotateX(radians((1+move)/100));
//rotateZ(radians((1+move)/100));
noStroke();
fill(120,50,100,70);
drawCircle (x+radius/2, y, radius/2);
 drawCircle (x-radius/2, y, radius/2);
drawCircle (x, y+radius/2, radius/2);
 drawCircle (x, y-radius/2, radius/2);
 }
 move = move + speed;
 if ((move >=360) || (move <=1)){
 speed = speed *-1;
 
 }
}



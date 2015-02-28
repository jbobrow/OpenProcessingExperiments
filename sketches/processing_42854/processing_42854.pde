
float x = random(0,600);
float y = random(0,600);
float xspeed =5;
float yspeed =3;
  
void setup() {

  size(600,600);
  smooth();
 
}

void draw () {
    background(255);
// BOUNCING     
  x=x+xspeed;
  y=y+yspeed;
  if((x>width) || (x<0)) {
    xspeed = xspeed*-1;
  }
  
  if ((y>height) || (y<0)) {
    yspeed=yspeed*-1;
  }
  
// WORD SET/ADJUSTMENT  
 if ((y<300) || (y>600)){
   PImage h;
    imageMode(CENTER);
    h = loadImage("hey.jpg");
    image(h, x, y, 80, 60);
 } else {
 PImage i;
    imageMode(CENTER);
    i = loadImage("i.jpg");
    image(i, x, y, 80, 60);
 }


}


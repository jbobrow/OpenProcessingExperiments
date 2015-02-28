
/* espiral en movimiento, con retroceso
*/

ball bola;

void setup() {
  
  size(500, 500);
  
  bola = new ball();
  
}

void draw() {
  rectMode(CENTER);
  fill(0,10);
  noStroke();
  rect(width/2,height/2,width,height);
bola.move();
bola.display();
 //ball settings
}
 class ball{
   
  color a;
  
 // a polar coordinate
float r; // radius value
float theta;
float speed;
float x1;
float y1;
float xp; 
float yp; 

ball() {
  
  a= color (0,0,250);
  r = 50; // radius value
  theta = 1;
  speed = 2;
  x1 = 100;
  y1 = 100;
  xp = r*cos(theta); //add random values to jitter
  yp = r* sin (theta);
  
}

void display(){
 strokeWeight(20);
stroke(250,0,20,40);
noFill ();
ellipse(width/2 +xp,height/2 + yp, 50+r, 50+r);

stroke(a,60);
ellipse(width/2 +xp*-1,height/2 + yp*-1, 50+r, 50+r);

}

void move(){
theta=theta+.1;
r= r+2;
  xp = r*cos(theta);
  yp= r* sin (theta);
if (xp > 400 ) {
xp = 0;
yp=0;



}

while (r == 400) {
theta =theta *-.1;
r = r*-1;

}
}
 }


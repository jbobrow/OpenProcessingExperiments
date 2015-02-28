
float x,y;
float diametre;

void setup()  {
  size(200,200); 
  fill(200,50,100); 
  frameRate(10);
  noStroke();
  diametre = 30;
  x = width / 2;
  y = height / 2;
  smooth();
}


void draw() {
 
 background(200);
 
 if ( random(100) < 10 ) {
   x = random(diametre/2,width-diametre/2);
   y = random(diametre/2, height-diametre/2);
 }
  
  ellipse(x,y,diametre,diametre);
  
}

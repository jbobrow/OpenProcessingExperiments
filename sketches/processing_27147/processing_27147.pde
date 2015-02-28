
float x = random(0, 500);
float y = random(0, 500);
float w = 25;
float h = 25;
float xspeed = random(0, 15);
float yspeed = random(0,15);
void setup() {
  size(500,500);
  smooth();
}
 
void draw() {
  
  
  
  x = x + xspeed;
  y = y + yspeed;
  if((x>width) || (x<0)){
    xspeed = xspeed * -1;
  }
   
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }
  background(0);
  noStroke();
  
  
 

  ellipse(x,y-h/2,25,25);
fill(255);

}


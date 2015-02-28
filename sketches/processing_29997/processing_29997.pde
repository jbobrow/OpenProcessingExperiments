


float x = 50.0;  
float xspeed = 2.0;

float y = 50.0;
float yspeed = 5.0;


void setup() { 
noStroke(); 
background(0);
size(600,600);
smooth();
}


void draw() {
  
  fill(0,10);
  noStroke();
  rect(0,0, width, height);
  
  x = x + xspeed;  
  y = y + yspeed;
 
 if((x > width+50) || (x<=0-50)) {  
     xspeed = xspeed * -1;     
 }
 
 if (( y > height+50) || (y <= 0-50)) {
    yspeed = yspeed * -1;
}


noFill(); 
stroke(255,75);
beginShape(TRIANGLES);
vertex(x, y);
vertex(y, x);
vertex(0, 0);
vertex(x, y);
vertex(y, x);
vertex(width/2, height/2);
vertex(x+100, y+100);
vertex(y-100, x-100);
vertex(width, height);
endShape(CLOSE);
 
}










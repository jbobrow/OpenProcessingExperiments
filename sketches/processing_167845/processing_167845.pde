
float radius = 100;
float diagonalSz;

color c_background = color(255,255,0);
color c_fill  = color(0);

void setup(){
 size(600,600,P3D); 
 lights();
 diagonalSz = sqrt((width/2)*(width/2)+(height/2)*(height/2));
  
}

void draw(){
 translate(width/2, height/2, 0);
 
 rotateX(radians(mouseX));
 rotateY(radians(mouseY));
  background(c_background);
  noStroke();
 fill(c_fill);
 

 
 if(radius>=diagonalSz) {
   radius = 0;
   color t = c_background;
   c_background = c_fill;
   c_fill = t;
 }
 else radius += 10;
 sphere( radius); 

}


class Asteroid{
  
  
  
  
  
  
}

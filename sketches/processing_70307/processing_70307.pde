
float x,y;
float px,py;
float easing = 0.1;
PImage nieve;
 
void setup() {
   size(500,407);
   loadImage("nieve.jpg");
   smooth();
   PImage nieve;
   nieve = loadImage("nieve.jpg");
   background(nieve);
}
 
void draw() {  
   float targetX = mouseX;
   x += (targetX-x) * easing;
   float targetY = mouseY;
   y += (targetY-y) * easing;
   
   float weight = dist(x,y, px,py);
   strokeWeight(weight*1.5);
   line(x,y, px,py);
    
   //back up x and y, so next frame is current and previous
   py=y;
   px=x;
      	
if (mousePressed) { 
  line(x,y, px,py);
  fill(255);
  strokeWeight(5);
 
  
} 

}
 
void mouseClicked()
{
   nieve = loadImage("nieve.jpg");
   background(nieve);
}






import java.util.Random;
float a=1;
 
void setup(){
  //Setting up background size
  size(200,200);
  //Setting up a white background
  background(255);
  
}
 
void draw(){
 
 //circle with expanding size
 fill(91, 180, 218)
ellipse(100,100,a*2,a*2);
fill(20, 6, 145)
ellipse(100,100,a,a);
fill(random(31), random(230), random(217))
ellipse(100,100,a/2,a/2);
//a increases by 3
a=a+3;
//redraws the circles when circles reache their limit
 if (a >300) {
   a=0;
 }
 if (mousePressed) {  //make rectangles when user clicks mouse
     int x = mouseX;
     int y = mouseY;
     fill(28, 230, 5);
rect(x, y, a, a);
fill(19, 145, 35)
rect(x, y, a/2,a/2);
fill(random(32), random(253), random(114))
rect(x, y,a/4,a/4)
}
} 

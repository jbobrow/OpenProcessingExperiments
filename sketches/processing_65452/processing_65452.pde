
/******************************************
*  1st attempt

******************************************/

void setup() {
  size(500, 500); //size(width, height); in pixels
  smooth(); // this turns on anti-aliasing
}
void draw() {
   background(200, 100, 100);
   
   //triangle
   fill(230, 200, 200);
   stroke(255);
    triangle(300, 400, 300, 150, 450, 325);
    
    fill(250, 200, 200);
    stroke(255);
    triangle(100,200,100,50,350,225);
    
    fill(220, 180, 180);
    stroke(255);
    ellipse(150, 150, 50, 75);
    
    fill(250, 200, 200);
    stroke(255);
    ellipse(350,300,75,50);
    
    fill(0);
    stroke(255);
    ellipse(350,300,25,40);
    
    fill(0);
    stroke(255);
    ellipse(150,150,40,25);
    
    fill(250, 100, 100);
    stroke(255);
    rect(50, 300, 200, 100);
    
    fill(0);
    stroke(255);
    triangle(50, 200, 150, 300, 100, 300);
    
    fill(0);
    stroke(255);
    triangle(50, 400, 150, 300, 100, 300);
    
    fill(0);
    stroke(255);
    triangle(150, 400,300, 300, 100, 300);
     
     
}
  
 
  






int counter;

float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;

void setup() {
  size(700,700);
  smooth();
  background(mouseX,mouseY,random(10,100));
}

void draw() {
  noStroke();
  fill(255);
  rect(0,0,width,height);
  
  // Add the current speed to the location.
  x = x + xspeed;
  y = y + yspeed;

  // Check for bouncing
  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  // Display at x,y location
  stroke(0);
  fill(0);
  triangle(0,0,random(mouseX,mouseY),mouseY);
  
  stroke(0);
  fill(0);
  triangle(700,0,random(mouseX,mouseY),mouseY);
  
    stroke(0);
  fill(0);
  triangle(0,700,random(mouseX,mouseY),mouseY);
  
  stroke(0);
  fill(0);
  triangle(700,700,random(mouseX,mouseY),mouseY);
  
  
  //Centros
  
  

  
  stroke(0);
  fill(0);
  triangle(0,350,random(mouseX,mouseY),mouseY);
  
  
  stroke(0);
  fill(0);
  triangle(700,350,random(mouseX,mouseY),mouseY);
  
    stroke(0);
  fill(0);
  triangle(350,350,random(mouseX,mouseY),mouseY);
  
      stroke(0);
  fill(0);
  triangle(350,0,random(mouseX,mouseY),mouseY);
 
  stroke(0);
  fill(0);
  triangle(350,700,random(mouseX,mouseY),mouseY);
  
  
  //CENTRO CENTRO
  

}

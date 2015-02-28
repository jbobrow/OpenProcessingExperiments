
//Jessica Yang
//March 1 2013
//Rep. drawing

float circleY = 25;
float circleYspeed = 2;

void setup() {
  size(500, 500);
}

void draw() {

  background(255);



  //CRAZY LINES
  for (int x = 0; x<width; x+=17) {

  stroke(0, random(255), random(255),35);
    strokeWeight(random(1, 3));
    line(width/2, 0, x, height);
    line(0, height/2, height,x);
    }
 for (int x = 0; x<height; x+=17) {
    stroke(0, random(255), random(255),35);
    strokeWeight(random(1, 3));
   line(width, height/2, 0, x);
   line(width/2, height, x, 0);
    stroke(0,0,0,25);
  strokeWeight(random(2, 3));
   line(mouseX, mouseY, x, 0)
   line(mouseX, mouseY, 0,x)
   line(mouseX, mouseY, width,x)
   line(mouseX, mouseY,x, width)
   
 
   
  }
  
}

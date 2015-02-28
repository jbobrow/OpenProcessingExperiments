


float x;
float y;
float speedx = 7;
float speedy = 10;
void setup() {
  size(500, 500);
  smooth();
  background(255);
  frameRate(10);
}

void draw() {

  for(int i = 0; i < 10; i++){  
      x = x+ speedx*random(1);
      y = y + speedy*random(1);
      if ((x > width) || (x < 0)) {
       speedx = speedx * -1;
       if(x>width){x=width;}
      
      }
      if ((y < 0) ||(y > height)){
       speedy = speedy * -1;
        if(y>height){y=height;}
      }
         
      // Display circle at x location
      stroke(0);
      fill(mouseX, mouseY, 255);
      ellipse(x, y, 32, 32);
 
   }
}




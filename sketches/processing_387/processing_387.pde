
class ship { 
  float x, y; 
  int radius; 
  int direction; 
  float speedX; 
  float speedY; 
  float friction; 
  float stepX; 
  float stepY; 
   
  void move() {  
 
    //PAC-MAN STYLE: if the object passes one edge, comes out the opposite side 
    if(y > height/* || y < 0 || x > width || x < 0*/) { 
       y = 0;
       //direction *= -1; 
     } 
     
    if(y < 0) { 
      y = height; 
    } 
     
    if(x > width) { 
      x = 0; 
    } 
     
    if (x < 0) { 
      x = width; 
    } 
    
    stepX = speedX * direction; 
    stepY = speedY * direction; 
     
    if(abs(stepX) > .1 && abs(stepY) > .1) { 
      y -= stepY; 
      x -= stepX; 
    } 
    speedX *= friction; 
    speedY *= friction; 
  } 
   
  void draw() { 
    ellipse(x, y, radius, radius); 
    intrepid.move();
  } 
   
} 
 
ship intrepid = new ship();
ship barrier = new ship();
 
void setup() { 
  size(600,400);
  intrepid.x = width/2; 
  intrepid.y = height/2; 
  intrepid.radius = 10; 
  intrepid.speedX = 0; 
  intrepid.speedY = 0; 
  intrepid.direction = 1; 
  intrepid.friction = 0.99;
  barrier.x = width/3;
  barrier.y = height/3;
  barrier.radius = 40;
  barrier.direction = 0;
} 
 
void draw() { 
  background(50); 
  intrepid.draw();
  barrier.draw();
} 
 
void keyPressed() { 
  if (key == CODED) { 
 
    if (keyCode == UP) { 
        //while(intrepid.speed < 2) { 
        intrepid.speedY++; 
        //} 
      }  
     
    if (keyCode == DOWN) { 
        intrepid.speedY--; 
      }   
       
    if (keyCode == RIGHT) { 
        //while(intrepid.speed < 2) { 
        intrepid.speedX--; 
        //} 
      }  
     
    if (keyCode == LEFT) { 
        intrepid.speedX++; 
      }   
  } 
}


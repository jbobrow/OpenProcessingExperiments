
class ship { 
  //float x, y; 
  //int xpos[50];
  //int ypos[50];
  int positions = 50;
  int[] xpos = new int[positions];
  int[] ypos = new int[positions];
  //int radius; 
  int direction; 
  float speedX; 
  float speedY; 
  float friction; 
  float stepX; 
  float stepY; 
   
  void move() {  
    int y = ypos[xpos.length-1];
    int x = xpos[xpos.length-1];
    //PAC-MAN STYLE: if the object passes one edge, comes out the opposite side 
    if(ypos[xpos.length-1] > height/* || y < 0 || x > width || x < 0*/) { 
       ypos[xpos.length-1] = 0;
       //direction *= -1; 
     } 
     
    if(ypos[xpos.length-1] < 0) { 
      ypos[xpos.length-1] = height; 
    } 
     
    if(xpos[xpos.length-1] > width) { 
      xpos[xpos.length-1] = 0; 
    } 
     
    if (x < 0) { 
      xpos[xpos.length-1] = width; 
    } 
    
    stepX = speedX * direction; 
    stepY = speedY * direction; 
     
    if(abs(stepX) > .1 && abs(stepY) > .1) { 
      ypos[ypos.length - 1] -= stepY; 
      xpos[xpos.length - 1] -= stepX; 
    } 
    speedX *= friction; 
    speedY *= friction; 
  } 
   
  void draw() {
    xpos = intrepid.xpos;
    ypos = intrepid.ypos;
    for(int i = 0; i < intrepid.xpos.length-1; i++) {
      xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
    }
      for(int i = 0; i < xpos.length; i++) {
      noStroke();
      fill(255 - i*5);
      ellipse(xpos[i], ypos[i], i/5, i/5); 
    }
    intrepid.move();
    
  } 
   
} 
 
ship intrepid = new ship();
//ship barrier = new ship();
 
void setup() { 
  size(600,400);
  smooth();
  //intrepid.xpos = width/2; 
  //intrepid.ypos = height/2; 
  //intrepid.radius = 10; 
  intrepid.speedX = 0; 
  intrepid.speedY = 0; 
  intrepid.direction = 1; 
  intrepid.friction = 0.99;
  for(int i=0; i < intrepid.xpos.length; i++) {
    intrepid.xpos[i] = width/2;
    intrepid.ypos[i] = height/2;
  }
  //barrier.x = width/3;
  //barrier.y = height/3;
  //barrier.radius = 40;
  //barrier.direction = 0;
} 
 
void draw() { 
  background(255); 
  intrepid.draw();
  //barrier.draw();
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


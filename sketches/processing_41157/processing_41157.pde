
class Creature {
  float x, y; 
  int w, h, z, xspeed, yspeed;
  boolean mouse;
  

Creature (float tempX, float tempY, int tempXspeed, int tempYspeed)
{
  x = tempX;      
  y = tempY;
  xspeed = tempXspeed;
  yspeed = tempYspeed;
  mouse = false;


}

void display (){
   
  float r = random (0,255);
  float g = random (0,255);
  float b = random (0,255);
  float a = random (0,100);
  
 if (mousePressed) { 
      fill(255,100,0,100);
    } else {
      fill(r,g,b,a);
    } 
  
  ellipseMode(CENTER);
  rectMode(CENTER); 
  
  stroke(0);
   
  /*fill(r,g,b,a);*/
  ellipse(x,y,20,120);
  ellipse (x, y, 120, 20);

  stroke(0);
  //float w = random(0,255);
  
  
  //fill(r,g,b,100);
  float z = random (10, 90);
  ellipse(x,y,z,z); 
   
  
  //fill(r,g,b,255);
  
  ellipse(x-19,y-30,16,16); 
  ellipse(x+19,y-30,16,16);
  ellipse(x-19, y+30, 16,16);
  ellipse(x+19, y+30, 16,16);
  ellipse(x, y, 16,16);
  
  //fill(255,255,255,100);
  ellipse(x-65, y, 10,10);
  ellipse(x + 65,y, 10,10);
  ellipse(x, y+65, 10,10);
  ellipse(x, y-65,10,10);
  
}

 void mousePressed(int mx, int my) { 
    // Left edge is x, Right edge is x + w
    if (mx > x && mx < x + w) {
      mouse = true;
    } else {
      mouse = false;
    }
  }
  
 
  
void paintCircles (){

  for (int x = 0; x< width; x = x+ 5)
  for (int y = 0; y< height; y = y + 5) {
  noStroke();
  
float r = random (0,255);
float g = random (0,255);
float b = random (0,255);
float a = random (0,255);
float x1 = random (0, 50);
float y1 = random (0, 25);
  fill (r,g,b,a);
  ellipse ( x, y, x1,y1);
    }
}

void travel () {
  x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width) || (x< 0)) {
    xspeed = xspeed * -1;
  }
    if ((y >height || y <0)) {
      yspeed = yspeed * -1;
    }
}
}



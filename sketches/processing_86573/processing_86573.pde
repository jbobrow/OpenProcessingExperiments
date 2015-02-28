
ship shape[];


//change this for a different number of ships;
int numShips = 200;

void setup() {
  size(600,600);
  smooth();
  
  
  
  shape = new ship[numShips];
  
  
  
  for (int i = 0; i < numShips; i++)  {
    shape[i] = new ship(random(3, 13), random(1, height*2), random(1, 40));

  }
 
}

void draw() {
  background(0);
  for (int i = 0; i < numShips; i++)  {
    shape[i].draw();
  }
}

class ship {
  float xpos=0;
  float xspeed = 12.8;  
  float yspeed = 12.2;  
  float ypos = 0;
  float w;
  
  



  ship(float xSpeedvar, float yposvar, float wvar) {
    xspeed = xSpeedvar;
    ypos = yposvar;
    w=wvar;
  }

  void draw() {
    xpos = xpos +  xspeed;
yspeed+=0.4;
ypos+=yspeed;

    if (xpos > width || xpos < 0) {
      xpos=(xpos*-1+width)+5;
    }
    if(ypos>height*2) {
ypos=0;
yspeed=0;
}


   fill(w*5, 0, 255);
    rect(xpos, ypos, w, w/2);
ellipse(xpos+w-1, ypos+w/4, w/2, w/2);
ellipse(xpos+5, ypos+w/2, w/4, w/4);
    ellipse(xpos+w-3, ypos+w/2, w/4, w/4);
triangle(xpos+w,ypos, xpos, ypos, xpos, ypos-7);
}
}


//ball
int xpos=300;
int ypos=200;
int xspeed =5;
int yspeed =3;
//paddle
int  pxpos =25;
int  pyspeed = 4;
int  pypos =200;



void setup() {
  size(600, 400);
}

void draw() { 
  println(pypos);
  if(pypos<=0){ pypos = 0;}
  if (pypos >= 360){pypos=360;}
  
  background(0);
  xpos=xpos + xspeed;
  ypos=ypos+yspeed; 
  ellipse(xpos, ypos, 25, 25);

  if ( xpos>=width) { 
    xspeed =xspeed *-1;
  }


  if (ypos>=height || ypos <= 0) {
    yspeed = yspeed *-1;
  }

  rect( pxpos, pypos, 10, 40);
  if (keyPressed) {
    if (key== 'a') {
      pypos=pypos-pyspeed   ;
    }
    
  }
  if (keyPressed) {
    if (key=='z') {
      pypos=pypos + pyspeed ;
    }
    
  }
  if ( xpos<=pxpos && ypos>=pypos) {
    xspeed=xspeed *-1;
   
  
}
}


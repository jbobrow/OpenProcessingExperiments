
float stiffness = 0.25;
float damping = .75;
float velocityX = 0.0;
float velocityY = 0.0;
float targetY;
float targetX;
float forceX;
float forceY;
float y;
float x;
float speed1 = .01;
float radius1 = 75;
float speed2 = .01;
float radius2 = 75;
float speed3 = .1;
float radius3 = 75;


void setup(){
size(540, 700);
smooth ();
noStroke();
ellipseMode (RADIUS);
}

void draw(){
 float increment1 = .001;
 float increment2 = .0018;
 float increment3 = .0025;
  background (0 );
 
 //ellipse1
  fill (255,20,20,radius1);
  float forceY = stiffness*(targetY-y);
  float forceX = stiffness*(targetX-x);
  velocityX=damping*(velocityX+forceX);
  velocityY=damping*(velocityY+forceY);
  y+=velocityY;
  x+=velocityX;
 ellipse (270,250,radius1,radius1);
  targetY=mouseY;
  targetX=mouseX;
  
  radius1 = radius1 + speed1;
  speed1 +=increment1;
if (radius1 >  125) {speed1 = -speed1;
  
}
    if (radius1 < 75) {speed1 =.01;
}

//ellipse2
 fill (40,200,40,radius2);
 ellipse (200,375, radius2,radius2);
   radius2 = radius2 + speed2;
  speed2 +=increment2;
if (radius2 > 125) {speed2 =-speed2;
  
}
    if (radius2 < 75) {speed2 =.01;
}

//ellipse3
fill (10,30,100,radius3);
 ellipse (325,375, radius3,radius3);
   radius3 += speed3;
  
if (radius3 >125) {speed3 =-speed3;
  
}
    if (radius3 <  75) {speed3 =.1;
}
 
}


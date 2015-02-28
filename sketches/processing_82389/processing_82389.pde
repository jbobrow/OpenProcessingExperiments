
float xPos = 400;
float yPos = 300;
float radius = 80 ;
float eheight = 80;
float ewidth = 80;
float eshrink =5;
float grow =300;
float xspeed = 50;
float yspeed = 50;

void setup () {
  size(500,300);
  
}


void draw () {
background(91, 24, 118);

  ellipse (xPos, yPos, ewidth, eheight);
  eheight = eheight + eshrink;
  ewidth = ewidth + eshrink;
  xPos = xPos+xspeed;
  yPos = yPos+yspeed; 

  if (xPos+radius>width) {
    xspeed = -10;
  }

  if (yPos+radius>height) {
    yspeed = -10;
  }
  if (ewidth>grow) {
    ewidth = -ewidth;
   
  } 



  if (eheight>grow) {
    eheight = -eheight;
    fill(255, 83, 3);
  }


  else if (xPos<radius) {
    xspeed = 10;
  }


  else if (yPos<radius) {
    yspeed = 10;
    fill(255,21,13);  }
}


/* variable for meteo's x, y position*/
float x1 = 0;
float y1 = 0;
float x2 = 0;
float y2 = 0;
float x3 = 0;
float y3 = 0;
/* variable for meteo's x, y position*/

/* variable for meteo's x, y speed*/
float xspeed1;
float yspeed1;
float xspeed2;
float yspeed2;
float xspeed3;
float yspeed3;
/* variable for meteo's x, y speed*/

void setup() { 
  size(650, 600);
  background(150);
  
  /* reset values(random values between 0 to 4) 
  for meteo's x, y speed. This randmo values of x, y makes 
  direction&speed of meteo different*/
  xspeed1 = random(0, 4);
  yspeed1 = random(0, 4);       
  xspeed2 = random(0, 4);
  yspeed2 = random(0, 4);
  xspeed3 = random(0, 4);
  yspeed3 = random(0, 4);
  /* reset values(random values between 0 to 4) 
  for meteo's x, y speed. This randmo values of x, y makes 
  direction&speed of meteo different*/
}

void draw() {  
  /* make it move randomly! using random values! */
  x1 = x1 + xspeed1;
  y1 = y1 + yspeed1;
  x2 = x2 + xspeed2;
  y2 = y2 + yspeed2;  
  x3 = x3 + xspeed3;
  y3 = y3 + yspeed3;
  /* make it move randomly! using random values! */
  
  /* if meteo go out of canvas then reset meteo's x, y position 0(root)
  and reset the x,y speed values 
  to make meteo got different velocity&direction */ 
  if ( x1 > width+30 || y1 > height+30) {
    x1 = 0;
    y1 = 0;
    xspeed1 = random(0, 4);
    yspeed1 = random(0, 4);
  }

  if ( x2 > width+30 || y2 > height+30) {
    x2 = 0;
    y2 = 0;
    xspeed2 = random(0, 4);
    yspeed2 = random(0, 4);
  }

  if ( x3 > width+30 || y3 > height+30) {
    x3 = 0;
    y3 = 0;
    xspeed3 = random(0, 4);
    yspeed3 = random(0, 4);
  }  
  /* if meteo go out of canvas then reset meteo's x, y position 0(root)
  and reset the x,y speed values 
  to make meteo got different velocity&direction */

  
  /* draw meteo */
  ellipse(x1, y1, 30, 30);
  ellipse(x2, y2, 20, 20);
  ellipse(x3, y3, 10, 10);
  /* draw meteo */
}


/* just for fun... change direction&velocity while you dragging mouse*/ 
void mouseDragged() {
  xspeed1 = random(0, 2);
  yspeed1 = random(0, 2);
  xspeed2 = random(0, 2);
  yspeed2 = random(0, 2);
  xspeed3 = random(0, 2);
  yspeed3 = random(0, 2);
}


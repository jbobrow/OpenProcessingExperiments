
int posx;      //setup variables
int posy;
int circleposx;
int circleposy;
int posx2;
int posy2;
int movement;
int r, g, b;
boolean colors;

void setup () {
  size (500, 500);
  smooth();
  circleposx=width;
  circleposy=0;
  posx = 10;              //declare variables
  posy = 10;
  posx2 = 50;
  posy2 = 50;
  movement = 5;
  r = 60;
  g = 230;
  b = 50;
  colors = false;
}

void draw () {    
  background (50, 60, 60); 
  noFill ();
  stroke(r, g, b);
  strokeWeight(4); 
  ellipseMode (CENTER);
  ellipse (circleposx, circleposy, posx2, posy2);   //rectangle
  posx2 += movement;
  posy2 += movement;
  circleposx -= movement;
  circleposy += movement;

  if (posx2 > 50) {
    posx2 = 10;
    posy2 = 10;
  }

  if (circleposx <= 0) {
    circleposx = width;
    circleposy = 0;
  }
  if (circleposy >= 250 && colors==false) {
    colors = true;
    r= 240;
    g=0;
    b=112;
  }
  else if (circleposy >= 250 && r == 240 && colors == true) {
    colors = false;
    r = 60;
    g = 230;
    b = 50;
  }


  pushMatrix();
  pushStyle(); 
  translate (50, 50);       
  rotate (PI/8);
  scale (2, 1);
  circle();
  popStyle();
  popMatrix();

  translate (0, 0);
  scale(1, 1);
} 

void circle () {
  noFill ();
  stroke(0, 222, 240);
  strokeWeight(8); 
  ellipseMode (CENTER);
  ellipse (width/4, height/4, posx, posy);   //rectangle
  posx += movement;
  posy += movement;

  if (posx > 250) {
    posx = 10;
    posy = 10;
  }
}



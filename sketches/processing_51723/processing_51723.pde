
/*
 * Assignment    2
 * Name:         Mfon-ido Ime Akpan
 * E-mail:       makpan@brynmawr.edu
 * Course:       CS 110 - 02
 * Submitted:    2/7/2012
 // This is a scene of a night sky with a moon, clouds and lightning along with a river bordered by a farmland that carries a warning sign to keep off the water.
 */

//declare global variables
int horizon=300;// horizon dividing sky from sea
int w;//width of sketch
int h;//height of sketch
int x;//variable used to determine x coordinate of objects in function calls
int y;// variable used to determine y coordinate of objects in function
int a;//deternmines x value start of  line
int b;// determinge y value of line
void setup () {//set up sketch
  size (800, 600);//size of sketch
  background (0);
  w=width;
  h=height;

  //draw river
  fill (34, 98, 188); 
  rect (0, h/2, w, h/2);
  //draw grass land
  fill (0, 150, 0);
  rect ((w/2)+100, h/2, (w/2)-100, h/2);
  //draw moon halo to indicate brightness
  fill (150, 50);
  noSmooth ();
  noStroke ();
  ellipse (w/8, h/6, ((w/8)+100), ((h/6)+100)); 
  //draw moon 
  smooth ();
  fill (255);
  ellipse (w/8, h/6, w/8, h/6);
  //draw signpost
  fill (250, 133, 23);
  rect (670, 450, 10, 100);
  fill (0);
  stroke (0);
  strokeWeight (2);
  rect ((w/2)+200, (h/2)+100, (w/8)+50, h/6);
  //draw warning sign to keep away from fish
  fill (255);
  ellipse ((w/2)+270, (h/2)+150, w/8, h/6);
  fill (255, 0, 0);
  ellipse ((w/2)+270, (h/2)+160, (w/80)+50, (h/60)+60);
  fill (0);
  ellipse ((w/2)+260, (h/2)+150, w/80, h/60);
  ellipse ((w/2)+280, (h/2)+150, w/80, h/60);
  line ((w/2)+260, (h/2)+160, (w/2)+280, (h/2)+180);
  line ((w/2)+280, (h/2)+160, (w/2)+260, (h/2)+180);
  
  //draw barricade
  int spacing = 30; //variable for deternming where the barricade occurs
  int a=500;
  int b=300;

  while (b<600) {// barricade seperating river from  farmland
    stroke (222, 96, 18);
    strokeWeight (4);
    line (500, b, 550, b+30);
    b = b + spacing;
  }
}

void draw () {
}

void mousePressed () {

  float s = (horizon-mouseY)*.007;//function to scale object to horizon

//drawcloud
  if (mouseY < horizon) {//fuction to draw cloud
    fill (255);
    drawCloud (mouseX, mouseY, s);
  }
  //drawlightning
  if (mouseY<horizon && mouseY>200) {//fuction to draw lightning
    drawLightning (mouseX, mouseY, s);
  }
  //draw fish
  else if (mouseY>horizon && mouseX<(w/2)+50) {//function to draw fish in river
    fill (255, 0, 0);
    noStroke ();
    drawFish (mouseX, mouseY, s*.5);
  }
}
 //This is where I call the draw fish function and define its actual parameters
void drawFish (int x, int y, float scal) {  //function call for fish in river
  ellipse (x, y, 100*scal, 50*scal);
  beginShape ();
  triangle (x-50*scal, y, x-70*scal, y+20*scal, x-70*scal, y-20*scal);
  triangle (x, y+25*scal, x-15*scal, y+35*scal, x+15*scal, y+35*scal);
  triangle (x, y-25*scal, x-15*scal, y-35*scal, x+15*scal, y-35*scal);
  endShape ();  
  fill (0, 0, 150);
  ellipse (x+30*scal, y+10*scal, w/80*scal, h/60*scal);
}
//This is where i call the draw cloud function and define its actual parameters
void drawCloud (int x, int y, float scal) {//function call for cloud
  fill (255);
  noStroke ();
  ellipseMode (CENTER);
  ellipse (x, y+10*scal, 30*scal, 20*scal);
  ellipse (x+10*scal, y-15*scal, 30*scal, 20*scal);
  ellipse (x-10*scal, y-15*scal, 30*scal, 20*scal);
  ellipse (x-20*scal, y-10*scal, 30*scal, 20*scal);
  ellipse (x+30*scal, y-5*scal, 30*scal, 20*scal);
  ellipse (x+15*scal, y-10*scal, 30*scal, 20*scal);
  ellipse (x+30*scal, y-10*scal, 30*scal, 20*scal);
  ellipse (x+10*scal, y+15*scal, 30*scal, 20* scal);
  ellipse (x-10*scal, y+15*scal, 30*scal, 20* scal);
  ellipse (x-10*scal, y+15*scal, 30*scal, 20*scal);
  ellipse (x, y+10*scal, 30*scal, 20*scal);
} 
//This is where I call the draw lightning function and its actual parameters
void drawLightning (int x, int y, float scal) { //function call for lightning
  fill (255);
  quad (x-100*scal, y-100*scal, x-80*scal, y-120*scal, x-60*scal, y-100*scal, x-80, y-80);
}



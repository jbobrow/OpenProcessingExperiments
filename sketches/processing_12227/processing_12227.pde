
//Assignment #2
//Anna Perocchi
//aperocchi@brynmawr.edu	
//September 16, 2010

//set float and int values 
float rocketX;
float rocketY;

int X = 100;
int Y = 100;

void setup () {
  size (500, 500);
  rocketX = 0;
  rocketY = 275;
  smooth ();
  frameRate (120);
  
}

//moon
void draw () {
  background (0);
  noStroke (); 
  fill (255);
  ellipse (X, Y, X - 15, Y - 15); 
  
  //stars
  noStroke (); 
  fill (255);
  ellipse (200, 200, X - 90, Y - 90);
 
  noStroke (); 
  fill (255);
  ellipse (400, 400, X - 90, Y - 90);
 
  noStroke (); 
  fill (255);
  ellipse (150, 450, X - 90, Y - 90); 
  
  noStroke (); 
  fill (255);
  ellipse (250, 400, X - 90, Y - 90); 
  
  noStroke (); 
  fill (255);
  ellipse (75, 400, X - 90, Y - 90); 
  
  noStroke (); 
  fill (255);
  ellipse (400, 75, X - 90, Y - 90);

  noStroke (); 
  fill (255);
  ellipse (300, 125, X - 90, Y - 90);
  
  noStroke (); 
  fill (255);
  ellipse (200, 75, X - 90, Y - 90);
  
  noStroke (); 
  fill (255);
  ellipse (370, 220, X - 90, Y - 90);
  
  noStroke (); 
  fill (255);
  ellipse (50, 40, X - 90, Y - 90);
  
  noStroke (); 
  fill (255);
  ellipse (335, 450, X - 90, Y - 90);
  
  //body (rectangle) part of rocket 
  stroke (255);
  fill (220, 50, 0);
  rect (rocketX, rocketY, 100, 50);
  
  //set conditionals so rocket can move across the screen continually 
  rocketX = rocketX + 1;
  
  
  if(rocketX > width) {
    rocketX = 0;
  }
  if(rocketY > width) {
    rocketY = 0;
  }
  
  //nose cone of rocket (brown triangle)
  stroke (255);
  fill (150, 50, 0);
  triangle (rocketX + 100, rocketY, rocketX + 150, rocketY + 27, rocketX + 100, 325);
  
  //rocket's fire
  noStroke ();
  fill (255, 150, 0);
  triangle (rocketX, rocketY, rocketX - 40, rocketY + 15, rocketX, rocketY + 25);
  
  noStroke ();
  fill (255, 150, 0);
  triangle (rocketX, rocketY + 20, rocketX - 50, rocketY + 30, rocketX, rocketY + 40);
  
  noStroke ();
  fill (255, 150, 0);
  triangle (rocketX, rocketY +35, rocketX - 38, rocketY + 44, rocketX, rocketY + 51);

    
  
}

//moon and stars get bigger when mouse is pressed
void mousePressed () {
  X = X + 20;
  Y = Y + 20;
  
}
//if a key is pressed, moon and stars return to original setting 
void keyPressed () {
  X = 100;
  Y = 100;
  
}


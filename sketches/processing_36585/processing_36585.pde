
//homework 4
//copyright Christina Lee September 2011 Pittsburgh, PA 15289


//global variables
char i;
color blk, whte, cyan, fush, yell;
int x, y, wd, ht, wd2, ht2;


//setting up "canvas" and assigning global variables
void setup ()
{
  size(500, 500);  
  noFill();  
  smooth();  
  background(0, 0, 0);     
  x = 250;
  y = 250;
  wd = 400;
  ht = 400;
  wd2 = 400;
  ht2 = 400;
  blk = color(0, 0, 0);
  whte = color(255, 255, 255);
  cyan = color(0, 255, 255);
  fush = color(255, 0, 255);
  yell = color(255, 255, 0);
}



//drawing the background and initials
void draw () {


  //trippy background
  noStroke();
  fill(whte);  
  ellipse(x, y, 1.85*wd2, 1.85*ht2);  
  fill(blk);  
  ellipse(x, y, 1.8*wd2, 1.8*ht2);  
  fill(whte);  
  ellipse(x, y, 1.75*wd2, 1.75*ht2);  
  fill(blk);  
  ellipse(x, y, 1.7*wd2, 1.7*ht2);  
  fill(whte);  
  ellipse(x, y, 1.65*wd2, 1.65*ht2);  
  fill(blk);  
  ellipse(x, y, 1.6*wd2, 1.6*ht2);  
  fill(whte);  
  ellipse(x, y, 1.55*wd2, 1.55*ht2);  
  fill(blk);  
  ellipse(x, y, 1.5*wd2, 1.5*ht2);  
  fill(whte);  
  ellipse(x, y, 1.45*wd2, 1.45*ht2);  
  fill(blk);  
  ellipse(x, y, 1.4*wd2, 1.4*ht2);  
  fill(whte);  
  ellipse(x, y, 1.35*wd2, 1.35*ht2);  
  fill(blk);  
  ellipse(x, y, 1.3*wd2, 1.3*ht2);  
  fill(whte);  
  ellipse(x, y, 1.25*wd2, 1.25*ht2);  
  fill(blk);  
  ellipse(x, y, 1.2*wd2, 1.2*ht2);  
  fill(whte);  
  ellipse(x, y, 1.15*wd2, 1.15*ht2);  
  fill(blk);  
  ellipse(x, y, 1.1*wd2, 1.1*ht2);  
  fill(whte);  
  ellipse(x, y, 1.05*wd2, 1.05*ht2);  
  fill(blk);  
  ellipse(x, y, wd2, ht2);  
  fill(whte);  
  ellipse(x, y, 0.95*wd2, 0.95*ht2);  
  fill(blk);  
  ellipse(x, y, 0.9*wd2, 0.9*ht2);  
  fill(whte);  
  ellipse(x, y, 0.85*wd2, 0.85*ht2);  
  fill(blk);  
  ellipse(x, y, 0.8*wd2, 0.8*ht2);  
  fill(whte);  
  ellipse(x, y, 0.75*wd2, 0.75*ht2);  
  fill(blk);  
  ellipse(x, y, 0.7*wd2, 0.7*ht2);  
  fill(whte);  
  ellipse(x, y, 0.65*wd2, 0.65*ht2);  
  fill(blk);  
  ellipse(x, y, 0.6*wd2, 0.6*ht2);  
  fill(whte);  
  ellipse(x, y, 0.55*wd2, 0.55*ht2);  
  fill(blk);  
  ellipse(x, y, 0.5*wd2, 0.5*ht2);  
  fill(whte);  
  ellipse(x, y, 0.45*wd2, 0.45*ht2);  
  fill(blk);  
  ellipse(x, y, 0.4*wd2, 0.4*ht2);  
  fill(whte);  
  ellipse(x, y, 0.35*wd2, 0.35*ht2);  
  fill(blk);  
  ellipse(x, y, 0.3*wd2, 0.3*ht2);  
  fill(whte);  
  ellipse(x, y, 0.25*wd2, 0.25*ht2);  
  fill(blk);  
  ellipse(x, y, 0.2*wd2, 0.2*ht2);  
  fill(whte);  
  ellipse(x, y, 0.15*wd2, 0.15*ht2);  
  fill(blk);  
  ellipse(x, y, 0.1*wd2, 0.1*ht2);  
  fill(whte);  
  ellipse(x, y, 0.05*wd2, 0.05*ht2); 

  //Begin drawing C
  strokeWeight(7);
  noFill();  
  stroke(cyan);  
  beginShape();  
  curveVertex(x-0.4*wd, y-0.2*ht);  
  curveVertex(x-0.2*wd, y-0.2*ht);  
  curveVertex(x-.3*wd, y-0.3*ht);  
  curveVertex(x-0.5*wd, y-0*ht);  
  curveVertex(x-0.3*wd, y+0.3*ht);  
  curveVertex(x-0.2*wd, y+0.2*ht);  
  curveVertex(x-0.4*wd, y+0.4*ht);  
  endShape(); 

  //Begin drawing a
  stroke(fush);  
  ellipse(x-5, y, 0.3*wd, ht);  
  beginShape();  
  curveVertex(x+0.14*wd, y-0*ht);  
  curveVertex(x+0.14*wd, y-0*ht);  
  curveVertex(x+0.16*wd, y+0.25*ht);  
  curveVertex(x+0.2*wd, y+0.45*ht);  
  curveVertex(x+0.2*wd, y+0.45*ht);  
  endShape(); 

  //begin drawing A tail
  beginShape();  
  curveVertex(x+0.14*wd, y-0*ht);  
  curveVertex(x+0.14*wd, y-0*ht);  
  curveVertex(x+0.145*wd, y-0.25*ht);  
  curveVertex(x+0.15*wd, y-0.48*ht);  
  curveVertex(x+0.16*wd, y-0.48*ht);  
  endShape(); 

  //begin drawing L
  stroke(yell);  
  beginShape();  
  curveVertex(x+0.2*wd, y-0.45*ht);  
  curveVertex(x+0.2*wd, y-0.45*ht);  
  curveVertex(x+0.2*wd, y+0.3*ht);  
  curveVertex(x+0.2*wd, y+0.3*ht);  
  endShape();  
  beginShape();  
  curveVertex(x+0.2*wd, y+0.3*ht);  
  curveVertex(x+0.2*wd, y+0.3*ht);  
  curveVertex(x+0.4*wd, y+0.3*ht);  
  curveVertex(x+0.4*wd, y+0.3*ht);  
  endShape();
}


//Altering the width and height of both initials and background through arrow keys
void keyPressed( )

{ //increasing width of initials, decreasing width of the background
  if (keyCode == RIGHT) {
    wd2 = wd2 + 20 ;
    wd = wd - 20;
  }

  //decreasing width of initials, increasing width of background
  else if (keyCode == LEFT) {
    wd2 = wd2 - 20;
    wd = wd + 20;
  }

  //increasing height of initials, decreasing height of background
  else if (keyCode == UP) {
    ht2 = ht2 + 20;
    ht = ht - 20;
  }

  //decreasing height of initials, increasing height of background
  else if (keyCode == DOWN) {
    ht2 = ht2 - 20;
    ht = ht + 20;
  }

  //assigning "R" as reset button
  else if (key == 'r') {
    wd2 = 400;
    ht2 = 400;
    ht = 400;
    wd = 400;
    cyan = color(0, 255, 255);
    fush = color(255, 0, 255);
    yell = color(255, 255, 0);
  }

  //assigning "W" as white initial button
  else if (key == 'w') {
    cyan = whte;
    fush = blk;
    yell = whte;
  }

  //assigning "Q" as black initial button
  else if (key == 'q') {
    cyan = blk;
    fush = whte;
    yell = blk;
  }
}


//inverting the background colors by pressing mouse
void mousePressed( )
{ 
  if ( mousePressed == true) {
    color temp = blk;
    blk = whte;
    whte = temp;
  }
}



//Lauren Hartman
//lmhartma@andrew.cmu.edu
//© Lauren Hartman, September 2013

void setup()
{
  size (400, 400);
  background (77, 76, 74);
}

void draw ()
{
  prepScreen();//signature of the definition
  
  if (mouseX !=0 && mouseY !=0);
  {
    figure (mouseX, mouseY, width-mouseX, height-mouseY);
    figure(mouseY, mouseX, width-mouseX, height-mouseY);
  } 
}

void prepScreen()//the definition (action) of the signature
{
  fill(77, 76, 74, 10);
  rect (0,0, width, height);
}

void figure ( float x, float y, float wd, float ht)
{
// setup
size (400, 400);
rectMode (CENTER);
background (215,60,5);
smooth ();

//variables

//circle
noFill ();
noStroke ();
ellipse (x,y,wd,ht);

// the 'stache
fill (255,255,255);
stroke(255,255,255);
strokeWeight(6);
beginShape ();
  curveVertex(x - wd* .25,  y + ht* .16);
  curveVertex(x - wd* .20,  y + ht* .20);
  curveVertex(x - wd* .08,  y + ht* .12);
  curveVertex(x + wd* .08,  y + ht* .12);
  curveVertex(x + wd* .20,  y + ht* .20);
  curveVertex(x + wd* .25,  y + ht* .16);
endShape();
beginShape ();
fill (255,255,255);
stroke (255,255,255);
strokeWeight (6);
  curveVertex(x - wd* .25,  y + ht* .18);
  curveVertex(x - wd* .20,  y + ht* .20);
  curveVertex(x - wd* .08,  y + ht* .22);
  curveVertex(x + wd* .08,  y + ht* .22);
  curveVertex(x + wd* .20,  y + ht* .20);
  curveVertex(x + wd* .25,  y + ht* .18);
endShape();

//nose, 'L'
stroke (255, 170, 150);
noFill ();
strokeWeight (3);
line(180, 135, 185, 135);
strokeWeight(3);
line(185, 135, 185, 205);
noFill();
strokeWeight(3);
arc(200, 205, 30, 30, HALF_PI, PI);

//glasses
fill (140, 240, 255, 75);
stroke (100, 60,22);
strokeWeight (6);
rect (140,155,70,60, 5,5,40,40); //L
rect (250,155,70,60, 5,5,40,40); //R

//eyes
noFill();
stroke (255,255,255);
strokeWeight(3);
arc(140, 145, 30, 40, 0, PI, OPEN);//L
arc(250, 145, 30, 40, 0, PI, OPEN);//R

//eye brows
noFill();
stroke (255,255,255);
strokeWeight(8);
line(120, 105, 150, 110);//L
line(240, 110, 270, 105);//R

//cheeks
noStroke();
  fill(255, 200, 150, 90);
  ellipse(140, 210, 25, 25); //L
  ellipse(255, 210, 25, 25); //R

//mouth
noFill();
stroke (255,255,255);
strokeWeight(4);
line(180, 250, 220, 250);//L
  
//chin
noFill();
stroke (255,255,255);
strokeWeight(3);
arc(200, 280, 30, 20, 0, PI, OPEN);
}


//Juan's take on Durer's Adam and Eve...


  size(368,480);
  smooth();
 
    PImage b;
b = loadImage("durer.jpg");
image(b, 0, 0);

{
smooth();
noStroke();
fill(254, 255, 0);
ellipse(140, 84, 60, 60);
fill(254, 255, 0);
ellipse(275, 110, 60, 60);}

{
  stroke(1);
arc(140, 99, 40, 20, PI, TWO_PI-PI/2);
  stroke(2);
arc(275, 123, 40, 20, TWO_PI-PI/2, TWO_PI);}

{
  fill(0, 0, 0);
  ellipse(133, 80, 8, 8);
ellipse(155, 80, 8, 8);
ellipse(280, 99, 8, 8);
ellipse(270, 99, 8, 8);
}


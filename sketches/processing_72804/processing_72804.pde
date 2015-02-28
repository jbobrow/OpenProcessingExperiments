
size (550, 550);
background(0);
smooth();

for (int i=0; i<width; i++) {
  strokeWeight(2);
  stroke(random(30, 255));
  point(random(width), random(height));
}

PImage earth = loadImage("270px-The_Earth_seen_from_Apollo_17.gif");
imageMode(CENTER);
image (earth, width/1.5, height/2.5, 270/1.5, 270/1.5);

PImage moon = loadImage("20090310%20The%20Full%20Moon.gif");
imageMode(CENTER);
image (moon, width/2, height/1.5, 1050/2, 750/2);

PFont hc = loadFont("Helvetica-Compressed-48.vlw");
textFont(hc, 48);
text("MOON FESTIVAL", width-width/2, height/1.5);

stroke(100);
ellipse(width/2.5, height/1.25, 100, 100);

PImage ear = loadImage("Bunny_Ears.png");
imageMode(CENTER);
image (ear, width/1.625, height/6, 500/3, 500/3);






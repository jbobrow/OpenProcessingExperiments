
size(300, 300);
smooth();
background(0);
noFill();

//circles growing from the top left to bottom right
for ( int h = 5; h < 500; h += 5) {
  colorMode(HSB, 300);
  stroke(h, h, random(50,300));
  ellipseMode(CENTER);
  ellipse(h, h, h, h);
}

//creates rectangles around the center at random
for ( int i = 10; i < 300; i += 20) {
 rectMode(CENTER);
 stroke(100, i, i);
 rect(width/2, height/2, i, random(100,300));
 }



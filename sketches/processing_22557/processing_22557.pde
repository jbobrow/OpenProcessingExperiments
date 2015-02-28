

PImage sunset; // PImage stores images
int xpos = 0;

void setup(){
  size(500,335);
  background(0);
  sunset = loadImage("sunset.jpg");
}


void draw(){
  //image(sunset,0,0); // draw the image
  int xp = int(random(width));
  int yp = int(random(height));
  color c = sunset.get(xp,yp);// get colour at xpos,ypos
  fill(c,50); // fill with that colour
  noStroke();
  rect(xp,yp,random(10,50),random(10,50));
}


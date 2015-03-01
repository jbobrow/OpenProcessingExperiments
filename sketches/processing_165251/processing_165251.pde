

PImage img;
int direction = 1;

float signal;

void setup()
{

  size(259,194);
  img = loadImage("physics.jpg");
  //stroke(255);
  img.loadPixels();
}

void draw()
{
  filter(ERODE);
  loadPixels();
  if (signal > img.width-1 || signal < 0) {
    direction = direction * -1;
  }
  if (mousePressed == true) {
    signal = abs(mouseY % img.width);
  } else {
    signal += (0.3*direction);
  }

  if (keyPressed == true) {
    set(0, 0, img);
    line(signal, 0, signal, img.height);
  } else {
    for (int y = 0; y < img.height; y++) {
      for (int i = 0; i < img.width; i++) {
        pixels[y*img.width + i] = img.pixels[y*img.width + int(signal)];
      }
    }
    updatePixels();
  }
filter(ERODE);
noStroke();
fill(random(0,255),random(1,255),random(1,255));
ellipse(random(0,249),random(0,184),random(0,50),random(0,50));
fill(random(0,225));
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);
rect(random(0,249),random(0,184),3,3);



if(mousePressed == true ) { 
    fill(random(0,255), random(0,255), random(0,255));
   
    filter(ERODE);
    noStroke();
    ellipse(mouseX+random(-100,100), mouseY+random(-100,100), 25, 25);
 ellipse(mouseX+random(-100,100), mouseY+random(-100,100), 25, 25);
}
}



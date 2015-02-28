
PImage sand;
int seconds;

void setup() {
  size(1000, 1000);
  background(0);
  sand = loadImage( "sand.jpg" );
}

void draw() {
 
 seconds = second();
 image(sand,0,0); 
 
 for (int seconds=0; seconds < 90; seconds++);
    fill(68, 148, 250, 90);
    noStroke();
    ellipse(500, 500, 20*seconds, 20*seconds);
  
}


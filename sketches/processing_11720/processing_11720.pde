
// Albers Square Machine

int hueoffset = 20;
int numsquares = 3;

void setup(){
  size(600,600);
  noStroke();
  colorMode(HSB);
  rectMode(CENTER);
}

// colours
// defult RGB
// HSB - hue, saturation, brightness - hue 0=red, 60=green? ...

void draw(){

  for(int s=0; s<numsquares; s=s+1){
    fill(hueoffset+(s*10),255,255); // use s to gradually change the hue
    int ypos = 300+(s*20); // increase y position
    int squaresize = 600 - (s*100); // decrease the size
    rect(300,ypos,squaresize,squaresize); // draw the square
  }
}

void mouseReleased(){
  hueoffset = int(random(225)); // set hue offset to a new random value, convert from float (all randoms are floats/decimals) toint by wrapping
  numsquares = int(random(3,8));
}



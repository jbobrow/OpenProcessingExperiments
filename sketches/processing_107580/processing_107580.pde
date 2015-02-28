
int numStars = 2500;
// reserve space for stars
Star[] sun = new Star[numStars];
// mouseX
int mx;

void setup() {
  size(600,600);
  background(0);
  noStroke();
   
  // create the stars
  for(int i=0; i<numStars; i++) {
    sun[i] = new Star();
  }
}

void draw() {
  background(0);
 mx = mouseX;
  // make the stars change its brightness
  for(int i=0; i<numStars; i++) {
    sun[i].shine();
  }
  println(frameRate);
}

// A Star object. We will have many instances of these
class Star {
  // They are born dark
  float x, y, bri = -1, dir, sz,dist;
  void shine() {
    // if the star has completely faded to black
    // make it reappear somewhere else
    // (random position, random size and random brightness increase speed)
    if(bri < 0) {
      x = random(width);
      y = random(height);
      sz = random(3);
      dir = random(1, 3);
      bri = 0;
      dist = random(width);
    }
    // set the brightness and draw the star
    
    fill(bri*(max(0,dist-mx)/width/1f));
    ellipse(x, y, sz, sz);
    // increase or decrease the brightness
    bri = bri + dir;
    // if it achieved maximum brightness
    // choose a random fade out speed
    if(bri > 255) {
      bri = 255;
      dir = random(-1, -3);
    }
  }
}


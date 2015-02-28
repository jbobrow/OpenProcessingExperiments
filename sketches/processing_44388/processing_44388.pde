
//  R.A. Robertson 2009.02 "Sunflower" ~ www.rariora.org ~

float angle = 0.0;
float speed = .08;
float amp = 0;
float step = .05;
boolean toggleLoop = true;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  background(0, 35, 0);
}

void draw() {
  fill(0, 1);
  fill(255, 255, 0, 20);
  angle = angle + speed;
  amp = amp + step; //Default .1, increase value increases spacing

  float r = (width/80);
  float x = (width/2) + (sin(angle + PI) * amp); 
  float y = (width/2) + (sin(angle + (.5*PI)) * amp);

  if (y >= height * .99) {
    step = -step; //Thanks Bill!
  }

  ellipse(x, y, r, r);

}

// Mouse toggle code by amnon.owed
// http://forum.processing.org/topic/mouse-toggle-loop
void mousePressed() {
  if (toggleLoop) { 
    noLoop(); 
    toggleLoop = false;
  }
  else { 
    loop(); 
    toggleLoop = true;
  }
}



// the sin function used in map() is from a 'bees & bombs' sketch
// http://beesandbombs.tumblr.com/post/65550137124/shapes
// by dave

int delay = 60;
  
void setup() {
  size(500, 500);
  noStroke();
  rectMode(CENTER);
  //frameRate(10);
}

float time, x, y, d,f;

void draw() {
  time = map(frameCount, 0, delay, 0, 1);

  background(248);

  for (int i=-16; i<=15; i++) {
    for (int j=-16; j<=15; j++) {
      x = width/2 + (i+.5)*12.5; 
      y = height/2 + (j+.5)*12.5;
      d = map(sin(0.02*dist(x, y, width/2, height/2) - TWO_PI*time), -1, 1, -5, 5);
      f = map(sin(0.02*dist(x, y, width/2, height/2) - TWO_PI*time), -1, 1, 0, 200);
      fill(f, 200);
      stroke(0, 200);
      noStroke();
      ellipse(x+d, y+d, abs(d)+1, abs(d)+1);

    }
  }
/*
  saveFrame("frame-##.gif");
  if (frameCount == delay)
    exit();
*/
} 


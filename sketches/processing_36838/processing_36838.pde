
//Each time a random skyline will appear and in it random windows will light up!

void setup() {
  size(500, 250);
  background(77, 190, 211);
  smooth();
  noStroke();
  fill(233, 44, 42);
  ellipse(450, 70, 50, 50);
}

float count=0;
float num=500;
float x;
float y;

void draw() {
  x=random(10, 15);//varying heights of the windows
  y=random(-height);//varying heights of the skyscrappers

  if (count < width) {   //stops the skyline at the width of the screen
    fill(40);
    rect(count * 50, height, random(20, 70), y);

    if ((y<=-150) && (y>=-height)) {//if the buildings are between these two numbers then they will have windows light up
      fill(255, 247, 8);
      rect(10+ count*50, -y, random(10), x);
    }
  }

  count++;
}




size(400, 400);
background(50);
smooth();

//noStroke();
ellipseMode(CENTER);
fill(255);
strokeWeight(3);


float x = 50;
float y = 50;
float w = 100;

int steps = 5;


for (int i=0; i<7; i++) {

  for (int j=0; j<9; j++) {
    //fill(100 - j * 100);
    float percent = i / (float)steps;
    strokeWeight((2 - percent) * 2);
    noFill();
    ellipse(x, y, w, w);
    //w = w * 0.9;
    w = sin(w) * 330;
    y = y + 39;
  }
  x = x + 50;
  y = 50;
}

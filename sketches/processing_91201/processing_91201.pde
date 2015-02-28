
//Dongjae "Krystofer" Kim
//26 Feb 2013
//For Loops

float w, h;

void setup() {
  size(600, 600);
  smooth();
  frameRate(30);
  w = random(5);
  h = random(5);
  strokeWeight(1);
}

void draw() {
  background(0);
  for ( int x = 0; x < 600; x+=10 ) {
    stroke(x, mouseY, mouseX);

    line(mouseX, mouseY, x, random(height));
    noFill();

    ellipse(mouseX, x, w, h);
    ellipse(x, mouseY, w, h);

    stroke(mouseX, x, x,120);
    ellipse(x, x, mouseX, mouseY);


    if (!mousePressed) { 
      w++;
      h++;
    } 
    else {
      w = 0;
      h = 0;
    }
  }
}

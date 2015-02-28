
float a = 0;
float b = 0;

void setup() {
  size(800, 600);
  smooth();
  frameRate(20);
}

void draw() {
  background(255);
  noStroke();
  if (a >= width/2) {
    fill(250, 157, 8);
    arc(0, 0, 200, 220, PI, TWO_PI - PI/2);
    arc(0, 0, 200, 220, TWO_PI - PI/2, TWO_PI);
    a = mouseX;
    }
  if (b >= height/2) {
    fill(250, 157, 8);
    arc(width/2, b, 200, 300, 0, PI/2);
    arc(width/2, height - b, 200, 300, PI/2, PI);
    b = mouseY;
   }
    else 
    fill(a, b, 200);
    arc(width/2, b, 200, 300, 0, PI/2);
    arc(width/2, height - b, 200, 300, PI/2, PI);
    arc(a, height/2, 200, 220, PI, TWO_PI - PI/2);
    arc(width - a, height/2, 200, 220, TWO_PI - PI/2, TWO_PI);
    a += 1;
    b += 1;
    fill(50, mouseX - 250, mouseY - 250, 15);
    stroke(150);
    rectMode(CENTER);
    rect(a, b, width/2, height/2); 
    rect(width - a, b, width/2, height/2);
    rect(a, height - b, width/2, height/2);
    rect(width - a, height - b, width/2, height/2);  
    ellipse(width/2, b, width/2, height/2);
    ellipse(width/2, height - b, width/2, height/2);
    ellipse(a, height/2, width/2, height/2);
    ellipse(width - a, height/2, width/2, height/2);
    ellipse(width/2 - a, height/2 - b, a, b);
    ellipse(width/2 + a, height/2 + b, a, b);
    ellipse(width/2 - a, height/2 + b, a, b);
    ellipse(width/2 + a, height/2 - b, a, b);
}



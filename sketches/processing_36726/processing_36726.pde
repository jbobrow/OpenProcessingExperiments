
void setup() {
  size(600, 600);
  smooth();
  background(10);
}

// Number of circles per type
int circles = 75;
int x = 25;

void draw() {

  //circles fade left to right
  if (circles > 0) {
    noStroke();
    ellipseMode(CENTER);
    fill(240, 90);
    ellipse(random(width/8), random(height), 25, 25);
    fill(240, 80);
    ellipse(random(2*width/8), random(height), 25, 25);
    fill(240, 70);
    ellipse(random(3*width/8), random(height), 25, 25);
    fill(240, 60);
    ellipse(random(4*width/8), random(height), 25, 25);
    fill(240, 50);
    ellipse(random(5*width/8), random(height), 25, 25);
    fill(240, 40);
    ellipse(random(6*width/8), random(height), 25, 25);
    fill(240, 30);
    ellipse(random(7*width/8), random(height), 25, 25);
    fill(240, 20);
    ellipse(random(width), random(height), 25, 25);

    //circles fade top to bottom
    fill(240, 90);
    ellipse(random(width), random(height/8), 25, 25);
    fill(240, 80);
    ellipse(random(width), random(2*height/8), 25, 25);
    fill(240, 70);
    ellipse(random(width), random(3*height/8), 25, 25);
    fill(240, 60);
    ellipse(random(width), random(4*height/8), 25, 25);
    fill(240, 50);
    ellipse(random(width), random(5*height/8), 25, 25);
    fill(240, 40);
    ellipse(random(width), random(6*height/8), 25, 25);
    fill(240, 30);
    ellipse(random(width), random(7*height/8), 25, 25);
    fill(240, 20);
    ellipse(random(width), random(height), 25, 25);
  }
  circles--;

  //lines on top half
  if (x>0) {
    strokeWeight(5);
    stroke(255, 255, 0, 75);
    line(random(width), 0, random(width), random(height/2));
    stroke(255, 255, 0, 50);
    line(random(width), 0, random(width), random(height/2));
    stroke(255, 255, 0, 25);
    line(random(width), 0, random(width), random(height/2));

//lines on left half
    stroke(255, 255, 0, 75);
    line(0, random(height), random(width/2), random(height));
    stroke(255, 255, 0, 50);
    line(0, random(height), random(width/2), random(height));
    stroke(255, 255, 0, 25);
    line(0, random(height), random(width/2), random(height));
  }
  x--;
}



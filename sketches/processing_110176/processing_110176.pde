
void setup() {
    size(800, 400);
    smooth();
    frameRate(3);
    strokeWeight(1);
    stroke(255);
    background(0);
} 

int lastX = random(width);
int lastY = random(height);

void draw() {
    //background(0, 0, 0, 20);

    int nextX = random(width);
    int nextY = random(height);

    // draw the line
    line(lastX, lastY, nextX, nextY);
    
    lastX = nextX;
    lastY = nextY;
    
    fill(random(255), random(255), random(255), 150);
    //draw the figure
    var r = ceil(random(0, 3));
    switch(r) {
     case 1: 
      rect(nextX-5, nextY-5, 10, 10);
      break;
     case 2: 
      ellipse(nextX, nextY, 10, 10);
      break;
     case 3:
      triangle(nextX, nextY-5, nextX+5, nextY+5, nextX-5, nextY+5);
      break;
     }
}

void mousePressed() {
    background(0, 0, 0, 10);
    stroke(random(255), random(255), random(255));
}

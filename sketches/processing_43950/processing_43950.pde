
int radius = 50;
float x = -radius;
float speed = 50;
float easing = 1;
float xy = 60;

void setup () {
  size (600, 600);
  smooth();
  ellipseMode(RADIUS);
}

void draw () {
  background(190);

  if (mousePressed) {
    fill(0);
    arc(x, 200, radius, radius, 0.79, 5.81);
    fill(255);
    ellipse(x, 170, 10, 10);
    noStroke();
    fill(255, 0, 0);
    ellipse (x, 170, 2, 2);
    fill(0);
    rect(x, 200, 50, 10);
  } 
  else { 

    x+= speed;
    if (x>width+radius) {
      x =-radius;
    }
    fill(0);
    arc(x, 200, radius, radius, 0.52, 5.76);
    fill(255);
    ellipse(x, 170, 10, 10);
  }

noStroke();
if (mousePressed) {
  fill(0);
  rect(xy, 250, 50, 100);
  fill(255);
  ellipse(xy+8,280,3,3);
  ellipse(xy+40,280,3,3);
  rect(xy, 350, 10, 50);
  rect(xy+40,350,10,50);
}else {
  int targetXy = mouseX;
  xy += (targetXy - xy) * easing;
  fill(0);
  rect(xy, 250, 50, 100);
  
  rect(xy, 350, 10, 50);
  rect(xy+40,350,10,50);
}
}
     
                


float clownX=100;
float clownY=400;

void setup() {
  size (800, 400);
  smooth();
}

void draw() {
  rectMode(CENTER);

  //Head
  ellipseMode(CENTER);
  fill(255);
  ellipse(clownX, clownY, 100, 100);

  //Hat
  strokeWeight(10);
  stroke(0);
  fill(100, 240, 358);
  triangle(clownX-50, clownY-30, clownX, clownY-80, clownX+50, clownY-30);

  //mouth
 // noStroke();
  fill(150, 012, 034);
  ellipse(clownX, clownY+30,  30,random(10,30));

  //eye1
  stroke(0);
  strokeWeight(3);
  line(clownX-30, clownY-30, clownX+1, clownY+1);

  //eye2
 // noStroke();
  fill(random(255),random(255),random(255));
  ellipse(clownX+20, clownY-10, 20, 20);

clownY--;
}

void mousePressed() {
  clownY=clownY+5;
  clownX=(random(width));
}
void keyPressed() {
   clownY=400;
}



int rx = 200;
int ry = 100;
int lx=350;
int ly=0;
int lx2=0;
int ly2=250;

void setup () {
  size (700, 250);
  smooth();
}

void draw() {
  background (#C4A06B);
  ellipseMode(CENTER);
  rectMode(CENTER);
 
 //eyes
  noStroke();
  float c = map (mouseX, 0, 700, 40, 80);
  fill(155, c, c);
  ellipse (200,100,150,120);
  fill(255);
  ellipse(500,100,200,120);
  
  //pupils following mouse
  float x = map (mouseX, 0, width, 180, 220);
  float y = map (mouseY, 0, width, 100, 120);
  fill (0);
  ellipse (x, y, 80, 80);
  ellipse (x+300, y, 100, 100);
 
 //pirate
  rect(rx,ry,220,160);
  stroke(0);
  strokeWeight(20);
  line(lx, ly, lx2, ly2);

  if (mousePressed) {
     rx=50;
     ry=50;
     lx=0;
     ly=0;
     lx2=0;
     ly2=0;
  }
  else {
    rx=200;
    ry=100;
    lx=350;
    ly=0;
    lx2=0;
    ly2=250;
  }
  
}
 



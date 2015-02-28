
float x1;
float x2;
float y1;
float y2;


void setup() {
  size(400, 400);
  background(255);
  //frameRate(30);
  stroke(0,0,0,100);
  strokeWeight(1);
  noFill();
  smooth();

  x1 = random(50, 350);
  x2 = random(50, 350);
  y1 = random(50, 350);
  y2 = random(50, 350);
}

void draw() {
  ellipseMode(CENTER);
  stroke(0,0,0,100);
  strokeWeight(1);
  line(x1,y1,x2,y2);
  strokeWeight(2);
  stroke(255,0,0,190);
  ellipse(x2,y2,10,10);
  x1 = x2;
  y1 = y2;
  x2 = random(50, 350);
  y2 = random(50, 350);

  if(keyPressed) {
    save("dssad.tif");  
  } 
}






float y = 600, Y = 600;

void setup() {
  size(500,500);
  background(#0AA6AA);
  smooth();
  frameRate(120);
  noCursor();
  noStroke();
}

void draw() {
  fill(random(256),random(256),random(256));
  ellipse(mouseX,mouseY,random(101),random(101));
  rectMode(CENTER);
  rect(mouseX+105,mouseY,random(101),random(101));
  
  if (mousePressed) {
    ellipse(250,Y, 200,200);
    Y --;
    ellipse(100,y, 200,200);
    ellipse(400,y, 200,200);
    y -= 0.5;  
  }
  if (keyPressed) {
    background(random(256),random(256),random(256));
  }
}

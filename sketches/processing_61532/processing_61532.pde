
void setup(){

size(400,400);
background(255);

}

void draw(){

int x;

 x = mouseX;

int y;

 y = mouseY;
 float r;
r = random(10,400);
  
      rectMode(CENTER);
  noStroke();
  fill(random(100, 255), 0, random(100,200),50);
  rect(x, y,r,r);
  
    ellipseMode(CENTER);
  noStroke();
  fill(random(100, 255), 100, random(150,255));
  ellipse(x, y,r,r);
}


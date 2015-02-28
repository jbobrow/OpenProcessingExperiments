
boolean clickDown = false;
boolean circles = false;
int radiuz = 50;

void setup(){
  background(0);
  smooth();
  size(500,500);
  noStroke();
  ellipseMode(CENTER);
}

void draw(){
  int x = mouseX;
  int y = mouseY;
  
  fill(random(200,255),random(200,255),random(200,255));
  
  if (clickDown && !circles){
    triangle(x,y,x-random(radiuz),y-random(radiuz),x+random(radiuz),y+random(radiuz));
  }
  if (clickDown && circles){
    ellipse(x, y, radiuz, radiuz);
  }
}

void mousePressed(){
  clickDown = !clickDown;
}

void keyPressed(){
  if (key == 'c'){ //clear
    background(0);
  }
  if (key == 'x'){ //increase draw size
    radiuz += 10;
  }
  if (key == 'z'){ //decrease draw size
    radiuz -= 10;
  }
    if (key == 'a'){ // switch tool
    circles = !circles;
  }
}

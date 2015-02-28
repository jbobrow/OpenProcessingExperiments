
float x = random(0,500);//starting coordinates
float y = random(0,500);
float speed = 1.5;
float diam = 50;
float r = random(1,255);
float g = random(1,255);
float b = random(1,255);

void setup(){
  size (500, 500);
  smooth();
}

void draw(){
  background(255);
  stroke(0);
  fill(r,g,x,x*10);
  ellipse(x,y,x/5,y/4);
  
  x = x + speed;
  y = y + speed * -1;
  
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
    r = random(1,255);
    g = random(1,255);
    b = random(1,255);
  }
  
    if ((y > height) || (y < 0)) {
    speed = speed * -1;
    r = random(1,255);
    g = random(1,255);
    b = random(1,255);
  }
  
  if(mousePressed){
    x=mouseX;
    y=mouseY;
    speed = speed * -1;
  }
}


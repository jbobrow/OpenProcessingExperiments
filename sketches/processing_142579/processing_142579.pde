
float posx;
float posy;
float diameter;
float r,g,b;

void setup(){
  size(500,500);
  background(255);
  smooth();
  
  posx = random(width);
  posy = random(height);
  diameter = 10;
  r = random(255);
  g = random(255);
  b = random(255);
  
}

void draw(){
  noStroke();
  if(mousePressed){
    diameter = 10;
    fill(r,g,b);
  }
  if(mousePressed){
    posx = random(width);
    posy = random(height);
  }
  
  ellipse(posx,posy,diameter,diameter);
  diameter = diameter + 1;
  
}



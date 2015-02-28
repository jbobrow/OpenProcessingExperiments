

void setup() {
  size(600,600); 
  smooth(); 
  background(238,174,238);
}

int r,g,b,t=0,value=200;

void draw() {
  
  r=random(255);
  g=random(255);
  b=random(255);
  noStroke();
  
  fill(r,g,b);
  ellipse(300, 300, 750, 750);
  
  fill(value);
  ellipse(300, 300, 700, 700);
  
  fill(g,b,r);
  ellipse(300, 300, 650, 650);
 
  fill(r,g,255);
  ellipse(300, 300, 600, 600);
  
  fill(r,255,b);
  ellipse(300, 300, 550, 550);
  
  fill(r,g,255);
  ellipse(300, 300, 500, 500);
  
  fill(255,255,b);
  ellipse(300, 300, 450, 450);
  
  fill(255,g,255);
  rect(100, 100, 400, 400,3, 6, 12, 18);
  
  fill(255,255,b);
  rect(175, 175, 350, 350, 3, 6, 12, 18);
  
  fill(255,g,255);
  ellipse(300, 300, 400, 400);
  
  fill(255,255,b);
  ellipse(300, 300, 350, 350);
  
  fill(255,g,255);
  ellipse(300, 300, 300, 300);
  
  fill(255,255,b);
  ellipse(300, 300, 250, 250);
  
  fill(255,g,255);
  ellipse(300, 300, 200, 200);
  
  fill(255,255,b);
  ellipse(300, 300, 150, 150);
  
  fill(255,g,255);
  ellipse(300, 300, 100, 100);
  
  fill(r,255,b);
  ellipse(300, 300, 50, 50);
  
  fill(b,255,b);
  ellipse(300, 300, 40, 40);
  
  fill(255,g,b);
  ellipse(300, 300, 30, 30);
  
  fill(255,r,b);
  ellipse(300, 300, 20, 20);
  
  fill(value);
  ellipse(300, 300, 15, 15);
  
}

void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 200;
  }
}







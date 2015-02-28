
float x;
float y;
float v = random(3, 5);
float vy = random(3, 5);
float trans = 250;

void setup() {
  size(600, 600);
  x = random(width);
  y = random(height);
}

void draw() {
  background(162,236,240);
  fill(0,10);
  noStroke();
  
 // penguin
  fill(0,trans);
  ellipse(x,y-80,100,70);
  ellipse(x,y,150,100);
  
  fill(250,trans);
  ellipse(x, y+20,120,100);
  
  fill(250);
  ellipse(x-15,y-90,15,20);
  ellipse(x+15,y-90,15,20);
  
  fill(0);
  ellipse(x-15,y-90,8,8);
  ellipse(x+15,y-90,8,8);
  
  fill(250,150,0);
  ellipse(x,y-70,45,20);
  
  fill(250,150,0,trans);
  ellipse(x-35,y+40,40,60);
  ellipse(x+35,y+40,40,60);
 
  x = x+v;
  y = y+vy;
  
  if (x+70 > width||x-70 <0) {
    v=-v;
  }
  if (y+65 > height||y-110 <0) {
    vy=-vy;
  }
}

void mousePressed() {
  //background(0);
  v = random(-5, 5);
  vy = random(-5, 5);
  trans = random(0,250);
   if (trans < 100) {
    trans=0;
  }
  if (trans > 100) {
    trans=250;
  }
   
}



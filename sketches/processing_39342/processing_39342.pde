
int x = 0;
int speed = 1;

void setup() {
  size(500,500);
  smooth();
  
}

void draw() {
  background(59,9,178);
  
    
  noStroke();
fill(49,152,15);
ellipse(0, 250,100,250);
ellipse(100, 250, 200, 200);
ellipse(200, 250, 150,180);
ellipse(300, 250, 220, 180);
ellipse(400, 250, 200, 180);
ellipse(500, 250, 200, 220);
rect(0, 250, 500, 500);
noFill();
stroke(200,420,200,40); 

  
  x = x + speed;

  
  if ((x > width) || (x <= 0)) {
   
    speed = speed * -1;
  }

 
  noStroke();
  fill(183,245,239);
  ellipse(x,32,32,32);
  
   noStroke();
  fill(255,0,0,127);
  rectMode(255);
  
  
  ellipse(mouseX,mouseY,25,25);   
}

void mousePressed() { 
background(0);
  fill(54,234,0);
ellipse(0, 250,100,250);
ellipse(100, 250, 200, 200);
ellipse(200, 250, 150,180);
ellipse(300, 250, 220, 180);
ellipse(400, 250, 200, 180);
ellipse(500, 250, 200, 220);
rect(0, 234, 229, 200);

stroke(200,420,200,40); 
}


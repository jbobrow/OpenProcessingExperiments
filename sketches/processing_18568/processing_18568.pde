
float y = 0.0;
float x = 0.0;

void setup(){
size(250, 250);
background(#5A010B);
noFill();
stroke(#FFEA00);
}

void draw(){
  frameRate(15);
  line(x ,y, x, y);
  y += 2; 
  x += 2;
  
  line(x, x, x, x);
  y += 10;
  x += 2;
  
  line(y, y, y, y);
  y += 2;
  
  line(x, x, x, x);
  
  rect(0, x, x, x);
  rect(0, y, y, y);
}




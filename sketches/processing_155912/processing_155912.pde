
float x = 100;
float y = 100;
float speedx = 3;
float speedy = 1;
float gravity = 0.1;
float r = 236;
float g = 229;
float b = 154;

void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(random(100,150),50,91);
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeWeight(3);
  fill(128,255,0);
  
  x = x + speedx;
  y = y + speedy;
  speedx = speedx + gravity;
  speedy = speedy + gravity;
  
  if (x<0 || x>width){
    speedx = speedx * -0.95;
  }
  if (y<0 || y>height){
    speedy = speedy * -0.95;
  }
  if (mousePressed){
    speedy = speedy * 1.1;
    speedx = speedx * 1.1;
  }
  if (abs(speedx)>20 || abs(speedy)>15){
    speedx =4;
    speedy =2;
  }
  
  
  line (x-17,y-3, x-25, y-15);
  line (x+17,y-3, x+25, y-15);
  line (x-17, y+3, x-25, y+15);
  line (x+17, y+3, x+25, y+15);
  rect(x,y-15,10,20); //neck
  ellipse(x, y, 40, 30); //body
 
  ellipse(x,y-33,37, 27); //head
  fill(44,59,99);
  ellipse(x-10,y-33,8,8); //eye1
  ellipse(x+10,y-33,8,8); //eye2
  ellipse(x,y-25,8,12); //mouse
  
  if (x-40 < mouseX && mouseX < x+40 && y-60 < mouseY && mouseY < y+60 && mousePressed){
    background(0,255,0);
    fill(255,0,0);
    ellipse(x,y-33,57, 47); 
     ellipse(x-10,y-33,16,16); //eye1
  ellipse(x+10,y-33,16,16); //eye2
  ellipse(x,y-25,16,20); //mouse
  ellipse(x, y, 60, 40); //body
  
  }
  
}


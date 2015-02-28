
int radius = 40;
float x= 110;
float speed= 3;
int direction = 1;
int posX;
int posY;

void setup() {
  
  frameRate(30);
  size(250,250);
  ellipseMode(RADIUS);
  posX =50;
  posY =100;

  
}


void draw(){
  
  background(0);
  
//pacman    
  x += speed * direction;
  if ((x > width-radius) || (x < radius)) {
direction = -direction;
}
 if (direction == 1) {
arc(x, 60, radius, radius, 0.52, 5.76); 
}
else {
arc(x, 60, radius, radius, 3.67, 8.9);
}

//lines

for (int x = 20; x < width; x += 20) {

  float mx = mouseX / 10;
  float offsetA = random(-mx, mx);
  float offsetB = random(-mx, mx);
  line(x + offsetA, 20, x - offsetB, 100);
 
 //cherry

if (keyPressed){
    if (key == 'e')
    fill(0,0,150);
}
 
else{
  fill(150,0,0);
   
  } 
fill(150,0,0);

ellipse(posX, posY, 10, 10);

}

//dots
if (keyPressed){
    if (key == 'd')
    fill(255,255,255);
}
 
else{
  fill(150,150,0);
   
  }
  ellipse(30,150,10,10);
  ellipse(60,150,10,10);
  ellipse(90,150,10,10);
  ellipse(120,150,10,10);
  ellipse(150,150,10,10);
  ellipse(180,150,10,10);
  ellipse(210,150,10,10);
  ellipse(240,150,10,10);
  
  ellipse(240,180,10,10);
  
  ellipse(240,210,10,10);
  ellipse(210,210,10,10);
  ellipse(180,210,10,10);
  ellipse(150,210,10,10);
  ellipse(120,210,10,10);
  ellipse(90,210,10,10);
  ellipse(60,210,10,10);
  ellipse(30,210,10,10);
  
  ellipse(240,120,10,10);
  
  ellipse(240,240,10,10);
  
  ellipse(5,120,10,10);
  ellipse(5,150,10,10);
  ellipse(5,180,10,10);
  ellipse(5,210,10,10);
  ellipse(5,240,10,10);
  
posX += speed;

}

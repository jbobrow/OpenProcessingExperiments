
float r = 0;
float b = 0;
float g = 0;

int horiz = 50;
int horizo = 330;
int horizu = 50;
int horizd = 330;
int horizuo = 330;
int horizdo = 50;
int speed = 3;

void setup(){
  size(400,400);
}

void draw(){
  horiz = horiz + speed;
  horizo = horizo - speed;
  horizu = horizu + speed;
  horizd = horizd - speed;
  horizuo = horizuo - speed;
  horizdo = horizdo + speed;
  
  strokeWeight(random(20));
  stroke(r,g,b);
  line(mouseX,mouseY,mouseY,mouseX);
  
  fill(r,g,b,150);
  ellipse(horiz,200,50,50);
  tint(255, 50);
  
  fill(b,r,g,150);
  ellipse(horizo,200,50,50);
  
  fill(r,b,g,150);
  ellipse(horizu,300,50,50);
  
  fill(g,r,b,150);
  ellipse(horizd,100,50,50);
  
  fill(r,g,b,150);
  ellipse(horizdo,100,50,50);
  
  fill(g,r,b,150);
  ellipse(horizuo,300,50,50);
  
  if(horiz >= 330){
  horiz = 330;
  horizo = 70;
  horizu = 330;
  horizd = 70;
  horizdo = 330;
  horizuo = 70;
  }
  
  if(horiz <= 70){
    horiz = 70;
    horizo = 330;
    horizu = 70;
    horizd = 330;
    horizdo = 70;
    horizuo = 330;
  }
    if(mouseX <= 200){
    speed = 5;
  }
    if(mouseX > 200){
    speed = -5;
  }
    if(mouseX > 200) {
   r = r + 2;
  } else {
   r = r - 2;
}
  if (mouseY > 200) {
   b = b + 2;
  } else {
   b = b - 2;
}
  
  r = constrain(r,0,255);
  g = constrain(g,0,255);
  b = constrain(b,0,255);
  
  strokeWeight(50);
  stroke(r,g,b);
  ellipse(mouseX,mouseY,mouseX-pmouseX,mouseX-pmouseX);
  
  if(mouseX > 200) {
   r = r + 2;
  } else {
   r = r - 2;
}
  if (mouseY > 200) {
   b = b + 2;
  } else {
   b = b - 2;
}
  
  r = constrain(r,0,255);
  g = constrain(g,0,255);
  b = constrain(b,0,255);
}


void mouseMoved() {
  fill(r,g,b);
}

void mousePressed() {
  filter(INVERT);
}

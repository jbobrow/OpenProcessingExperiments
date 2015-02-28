
//Creates two sets of cartoonish eyes, fit for a reptilian character
//Aaron Darling

void setup(){

//setup size and enable smoothing
  size(700,400);
  smooth();
}
//setup eye positioning
float x = 200;
float y = 200;
float x2 = 500;
float y2 = 200;
//acc to make eye movement more natural
float acc = 0.03;

void draw() {
  //redraw background
  background(80,110,40);
  fill(240,230,140);
  stroke(0);
  //draw eye backgrounds
  ellipse(200,200,250,150);
  ellipse(500,200,250,150);
  
  //Calculates mx and my for both eyes
  //which is used to override and set a contraint on the mouse variable
  
  float mx = constrain(mouseX,110,290);
  float my = constrain(mouseY,180,220);
  
  float mx2 = constrain(mouseX,410,590);
  float my2 = constrain(mouseY,180,220);
  
  //Calculates movement including acc for each x,y of each eye
  //(abs is absolute value)
  float dx = mx - x;
  if(abs(dx) > 1) {
    x += dx * acc;
  }
  
  float dy = my - y;
  if(abs(dy) > 1) {
    y += dy * acc;
  }
  
    float dx2 = mx2 - x2;
  if(abs(dx2) > 1) {
    x2 += dx2 * acc;
  }
  
  float dy2 = my2 - y2;
  if(abs(dy2) > 1) {
    y2 += dy2 * acc;
  }

  fill(0);
  
  //draws the eye to move
  ellipse(x,y,60,60);
  ellipse(x2,y2,60,60);
  
  //Makes the eye blink upon mouse press
  if(mousePressed){
  fill(100,100,0);
  stroke(0);
  ellipse(200,200,250,150);
  ellipse(500,200,250,150);
  }

  
  
}

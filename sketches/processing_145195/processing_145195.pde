

float fX, fY;
float fWidth, fHeight;
float mX, mY;
int clicked;
float pump = 10;
float angle = 0;
float scalar = 100;
float offset;
float speed = 0.05;
float deflation = .4;

void setup() {
  size(600,600);
  background(255);
  
  fX = width/2;
  fY = height/3;
  fWidth = width/5;
  fHeight = height/3;
}

void draw() {
  background(255);
  
//  mX = map(mouseX,0,width,0-width/2,width/2);
//  mY = map(mouseY,0,height,0-height/2,height/2);
//  fWidth=mX;
//  fHeight=mY;;

  offset = fWidth/2 + 200;
  
  if(keyPressed && key == ' ') {
    if(clicked == 0){
        fWidth += pump;
        fHeight += pump/2;
    }
    clicked = 1;
  } else {
    clicked = 0;
  }
    
  float fY = offset + sin(angle) * scalar;
  angle += speed;
  if(fWidth > width/5 || fHeight > height/3){
    fWidth -= deflation;
    fHeight -= deflation/2;
  } else {
    fWidth = width/5;
    fHeight = height/3;
  }
//  fHeight = fHeight - fY;
  fill(240,195,140);
  noStroke();
  ellipse(fX,fY,fWidth,fHeight); // Head
  fill(161,196,75);
  stroke(0);
  strokeWeight(fWidth/300);
  ellipse(fX-fWidth/6,fY,fWidth/8,fHeight/20); // Left Eye
  ellipse(fX+fWidth/6,fY,fWidth/8,fHeight/20); // Right Eye
  fill(0);
  ellipse(fX-fWidth/6,fY,fWidth/20,fHeight/20); // Left Pupil
  ellipse(fX+fWidth/6,fY,fWidth/20,fHeight/20); // Right Pupil
  line(fX-fWidth/6, fY+fHeight/6, fX+fWidth/6, fY+fHeight/6);
}




float mousex;
float mousey;
int color1=30;
int color2=30;
int color3=30;
int trans=30;
float movex=250;
float movey=250;
int speed = 4;



void setup() {  
  size(700,400);  
  background(255);
  stroke(0,0,0,100);
  strokeWeight(10);
  smooth();
}

void draw() {

  float mousex = mouseX;
  float mousey = mouseY;


  ellipse(mousex, mousey, 100, 100);


  if(movex < 0) {
    fill(random(150,200), random(150,200),random(150,200),30);
  }
  if(movex > width) {
    fill(random(150,200), random(150,200),random(150,200),30);
  }
  if(movey < 0) {
    fill(random(150,200), random(150,200),random(150,200),30);
  }
  if(movey > height-10) {
    fill(random(150,200), random(150,200),random(150,200),30);
  }


  if(movex < 0) {
    movex = 100;
  }
  if(movex > width) {
    movex = width - 100;
  }
  if(movey < 0) {
    movey = 100;
  }
  if(movey > height - 10) {
    movey = height - 100;
  }

  if (dist(mouseX,mouseY,movex,movey) < 150)
  { 
    if (mouseX < movex) {
      movex = movex + (150-dist(mouseX,mouseY,movex,movey));
    } 
    else {
      movex = movex - (150-dist(mouseX,mouseY,movex,movey));
    }
  }
  if (dist(mouseX,mouseY,movex,movey) < 150)
  { 
    if (mouseY < movey) {
      movey = movey + (150-dist(mouseX,mouseY,movex,movey));
    } 
    else {
      movey = movey - (150-dist(mouseX,mouseY,movex,movey));
    }
  }

  ellipse(movex, movey, 100, 100);

  if (movey>height) {
    movey=0;
    if (movex>width) {
      movex=0;
    }
  }
}


void mousePressed() {




  background(255);
}



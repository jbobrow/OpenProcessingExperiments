
int x=0;


int y=0;
int y2=400;
int speedY=3;


int a=30;
int b=30;


void setup()
{
  size(400, 400);
  smooth();
  stroke(255,50);
}

void draw() {
  background(255);
  //avanza elissi
  y =y + speedY;
  y2 =y2-speedY;
  //disegna elissi 
  fill(#FC3636, 30);
  for (int x=0; x<=width; x=x+50) { 
    ellipse(x, y, a, b);
  }

  fill(#3641FC, 30);
  for (int x=0; x<=width; x=x+50) { 
    ellipse(x, y2, a, b);
  }

  //stop a 300 px
  if (y >= 300 || y<0) {
    speedY=speedY * -1;
  }

  //up
  if (keyPressed == true && keyCode == UP) {
    if (y < height) {

      a=a+speedY;
    }
  }
  //down
  if (keyPressed == true && keyCode == DOWN) {
    if (y < height) {

      b=b+speedY;
    }
  }
//limite grandezza elissi  
  if(a>300 || b>300){
  a=30;
  b=30;
  }
  
  
}



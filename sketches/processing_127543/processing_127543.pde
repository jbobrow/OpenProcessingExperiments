
//Name: isakv
//Date: 09/01/14
//Project:

int x=50;       //variables
int y=50;       
int dx=9;      //velocity (9,5)
int dy=5;


void setup() {  //setup function called initially, only once
  size(300, 300);
  background(255);  //set background white
  
}

void draw() {  //draw function loops 
  
  
  fill (255,0,255);
  ellipse(x,y,20,20);      //ball
  fill(0,255,0);
  ellipse(y,x,20,20);
  
  x = x + dx;
  y = y + dy;
  
  fill(0,0,255);
  ellipse(mouseX,mouseY,20,20);
  
  if (x > 500){   //X axis colision
      dx = -9;
  }
  else if (x < 0){
    dx = 9;
  }
  if (y > 250) {   //Y axis colision
     dy *= -1;     // the same as dy = dy* (-1)
  }
  else if (y < 0) {
      dy *= -1;
  }
}


int posX, posY;
int incX, incY;
float x, y;
float a, incA;
float cx, cy;
float radX, radY;

//-------------------
void setup(){
  size(500,500);
  
  posX = 0;
  posY = 0;
  incX = 1;
  incY = 1;
  radX = 125;
  radY = 125;
  cx = width/2;
  cy = height/2;
  a = 0;
  incA = TWO_PI/360;
  
}

//------------------
void draw(){
  noStroke();
  fill(127, 90, 50, 5);
  rect(0,0,width,height);
  
  strokeWeight(1);
  stroke(0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  x = cx + radX*cos(a);
  y = cy + radY*sin(a);
  
  stroke(40, 80, 255, 127);
  fill(40, 255, 80, 127);
  ellipse(x, y, 20, 20);
  
  stroke(255, 80, 40, 12);
  fill(80, 40, 255, 127);
  ellipse(posX, y, 20, 20);
  
  stroke(40, 80, 255, 12);
  fill(255, 40, 80, 127);
  ellipse(x, posY, 20, 20);
  
  strokeWeight(3);
  stroke(0, 24);
  line(width/2, y, x, y);
  line(x, height/2, x, y);
  
  strokeWeight(3);
  stroke(255, 24);
  line(posX, y, x, y);
  line(x, posY, x, y);
  
  a += incA;
  posX += incX;
  posY += incY;
  
  if(posX < 0 || posX > width){
    incX *= -1;
  }
  if(posY < 0 || posY > height){
    incY *= -1;
  }
}



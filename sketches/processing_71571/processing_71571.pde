
//globals
int x, dX, y, dY;
int wait = 24;
color cat = color(100,255,100);

void setup(){
  size(500,500);
  x = width/2;
  y = width/2;
  dX = x;
  dY = y;
}

void draw(){
  //set up drawing
  noStroke();
  smooth();
  
  //set up bg
  fill(0,0,0,20);
  rect(0,0, width,width);
  
  //update coordinates
  x += (dX-x)/wait;
  y += (dY-y)/wait;
  
  fill(cat);
  ellipse(x,y, 170,100);
  triangle(x-30,y-30, x-85,y, x-70,y-70);
  triangle(x+30,y-30, x+85,y, x+70,y-70);
  
  fill(0);
  triangle(x-55,y-40, x-75,y-20, x-70,y-50);
  triangle(x+55,y-40, x+75,y-20, x+70,y-50);
  ellipse(x-70,y, 10,10);
  ellipse(x+70,y, 10,10);
  
  fill(200,100,150);
  triangle(x-10,y+15, x+10,y+15, x,y+25);
  
}

void mousePressed(){
  dX = mouseX;
  dY = mouseY;
  if(mouseButton == LEFT){
    cat = color(200,200,0);
  }
  if(mouseButton == RIGHT){
    cat = color(100,255,100);
  }
}

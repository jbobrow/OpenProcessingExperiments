
int[] x;
int[] y;

void setup(){
  size(500,500);
  background(255);
  smooth();
  x = new int[2];
  y = new int[2];
  x[0] = width*1/3;
  y[0] = height/2;
  x[1] = width*2/3;
  y[1] = height/2;
}//setup

void draw(){
  background(255);
  stroke(0);
  for(int i = 3; i< x.length; i++){
    for(int j = 2; j < i; j++){
      line(x[i],y[i],x[j],y[j]);
    }//inner for
  }//for
  
  fill(255);
  stroke(#FF0000);
  for(int i = 2; i< x.length; i++){
    ellipse(x[i],y[i],10,10);
  }//for
}//draw

void mousePressed(){
  int[] xtemp = x;
  int[] ytemp = y;
  
  x = new int[xtemp.length + 1];
  y = new int[ytemp.length + 1];
  
  arrayCopy(xtemp, 0, x, 0, xtemp.length);
  arrayCopy(ytemp, 0, y, 0, ytemp.length);
  
  x[xtemp.length] = mouseX;
  y[ytemp.length] = mouseY;
  
  if(mouseButton == RIGHT){
    x = new int[2];
    y = new int[2];
    x[0] = width*1/3;
    y[0] = height/2;
    x[1] = width*2/3;
    y[1] = height/2;
  }//if
  
}//mouseClick

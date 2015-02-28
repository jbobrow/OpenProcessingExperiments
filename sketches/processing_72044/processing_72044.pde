
//Homework Assingment 6
//51-257 A
//Copyright 2012 Marcos Gonzalez-Bode megonzal@andrew.cmu.edu


float x,y,inc, x1, y1, inc1, dia, x2, y2, inc2, x3, y3, inc3, xP, yP, ex, expInc,go;
void setup() {
  size(400,400);
  smooth();
  x = 0;
  y = height/2;
  inc = 2; 
  dia = 20;
  x1 = width;
  y1 = height/2;
  inc1 = -2;
  x2 = width/2;
  y2 = height;
  inc2 = 2;
  x3 = width/2;
  y3 = height;
  inc3 = -2;
  xP = width/2;
  yP = height/2;
  ex = 2;
  expInc = 2; 
  go = 0;
}

void draw() {
 // pushMatrix( );
 //    translate( width/2, height/2);
 //    rotate( rad   ians(frameCount) );
 //    translate( -width/2, -height/2);
 //popMatrix( );
  drawBall(x,y);
  x = wrapLR(x,inc);
  drawBall (x1,y1);
  x1 = wrapLR(x1,inc1);
  drawBall (x2,y2);
  y2 = wrapTB(y2, inc2);
  drawBall(x3,y3);
  y3 = wrapTB(y3, inc3);
  expBall(xP,yP, ex, ex);
  ex = xpand(ex, expInc);
  
  //saveFrame("Hw6.jpg");
}

float wrapLR(float x, float inc) {
  x += inc;
  if (x < width/2 && inc < 0) {
    x = width;
  } else if ( x > width/2 && inc > 0) {
    x = 0;
  }
  return x;
}

float wrapTB(float y, float inc) {
  y += inc;
  if(y > height/2 && inc > 0) {
        y = 0;
  } else if (y < height/2 && inc < 0) {
    y = height;
  }  
  return y;
}

void drawBall(float x, float y) {
   fill(255, 5);
   rect(0,0, width, height);
   strokeWeight(2);
   ellipse(x,y,dia,dia); 
   strokeWeight(1);   
}

float xpand(float ex, float inc) {
  ex += inc;
  if (ex > height || ex > width && inc < 0) {
    ex = -ex;
  } else if(ex < height || ex < width && inc > 0) {
    ex = ex += inc;
  }
   return ex;
 }

void expBall(float x, float y, float wx, float hx) {
  fill(random(0,255),5);
  ellipse(x,y,wx,hx);
}

void keyPressed() {
  go++;
  if(key == ' ' && go % 2 == 1) {
    inc = 0;
    inc1 = 0;
    inc2 = 0;
    inc3 = 0;
    expInc = 2;    
  } else if (key == ' ' && go % 2 == 0) {
    inc = 2;
    inc1 = -2;
    inc2 = 2;
    inc3 = -2;
    expInc = 0; 
  } else if(key =='r') {      
    inc = 2;   
    inc1 = -2;    
    inc2 = 2;  
    inc3 = -2;
    expInc = 2; 
  } else if(key =='s') {      
    inc = 0;   
    inc1 = 0;    
    inc2 = 0;  
    inc3 = 0;
    expInc = 0; 
  } else if(key =='n') {
      x = 0;
      y = height/2;
      inc = 2;
      dia = 20;
      x1 = width;
      y1 = height/2;
      inc1 = -2;
      x2 = width/2;
      y2 = height;
      inc2 = 2;
      x3 = width/2;
      y3 = height;
      inc3 = -2;
      xP = width/2;
      yP = height/2;
      ex = 2;
      expInc = 2; 
      go = 0;
  }
}



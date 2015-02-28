
float X;
float Y;
float incX;
float incY;
float x;
float y;
float incx;
float incy;
int r;
int incr;
int b;
int incb;
int g;
int incg;
//-------------------------------------------
void setup(){
  size(640, 480);
  fill(r, 255, 255, 25);
  rect(0, 0, width, height);
  x = (width - 100);
  y = (height - 100);
  incx = 0;
  incy = -2;
  X = 50;
  Y = 50;
  incX = 0;
  incY = 2;
  r = 0;
  incr = 1;
  b = 255;
  incb = -1;
  g = 255;
  incg = 1;
  }

//---------------------------------------------
void draw(){
  fill(r%255, b%255, g%255, 25);
  rect(0, 0, width, height);
  fill(255, 0, 0);
  line(X, Y, x, y);
  ellipse(X, Y, 50, 50);
  ellipse(x, y, 50, 50);
  r= r + incr;
  if(x == (width - 100)){
    incy = -2;
    y = y + incy;
    
    }
  if(y == 50){
    incx = -2;
    x = x + incx;
    
    }
  if(x == 50){
    incy = 2;
    y = y + incy;
    }
  if(y == (height - 100)){
    incx = 2;
    x = x + incx;
    }
  if(X == 50){
  incY = 2;
  Y = Y + incY;
  }
  if(Y == (height - 100)){
    incX = 2;
    X = X + incX;
    
    
  }
  
  if(X == width - 100){
    
    incY = -2;
    
    Y = Y + incY;
    
    
  }
  
  if(Y == 50){
    incX = -2;
    X = X + incX;
    
    }
  if(r > 255){
    incr = incr * -1;
    }
  if(r < 0){
    incr = incr * -1;
    }
  if(r > 150){
    b = b + incb;
    }
  if(b==100){
    g = g + incg;
    
    }
}




int W =800;
int H = 800;


int d = 3;
int r = 10;
int range = 100;
float m = 200.0;
float a = 0.0;
float b = 0.0;
float l = 0.0;
float X = W/2;
float Y = H/2;
float v = 0.0;
float dx = 0.0;
float dy = 0.0;
float k = 0.0;
float ddx = 0.0;
float ddy = 0.0;
int cat =0;

void setup() {
  size(W, H);
  background(255);

}

void draw() { 
  //background(255);
if ((mouseX == X)&(mouseY == Y)){ cat = 1;}

  if (mousePressed) {    
    background(255);
    X = width / 2;
    Y = height / 2;
    ellipse(X, Y, 2*r, 2*r);
    cat = 0;
  } else if(cat == 1){
    background(10); 
  }else {
    ddx = dx;
    ddy = dy;
    a = X - mouseX;
    b = Y - mouseY;
    l = sqrt(a*a + b*b);

    if ( l < r) {
      k = r;
    } else if (l > range) {
      k=range;
    } else if (l == 0.0) {
      k = 0.0;
    } else { 
      k = l;
    }
    
    v = m*(1/(k-r+d) - 1/(range-r+d));
    
    if ( l > range){ v = 0;}
    dx = v * a/l;
    dy = v * b/l;

    X = X + dx+ddx;
    Y = Y + dy+ddy;
    if (X > W) {
      X=W/2;
      Y=H/2;
      background(255);
    }else if(X<0){ 
      X=W/2;
      Y=H/2;
      background(255);
  }
    
    if (Y > H) {
      X=W/2;
      Y=H/2;
      background(255);
    }else if(Y<0){
      X=W/2;
      Y=H/2;
      background(255);
    }

    ellipse(X, Y, 2*r, 2*r);
  }
}


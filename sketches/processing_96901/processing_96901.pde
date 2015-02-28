
float x, y ;
float s, l ;
float percentage = 0;
int index = 0;
int step = 0;
float pX, pY;

void setup() {
  size(1000, 1000);
  x = 0;
  y =  500;
  index = 0;
}

void draw() {
  background(255);
  makeATurn(mouseX);
}

void makeATurn( float l) {
  l /= 1.618;
  s = l ;  

  if (l>0.1) {

    if (index%4==0) {
      bezier(x, y, x, y-s/2, x+l/2, y-s, x+l, y-s);
      x = x + l;
      y = y - s;
    } 
    else if (index%4==1) {
      bezier(x, y, x+ s/2, y, x+s, y+l/2, x+s, y+l);
      x = x + s;
      y = y + l;
    }  
    else if (index%4==2) {
      bezier(x, y, x, y+s/2, x-l/2, y+l, x-l, y+s);
      x = x -l;
      y = y + s;
    }   
    else if (index%4==3) {
      bezier(x, y, x- s/2, y, x-s, y-l/2, x-s, y-l);
      x = x -s ;
      y = y - l;
    }
    index++;
    makeATurn(l);
  }
  else {
    x = 0 ;
    y = 500;
    index= 0;
  }
}



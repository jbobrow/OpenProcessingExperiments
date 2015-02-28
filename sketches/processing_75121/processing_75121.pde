

float beginX = 0.0;
float beginY = 350.0;
float endX = 200.0;
float endY = 100.0;
float distX;
float distY;
float exponent = 30.0;
float x = 0.0;
float y = 0.0;
float step = 0.01;
float pct = 0.0;

int direction = 1;


int _x, _y, _wi, _hi;
color _c;


void setup(){
  background(0);
  smooth();
size(400,400);
_x = width/2;
_y = height/2;

_wi = width/4;
_hi = _wi*3;

_c = color(255);

  distX = endX - beginX;
  distY = endY - beginY;

}



void draw(){
  for(int i=0; i<1000; i++){
    _c= color(random(256), i*2.5, 255, 255);
    char letter=(( char) int(random(35,120)));
  letter(int(random(width)), int(random(height)), 5, 10, _c, letter);
 
  pct += step * direction;
  if ((pct > 1.0) || (pct < 0.0)) {
    direction = direction * -1;
  }
  if (direction == 1) {
    x = beginX = (pct * distX);
    float e = pow(pct, exponent);
    y = beginY + (e * distY);
  } else {
      x = beginX + (pct * distX);
      float e = pow(1.0-pct, exponent*5);
      y = beginY + (e * -distY) + distY;
    }
    fill(255);
    ellipse(x,y,50 ,50);
  }
}




void letter(int x, int y, int wi, int hi, color c, char l) {
smooth();
fill(_c);
text(l, x, y);
textSize(random(5));
}





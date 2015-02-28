
int counter;
int bw = 20;
int bh = 20;
int x = 100;
int y = 50;
double xs = 1.00;
double ys = 1.00;
double frict = 0.000;
double grav = 0.01;


void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  background(255);
  ellipse(x, y, 20, 20);
  int newx = x + xs;
  int newy = y + ys;
  if (xs >= 0.00){
    xs -= frict;
  }
  if (ys >= 0.00){
    ys -= frict;
  }
  if (newy > (250 )){
    ys = ys * -1;
  }
  if (newy < 0){
    ys = ys * -1;
  }
  if (newx > (250 )){
    xs = xs * -1;
  }
  if (newx < 0){
    xs = xs * -1;
  }
  x = newx;
  y = newy;
  ys = ys + 0.01;

}

                     
                

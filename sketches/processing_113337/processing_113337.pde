
float x;
float y;
float lerp;
int r;
int g;
int b;

boolean colorchange;

void setup() {
  size(500,500);
  background(250);
  colorchange= false;
}

void draw() {
  noStroke ();
  x=mouseX;
  y=mouseY;
  color from = color(255,123,0);
    color to = color(74,0,191);
    color interA = lerpColor(from, to, lerp);
    fill(interA);
    if (!colorchange) {
      lerp-=0.1;}
      else if (colorchange) {
        lerp-=0.1;}
        if (lerp <=0.001 || lerp >=0.999) 
        {colorchange =!colorchange;
   }

     
    if (mousePressed==true) {
    triangle(x, y, x-10, y-20, x+10, y-20);
   
    }
}




float x;
float y;

int r; //red 0 - 255
int g; //green 0 - 255
int b; //blue 0 - 255

boolean colorchange;
 color purple = color (100, 0, 200); 
 color pink = color (250, 0, 250);
 float lerp = 0.0;
 
void setup() {
  size (600, 600);
 background (0);
  colorchange = false;
 
}

void draw(){
   
  stroke(7);
x= mouseX;
y= mouseY;
fill(r,g,b,50);
stroke (r,g,b,50);


if (mousePressed == true){
  color temp = lerpColor (purple, pink, lerp);
  fill (temp);
  stroke (temp);
  strokeWeight(1);
  ellipse (x, y, 10, 10);
   ellipse (y, x, 10, 10);
   noFill();
   stroke (temp);
   ellipse (x+50, y+50, 10, 10);
   ellipse (y+50, x+50, 10, 10);
  if (!colorchange){ // colorchange = false
  lerp += 0.01;
  } else if (colorchange == true) {
   lerp -= 0.01;
  }
  if (lerp <=0 || lerp >= 1.0){
    colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
  }
}
}



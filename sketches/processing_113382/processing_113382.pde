
float x;
float y;

int r; //red 0 - 255
int g; //green 0 - 255
int b; //blue 0 - 255

boolean colorchange;
 color yellow = color (255, 0, 200); 
 color blue = color (0, 200, 255);
 color pink = color (100, 150, 0);
 float lerp = 0.0;
 
 /* @pjs preload="Space.jpg"; */ 
 PImage img;

 
void setup() {
  size (900, 700);
 background (255);
  r= 255;
  g= 250;
  b= 230;
  colorchange = false;
  
 

img = loadImage ("Space.jpg");
image(img, -660, -350);
}

 
void draw(){
  stroke(7);
x= mouseX;
y= mouseY;
noFill ();
stroke (r,g,b);




if (mousePressed == true){
  color temp = lerpColor (yellow, blue, lerp);
  stroke (temp);
  ellipse (x, y, 80, 80);
   ellipse (y, x, 100, 100);
   ellipse (x, y, 115, 115);
  if (!colorchange){ // colorchange = false
  lerp += 0.01;
  } else if (colorchange == true) {
   lerp -= 0.03;
  }
  if (lerp <=0 || lerp >= 2.0){
    colorchange = !colorchange; // flipswitch. if colorchange used to be true it is now false
  
  }
}
}



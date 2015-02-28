
float  xinc;
float yinc;
float x=0;
float y=0;




void setup() {
  size(800, 800);
  fill(0);
  smooth();
}
void draw() {
  background(255);
  frameRate(300);

  xinc=-5+10.0*mouseX/width;
 yinc=-5+10.0*mouseY/height;
 fill(0);
  line(5, 25, width, 25);
  ellipse(mouseX,25,10,10);
  line(5, 25, 5, height);
   ellipse(5,mouseY,10,10);





noStroke();
 fill(#DB1F1F);
 
  rect(x, y, 50, 50);
  ellipse(x+225,y-10,30,30);
  ellipse(x+175,y+99,100,100);
    ellipse(x-175,y+99,50,50);
 
  rect(x-150, y+234, 80, 50);
  x=x+xinc;
  y=y+yinc;
  if (x>width) {
    x=0;
  }
  if (x<0) {
    x=width;
  }
  if (y>height) {
    y=0;
  }
  if (y<0) {
    y=height;
  }
}
//println((mouseX +" "+mouseY);


 


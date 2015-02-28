
int snow;
int x;
int y;
int directionx;
int directiony;

void setup() {
size(600,600);
background(snow,snow,snow);

snow=20;
  x=300;
  y=100;
  directionx=5;
  directiony=5;
}

void draw() {
    x+=directionx;
  y+=directiony;
  if(y>600){
    directiony=-5;
  }
  if(x>600){
    directionx=-5;
  }
  if(y<1){
    directiony=5;
  }
  if(x<1){
    directionx=5;
  }
  
  if(y>snow){
    directiony=-snow;
  }
  if(x>snow){
    directionx=-snow;
  }
  if(y<snow){
    directiony=snow;
  }
  if(x<snow){
    directionx=snow;
  }


  point(mouseX, mouseY);
   background(60,snow,450);
snow++;

color pink = color(500, 50, snow);
loadPixels();
for (int i = 2; i < (width*height)-width*snow; i++) {
 pixels[i] = pink;
}
updatePixels();

strokeWeight(10);

ellipse(x,y,mouseX,mouseY);
ellipse(mouseX,mouseY,x,y);
rect(x,y,x,y);
fill(160,233,255);
rect(mouseX,y,x,mouseY);
  
  stroke(240,255,254);
strokeWeight(0);
fill(60,606,60);

//println(snow);
if(snow>700){
  snow=0;
}}







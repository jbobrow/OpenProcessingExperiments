

//variables ruido
float px = 3.7;
float py = 2.5;
float pxSize = 200;


// posicion
float x = random(430.6);
float y = random(480.3);

//color
float r = random (255);
float g = random (255);
float b = random (255);
float a = random (20, 90);

//variables para cambiar posicion
float xspeed = noise(px);
float yspeed = noise(py);

//variables para cambiar color y opacidad
float rspeed = 6.9;
float gspeed = 1.9;
float bspeed = 0.1;
float aspeed = 2.3;


//variables para cambiar tamaño
float xSize = noise(pxSize);
float ySize = 20;
float xChange = 0.5;
float yChange = 0.7;



void setup(){
  size (500,500);
  background(0);
  frameRate(400);
  smooth();
}

void draw(){
 
 
 noStroke();
 fill(r,g,b,a);
 
 rect(x,y,xSize,ySize);


x = x + xspeed;
y = y + yspeed;
r = r + rspeed;
g = g + gspeed;
b = b + bspeed;
a = a + aspeed;

xSize = xSize + xChange;
ySize = ySize + yChange;





if (x >width || (x < 0)) {
  xspeed = xspeed *-1;
  
  
 
  
}
if (y >height || (y < 0)){
  yspeed = yspeed*-1;
}
if (r > 255|| (r < 0)){
  rspeed = rspeed * -1;
}
if (g > 255 || (g <0)){
  gspeed = gspeed * -1;
}
if (b > 255 || (b < 0)){
  bspeed = bspeed * -1;
}

if (a > 90 || (a < 20)){
  aspeed = aspeed * - 1;
}
if (xSize >20 || (xSize < 10)){
  xChange = xChange * -1;
}
if (ySize >20|| (ySize < 10)){
  yChange = yChange *-1;
}
if (mousePressed){
  background(0);
}
}





PImage bg;
int ystart= 200; ///start posY///
int x = 150; //start posX///
int y = ystart;
float diam = 70; ///ballsize///
float diamInc = 5;
int yspeed = 4;
int  ymax = 80; ///spacebwtballsize///

void setup()
{
  size (800, 534);
  frameRate(30);
  bg = loadImage("street.jpg");
}

void draw()
{
  //defining first circle
  background(bg); 
   y = y + yspeed;
   ellipse(x,y,diam, diam);
   fill(255);
//   diam += diamInc;
  // if circle  is greater or equal to 
   //the maximum distance then a new circle is drawn
  if(y >= ystart + ymax){
    ellipse(x,y-ymax, diam, diam); 
 }
  if(y >= ystart + 2*ymax){
    ellipse(x,y-2*ymax, diam, diam);
 }
  if(y >= ystart + 3*ymax){
    ellipse(x, y-3*ymax, diam, diam);
 } 
  if(y >= ystart + 4*ymax){
    ellipse(x,y - 4*ymax, diam, diam);
 }
if(y >= ystart + 5*ymax){
  ellipse(x,y - 5*ymax, diam, diam);
}  
if(y >= ystart + 6*ymax){
  ellipse(x,y - 6*ymax, diam, diam);
}
if(y >= ystart + 7*ymax){
  ellipse(x,y - 7*ymax, diam, diam);
}
if(y >= ystart + 8*ymax){
  ellipse(x,y -8*ymax, diam, diam);
}
if(y>= ystart +9*ymax){
  ellipse(x,y -9*ymax, diam, diam);
}
if(y >= ystart + 10*ymax){
  ellipse(x,y-10*ymax, diam, diam);
}
if(y >= ystart + 11*ymax){
  ellipse(x, y-11*ymax, diam, diam);
}
if(y >= ystart + 12*ymax){
  ellipse(x, y -12*ymax, diam, diam);
}
if (y >= ystart + 13*ymax){
  ellipse(x, y -13*ymax, diam, diam);
}
if(y >= ystart + 14*ymax){
  ellipse(x, y-14*ymax, diam, diam);
}
if(y >= ystart + 15*ymax){
  ellipse(x, y-15*ymax, diam, diam);
}
if(y >= ystart + 16*ymax){
  ellipse(x, y-16*ymax, diam, diam);
}
if(y >= ystart + 17*ymax){
  ellipse(x, y-17*ymax, diam, diam);
}
if(y >= ystart + 18*ymax){
  ellipse(x, y-18*ymax, diam, diam);
}
if (y >= ystart + 19*ymax){
  ellipse(x, y-19*ymax, diam, diam);
}
if(y >= ystart + 20*ymax){
  ellipse(x, y-20*ymax, diam, diam);
}

if(y > 2400){
  y = 200;
}
  fill(180, 20, 5);
}



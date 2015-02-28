
//psychedelic cycling ball v0.3 by golden blue 
float theta=0,radius=0,diam_ball; 
float x,y; 
int color_ball; 

void setup(){ 
  colorMode(HSB); //Hue/Saturation/Brightness
  size(1000,1000); 
  smooth(); 
  background(0); 
  noStroke(); 
} 

void draw(){ 
  diam_ball = 40*mouseX/width+40; 
  //mouseX controls the diameter of the ball 
  x = width/2+radius*sin(theta); 
  y = height/2+radius*cos(theta); 
  theta=theta + atan(diam_ball/radius); 
  if (radius>diam_ball) { 
    radius = radius + diam_ball*diam_ball/ (3*PI*radius); 
  } else { 
    radius = radius + 0.1*diam_ball; 
  } 
  if (radius>0.6*width) { 
    radius=0; 
} 
color_ball = color_ball + 1 + mouseY*20/height; 
//mouseY controls the rate of color change 
fill(color_ball%360,225,225,70); 
ellipse(x,y,diam_ball,diam_ball); 
} 


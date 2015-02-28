
float xpos;
float ypos;
float xpos2;
float ypos2;
float xpos3;
float ypos3;
float a = 90;

//Setup for Animation Area
void setup(){
  size (600,600);
  xpos = 400;
  ypos = width/2;
  xpos2 = 400;
  ypos2 = width/2;
  xpos3 = 400;
  ypos3 = height/2;
}

//Setup for Animation
void draw(){  
  
fill(0, 0);
rect(0,0,width, height);
 
fill(60,200,60);
ellipse(xpos, ypos, 40, 40);

fill(200,60,60);
ellipse(xpos2, ypos2, 40, 40);

fill(60,60,200);
ellipse(xpos3, ypos3, 40, 40);
a=a+2;

 
float xChange = cos(radians(a));
float yChange = sin(radians(a));
 
xpos += xChange*3;
ypos += yChange*4;
xpos2 -= xChange*2;
ypos2 -= yChange*1.5;
xpos3 += xChange*4;
ypos3 += yChange*3;
}

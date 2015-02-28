
float r,g,b;
float x = 0;
float y = 0;
float w,h;
float vx,vy,gravity;
void setup()

{
  background(0);
  size(450,800);
 w = random (100,400);
 h = random (100,400);
 x = random (width);
 y = random (height);
 vx = random (-20,20);
 vy = random (-20,20);
 gravity = 0;
  smooth();
  //frameRate(5);
}

void draw()
{
//if(frameCount % 20 ==0)
{
  fill(0,20);
  noStroke();

  //rect(0,0,width,height);
  stroke(r, g, b, 90);
  //we're telling processing to move the coordiante system.
  //y=noise(frameCount*.01)*.02;
  //x=noise(frameCount*.01)*900;
  r =noise(frameCount*.01)*255;
  g =noise(frameCount*.01-124324)*255;
  b =noise(frameCount*.01+334324)*255;

  
  //y=noise(0,800)*.02;
  //x=noise(0,400)*.02;
  

  stroke(255,90);
  noFill();
  ellipse(random(0,400),random(0,800),40,40);

for (int i = 0; i < 800; i = i+100) {
  
pushMatrix();
  translate(0,0);
  //ellipse(random(0,i),random(0,i),40,40);
   x = x+vx;

 y+=vy;
 
 //add gravity to the velocity in y;
 vy+=gravity;
 
 
 vx*=1;
 
 //right side border
 if(x > width) 
 {
  vx = vx*-1;
  
   x = width;
 }
 
 //left side border
 if(x < 0)
 {
   vx*=-1;
   x = 0;
   
 }
 //bottom edge
 if (y > height)
 {
   
   vy*=-1;
   y = height;
 }
 
 if (y < 0)
 
 {
   vy*=-1;
   y= 0;
 }
  ellipse(x,y,random(0,40),random(0,40));
  //ellipse(random(0,800),random(0,i),random(0,i),random(0,i));
  stroke(r, g, b,90); 
popMatrix();
}


if (mousePressed)

{
 //line(mouseX,mouseY, random(y, x), random(x,y));
}



/*
line(x1, y1, x2, y2)
line(x1, y1, z1, x2, y2, z2)
Parameters  
x1  float: x-coordinate of the first point
y1  float: y-coordinate of the first point
x2  float: x-coordinate of the second point
y2  float: y-coordinate of the second point
z1  float: z-coordinate of the first point
z2  float: z-coordinate of the second point
*/
}

}
  

  

 void mouseMoved()

{

  //bezier(random(mouseX,mouseY),random(mouseX,mouseY),random(mouseX,mouseY),random(mouseX,mouseY),random(mouseX,mouseY),random(mouseX,mouseY), random(mouseX,mouseY),random(mouseX,mouseY));
  //ellipse(random(0,400),random(0,800),400,400);
  //line(random(mouseX,mouseY), random(mouseX,mouseY),random(mouseX,mouseY),random(mouseX,mouseY));
}

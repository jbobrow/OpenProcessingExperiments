
//Robert Wohlforth - rwohlfor
//Homework 12 - Noon Shader
//Copyright Pittsburgh 2012

//This is an application to aid in the design of overhangs on buildings
//to shade south facing windows from solar radiation in months when solar
//heat is undesirable.

//The data displayed is accurate only for Pittsburgh, but the application
//will function for any city if the monthly sun angles and average 
//temperatures are replaced below. 

//The application is simplified to show only the condition at exactly 
//noon. Sun angles before and after noon will be slightly more shallow, 
//but will come from East and West rather than South.

//To use: 

//Click on each month button at the bottom of the window and observe
//the change in noon sun angle.

//Red sunlight indicates that the temperature is too hot, so shade is needed.
//Blue sunlight indicates that the temperature is cool, so sunlight is needed.

//Use the left and right arrow keys to adjust the length of the overhang, 
//attempting to find a balanced condition where blue light is allowed in,
//but red light is not.

//Use "<" and ">" keys to rotate. Use "+" and "-" keys to zoom.

//Note the ratio of the ceiling height to the overhang length to design an appropriate
//overhang for any height of space.

import processing.opengl.*;

//Enter City Name:
String City = "Pittsburgh";
//Enter monthly noon sun altitude:
float sun[] = {26.61, 32.64, 42.21, 54.34, 64.82, 71.70, 72.62, 67.41, 57.61, 46.13, 34.93, 27.66};
//Enter monthly average temperature:
float avgTemp [] = {26.1, 28.7, 39.4, 49.6, 59.5, 67.9, 72.1, 70.5, 63.9, 52.4, 42.3, 31.5};
Assembly hut = new Assembly ();
int monthVal = 7, BaseTemp = 65;
float rotation, zoom, shader, angle =  sun[monthVal], offset=1;
String months[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
color col = color(100,100,255);


void setup ()
{size (500, 500, P3D);
zoom = width-60;
}

void draw ()
{
  changeColor();
  background (200);
  pushMatrix();
  rotateEverything();
  hut.draw(zoom/2, zoom/2, zoom/2, 0, 0, shader*zoom);
  popMatrix();
  drawInterface();
}

void rotateEverything()
{
 translate (width/2, height/2);
 rotateY (rotation);
}

void keyReleased ()
{
  if (key == ',')
  {rotation = rotation + PI/20;
  }
  if (key == '.')
  {rotation = rotation - PI/20;
  }
    if (key == '=')
  {zoom = zoom + 30;
  }
  if (key == '-')
  {zoom = zoom - 30;
  }
  if (key == CODED)
  {if (keyCode == RIGHT)
  {
    shader = shader + 0.05;
  }
if (keyCode == LEFT)
  {if (shader > -.45)
  {
    shader = shader - 0.05;
  }
  }
}
}



class Assembly
{
  Solid shader = new Solid ();
Solid floor = new Solid ();
Solid leftWall = new Solid ();
  
  void draw(float structWidth, float structHeight, float structDepth, float structX, float structY, float shadeExtend)
  {
    float wallThick = 0.1*structWidth;
    pushMatrix();
    translate(structX, structY);
    shader.draw(shadeExtend/2, -structHeight/2, 0, structWidth+shadeExtend, wallThick, structDepth, 0);
  floor.draw(0, structHeight/2, 0, structWidth, wallThick, structDepth, 0);
  leftWall.draw(-structWidth/2+wallThick/2, 0, 0, wallThick, structHeight-wallThick, structDepth, 0);
  drawShade(wallThick, structWidth, structHeight, structDepth, shadeExtend);
  drawRays(wallThick, structWidth, structHeight, structDepth, shadeExtend);
  drawDims(wallThick, structWidth, structHeight, structDepth, shadeExtend);
  northArrow(wallThick, structWidth, structHeight, structDepth);
  popMatrix();
  }

void drawRays(float wall, float sWidth, float sHeight, float sDepth, float sExtend)
{
  pushStyle();
  stroke (red(col)-50,green(col)-50,blue(col)-50);
  strokeWeight (3);
  for (float z = sDepth/2; z >= -sDepth/2; z = z - 2*wall)
  {pushMatrix();
  translate (sWidth/2+sExtend, -sHeight/2+wall/2, z);
  if (sHeight/tan(radians(angle)) < sWidth+sExtend-wall)
  {
  line (0,0,-((sHeight-wall)/tan(radians(angle))),sHeight-wall);
  }
  else
  {
  line (0,0,-sWidth-sExtend+wall,tan(radians(angle))*(sWidth+sExtend-wall));
  }
   popMatrix();
  }
  popStyle();
 
}

void drawShade(float wall, float sWidth, float sHeight, float sDepth, float sExtend)
{pushMatrix();
pushStyle();
fill(50);
noStroke();
translate (sWidth/2+sExtend, -sHeight/2+wall/2, sDepth/2);
pushMatrix();
translate (-((sHeight-wall)/tan(radians(angle))),sHeight-wall-offset);
rotateX (-PI/2);
if (sHeight/tan(radians(angle)) < sWidth+sExtend-wall)
{if (sWidth+sExtend-wall-((sHeight-wall)/tan(radians(angle))) <= sWidth-wall)
{
rect (0,0,-(sWidth+sExtend-wall-((sHeight-wall)/tan(radians(angle)))),sDepth);
}
else
{
  rect (-(sWidth+sExtend-wall-((sHeight-wall)/tan(radians(angle))))-wall,0, sWidth, sDepth);
}
}
popMatrix();
pushMatrix();
translate (-sWidth-sExtend+wall+offset,tan(radians(angle))*(sWidth+sExtend-wall));
rotateZ (-PI/2);
rotateX (-PI/2);
if (sHeight/tan(radians(angle)) > sWidth+sExtend-wall)
{
rect (0,0, tan(radians(angle))*(sWidth+sExtend-wall), sDepth);
}
else
{
  rect (tan(radians(angle))*(sWidth+sExtend-wall)-sHeight+wall,0,sHeight-wall,sDepth);
}
popMatrix();
popMatrix();
popStyle();
}

void drawDims(float wall, float sWidth, float sHeight, float sDepth, float sExtend)
{pushMatrix();
pushStyle();
fill(0);
translate (-sWidth/2+wall,-sHeight/2-wall/2,sDepth/2);
  line(0,-2,0,-wall/2);
  line(sWidth-wall+sExtend, -2, sWidth-wall+sExtend, -wall/2);
  line(0, -wall/2, sWidth-wall+sExtend, -wall/2);
  textAlign(CENTER);
  textSize (16);
  text(int(((sWidth+sExtend)/zoom)*20)*10 + "%  X", (sWidth-wall+sExtend)/2, -wall/2-5);
 translate(-wall,wall);
  line(-3,0,-wall/2,0);
  line(-3,sHeight-wall, -wall/2, sHeight-wall);
  line(-wall/2, 0, -wall/2, sHeight-wall);
  textAlign(RIGHT);
  text("X",-wall/2-3,(sHeight-wall)/2);
  popStyle();
  popMatrix();
}

void northArrow(float wall, float sWidth, float sHeight, float sDepth)
{translate (-sWidth/2-1.5*wall,-sHeight/2-3*wall,sDepth/2);
pushStyle();
fill(0);
float x = 2*wall;
line(0,0, -x, 0);
line(0,-3*x/16,-x*13/16,-x*3/16);
line(0,0,0,-3*x/16);
line(-x, 0, -x*13/16,-x*3/16);
line(-x, 0, -x*3/4, x/4);
line(-x*7/8, 0, -x*21/32, x*3/16);
line(-x*21/32, x*3/16, -x*3/4, x/4);
textAlign (RIGHT, TOP);
text ("N", 0, x/16);
popStyle();
}

class Solid
{
  void draw (float locX, float locY, float locZ, float widthV,float heightV,float depthV, float rotation)
{pushMatrix();
  translate (locX,locY,locZ);
rotateY (rotation);
  //Back
  pushMatrix();
  pushStyle();
  fill (50);
translate (0,0,-depthV/2);
rect (-widthV/2, -heightV/2, widthV, heightV);
 popMatrix();
 //Left
 pushMatrix();
 translate (-widthV/2,0,0);
 rotateY (PI/2);
 rect (-depthV/2, -heightV/2, depthV, heightV);
 popStyle();
 popMatrix();
 //Right
  pushMatrix();
   pushStyle ();
 fill (col);
 translate (widthV/2,0,0);
 rotateY (PI/2);
 rect (-depthV/2, -heightV/2, depthV, heightV);
 popStyle();
 popMatrix();
 //Top
 pushMatrix();
 pushStyle ();
 fill (col);
 translate (0,-heightV/2,0);
 rotateX (PI/2);
 rect (-widthV/2, -depthV/2, widthV, depthV);
 popStyle();
 popMatrix();
 //Bottom
  pushMatrix();
  pushStyle();
  fill(50);
 translate (0,heightV/2,0);
 rotateX (PI/2);
 rect (-widthV/2, -depthV/2, widthV, depthV);
 popMatrix();
 //Front
 pushMatrix();
translate (0,0,depthV/2);
rect (-widthV/2, -heightV/2, widthV, heightV);
 popStyle();
 popMatrix();
 popMatrix();
}
}
}

void drawInterface()
{rect(0,height-height*.1,width,height+.1);
for (int i = 1; i<=12; i++)
{pushStyle();
if (i == monthVal)
{
fill (255,152,49);
}
else
{
fill (200);
}
rect (width/12*(i-1)+width*.01, height-height*.09,width/12-width*0.01,height*.08);
fill (0);
textAlign (CENTER,CENTER);
text (months[i-1], width/12*(i-1)+width/24+width*.01, height-height*.05 );
textAlign (RIGHT, TOP);
text ("City: " + City, width-2, 2);
popStyle();
}
}

void mouseReleased ()
{for (int i = 1; i<=12; i++)
{if (mouseX > width/12*(i-1)+width*.01 && mouseX < width/12*(i-1)+width*.01+width/12-width*0.01 && mouseY > height-height*.09 && mouseY < height-height*.09+height*.08)
{monthVal = i;
angle = sun[i-1];
}
}
}

void changeColor()
{if (avgTemp [monthVal-1] > BaseTemp)
{col = color(255,100,100);
}
else 
{col = color(100,100,255);
}
}


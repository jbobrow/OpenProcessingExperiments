
import java.util.*;
import processing.*;  
  
float formResolution=20;
float centerX,centerY,angle,startRadius;
  float[] x = new float[(int)formResolution];
float[] y = new float[(int)formResolution];
PImage bg;

void setup()
{
   size(600,700);
  centerX=width/2;  
 centerY=height/2;

  angle=radians(360/formResolution);  
  startRadius=50;
  bg = loadImage("back.jpg");
  //background(bg);
  background(#ffffff);
  //noStroke();
  
  stroke(#ffd626);
  fill(#ff8319,125);
  
}



void draw()
{
  
  centerX+=(mouseX-centerX)*0.1;
  centerY+=(mouseY-centerY)*0.1;
 // point(centerX,centerY);
  
  for(int i=0;i<formResolution;i++)
  {
    //println(i);
     x[i]=cos(angle*i)*startRadius;
     y[i]=sin(angle*i)*startRadius;
     if(mousePressed)
     {
     ellipse(x[i]+centerX,y[i]+centerY,5,5);
     }
  }
  
  
  
}



void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("_##.png");
  if (key == DELETE || key == BACKSPACE) background(255);
}

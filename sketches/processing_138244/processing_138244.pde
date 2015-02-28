
/*
----Statement to describe the assignment:----
View of a bunch of kites flying in the sky on a starry night through a kaledioscope

----Statement to describe the functioning behind the assignment:----
*/

/*
MOUSE
position x : to keep track of mouse's x coordinate
position y: to keep track of mouse's y coordinate

KEYS
D: to view the stars
R: to obtain the kaledioscopic vision
B: to display kites of different colors
G: to obtain a multicolor thread connecting the kites
del,backspace : to create a twinkling effect/a shooting star effect when combined with mouse movement
s: to save png */

import ddf.minim.*;
//Variables
color strokeColor; 
PImage design;

//setup()
void setup()
{
  size(800,600);
  //A blank canvas until it receives user input
  background(0);
  //to load the image of the kite made by me
  design=loadImage("images.jpg");
}

//draw()
void draw(){
  image(design,width-475,height-275,100,100);
  for(int gridY=0; gridY<8; gridY++)
  {
    for(int gridX=0;gridX<8; gridX++)
    {
      fill(0);
      stroke(strokeColor);
      beginShape();
      vertex(gridX*100+100-mouseX*0.5/8,gridY*100+100-mouseX*0.5/8); //for the twinkle effect
      endShape(CLOSE);
     }
  }
}
//keyPressed()
void keyPressed(){
  float x=random(40-width,width-40);
  strokeColor=color(random(250),random(250),random(250));
  if (key=='R')
  {
    noFill();
    float y=10;
    stroke(strokeColor);
    while(y<height)
    {
      rotate(180);
      ellipse(y,y,y,y);// for the kaledioscope effect
      y+=5;
    }
  }
  
  if(key=='G')
  {
    stroke(strokeColor);
    triangle(x-30,x-30,x+95,x+95,x+60,x+60);//for the thread connecting all the kites
  }
  if(key=='B')
  {
  stroke(#0A51FF);
  fill(strokeColor);
  rect(x,x,x,x);//for the other kites
  }
  if(key=='D')
  {
    for (int i=0;i<=200;i++)
      {
        float x1=random(800);
        float y1=random(600);
        stroke(255);
        strokeWeight(3);
        line(x1,y1,x1,y1);// for the stars in the sky
      }
   }
  noStroke();
}


//keyReleased()
void keyReleased()
{
  //to experience the twinkling effect click on del/backspace repeatedly.
  //to experience shootin star effect move the mouse parallel to the main diagonal of the screen backwards/forwards
  //however once your mouse-clicks on the screen will freeze the shooting stars 
  if(key== DELETE || key == BACKSPACE) background(0);
  //screenshot saving capability
  if(key=='s' || key== 'S') saveFrame("screenshot.png");
}


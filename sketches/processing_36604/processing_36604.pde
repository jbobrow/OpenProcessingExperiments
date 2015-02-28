
/*
Autor : Thomas Ramirez
Mail : rami.programmer[at]gmail.com
Licence : CC BY-NC-SA 2.0 (see informations on http://creativecommons.org/licenses/by-nc-sa/2.0/)
Date of publication : 10/09/2011 (DD/MM/YYYY)
Description : This is a free-to-use homemade function to draw rounded rectangles
*/

void setup()
{
  size(600,600);
  smooth();
}

void draw()
{
  background(127);
  
  // curves to test the alpha colors of our rounded rectangle :
  stroke(255);
  bezier(0,0,width/2,0,0,height/2,width,height);
  bezier(0,height,0,height/2,height,width/2,width,0);
  
  // our rounded rectangle !
  rect(100,100,400,400,-1,color(0,200),color(255,255,0,200));
}

void rect(int x,int y,int width,int height,int radius,color colorBackground,color colorEdge)
{
  // if radius is not correct, we change him with default value :
  if(radius<0 || radius>=width/2)
  {
    float percentage=(float)10/100;
    radius=int(percentage*width);
  }
  
  // this generate the rounded with the edge :
  stroke(colorBackground);noFill();
  strokeWeight(radius*2);
  strokeJoin(ROUND);
  rect(x+radius,y+radius,width-2*radius,height-2*radius);
  
  /* this rectangle is in the center of the rounded rectangle and it fills the space which
     wasn't drawed by the edge */
  strokeWeight(1);
  strokeJoin(MITER);
  if(radius<=(25*width)/100)
  {
    noStroke();fill(colorBackground);
    /* I don't know why, but on my computer, I need to correct the position of this rectangle
       depending on the alpha of the background !
    */
    float correction=map(alpha(colorBackground),75,255,0.45,0.02);
    float correction2=map(alpha(colorBackground),75,255,0.12,0.94);
    rect(  x+2*int(radius)+correction,
           y+2*int(radius)+correction,
           width-4*int(radius)+correction2,
           height-4*int(radius)+correction2
        );
  }
  
  // now we draw the edge :
  stroke(colorEdge);noFill();
  line(x+radius,y,x+width-radius,y);
  line(x+radius,y+height,x+width-radius,y+height);
  line(x,y+radius,x,y+height-radius);
  line(x+width,y+radius,x+width,y+height-radius);
  if(radius>0)
  {
    arc(x+radius-1,y+radius-1,radius*2-2,radius*2-2,PI,3*PI/2);
    arc(x+width-radius+1,y+radius-1,radius*2-2,radius*2-2,3*PI/2,TWO_PI);
    arc(x+width-radius+1,y+height-radius+1,radius*2-2,radius*2-2,0,PI/2);
    arc(x+radius-1,y+height-radius+1,radius*2-2,radius*2-2,PI/2,PI);
  }
}


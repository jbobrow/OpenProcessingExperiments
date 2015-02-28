
//homework 4  
//copyright Kristen McConnell September 2011 Pittsburgh PA 15221 

//Variables
float x,y,wd,ht;
int dia;

//Color Variables
color col, col2, col3, col4, col5;
   
//Initial Setup
void setup()
{
  size(450,450);  
  smooth();  
  ellipseMode(CORNER);  
  dia = 300; //diameter 
  wd = dia; //width  
  ht = dia; //height
  x = 75;
  y = 75;  
  
  //Initial Color Settings
  col = color(240,214,255);
  col2 = color(214,255,233);
  col3 = color(0,98,98);
  col4 = color(0,27,98);
  col5 = color(85,0,98);
}

void draw()
{
  //background
  background(256,256,256);  
  
  //background circle;  
  fill(col);  
  noStroke();  
  ellipse(x,y,wd,ht);  
 
  //A: Color and Placement  
  stroke(col5);  
  strokeWeight(5);  
  fill(col2);  
  beginShape();  
   curveVertex(x + .36*wd, y + .6*ht);  
   curveVertex(x + .2*wd, y + .85*ht);  
   curveVertex(x + .3*wd, y + .91*ht);  
   curveVertex(x + .3*wd, y + .6*ht);  
   vertex(x + .4*wd, y + .45*ht);  
   vertex(x + .575*wd, y + .45*ht);  
   vertex(x + .65*wd, y + .9*ht);  
   curveVertex(x + .8*wd, y + .85*ht);  
   curveVertex(x + .675*wd, y + .95*ht);  
   curveVertex(x + .75*wd, y + .85*ht);  
   curveVertex(x + .575*wd, y + .15*ht);  
   curveVertex(x + .5*wd, y);  
   curveVertex(x + .425*wd, y + .15*ht);  
   curveVertex(x + .2*wd, y + .85*ht);  
   curveVertex(x + .2*wd, y + .85*ht);  
  endShape(); 

  //inside of the A: Color and Placement  
  fill(col);  
  beginShape();  
   vertex(x + .425*wd, y + .375*ht);  
   vertex(x + .57*wd, y + .375*ht); 
   vertex(x + .5*wd, y + .1*ht);  
   vertex(x + .425*wd, y + .375*ht);  
  endShape(); 

  //back of the k: Color and Placement  
  noStroke();  
  fill(col3);  
  beginShape();  
   curveVertex(x + .05*wd, y + .45*ht);  
   curveVertex(x + .05*wd, y + .3*ht);  
   curveVertex(x + .1*wd, y + .25*ht);  
   curveVertex(x + .15*wd, y + .325*ht);  
   curveVertex(x + .15*wd, y + .65*ht);  
   curveVertex(x + .1*wd, y + .75*ht);  
   curveVertex(x + .05*wd, y + .65*ht);  
   curveVertex(x + .05*wd, y + .3*ht);  
   curveVertex(x + .05*wd, y + .3*ht);  
  endShape(); 

  //top arm of k: Placement
  beginShape();  
   curveVertex(x + .15*wd, y + .45*ht);  
   curveVertex(x + .15*wd, y + .45*ht);  
   curveVertex(x + .25*wd, y + .35*ht);  
   curveVertex(x + .3*wd, y + .35*ht);  
   curveVertex(x + .3*wd, y + .4*ht);  
   curveVertex(x + .15*wd, y + .55*ht);  
   curveVertex(x + .15*wd, y + .45*ht);  
   curveVertex(x + .15*wd, y + .45*ht);  
  endShape(); 

  //bottom arm of k: Placement
  beginShape();  
   curveVertex(x + .15*wd, y + .5*ht);  
   curveVertex(x + .17*wd, y + .5*ht);  
   curveVertex(x + .2*wd, y + .5*ht);  
   curveVertex(x + .34*wd, y + .7*ht);  
   curveVertex(x + .325*wd, y + .75*ht);  
   curveVertex(x + .25*wd, y + .7*ht);  
   curveVertex(x + .15*wd, y + .55*ht);  
   curveVertex(x + .15*wd, y + .55*ht);  
  endShape();  
   
  //M: Color and Placement
  fill(col4);  
  beginShape();  
   curveVertex(x + .7*wd, y + .45*ht);  
   curveVertex(x + .6*wd, y + .35*ht);  
   curveVertex(x + .675*wd, y + .3*ht);  
   curveVertex(x + .775*wd, y + .375*ht);  
   curveVertex(x + .875*wd, y + .3*ht);  
   curveVertex(x + .95*wd, y + .35*ht);  
   curveVertex(x + .95*wd, y + .675*ht);  
   curveVertex(x + .9*wd, y + .75*ht);  
   curveVertex(x + .85*wd, y + .675*ht);  
   curveVertex(x + .85*wd, y + .45*ht);  
   curveVertex(x + .775*wd, y + .5*ht);  
   curveVertex(x + .7*wd, y + .45*ht);  
   curveVertex(x + .7*wd, y + .675*ht);  
   curveVertex(x + .65*wd, y + .75*ht);  
   curveVertex(x + .6*wd, y + .675*ht);  
   curveVertex(x + .6*wd, y + .35*ht);  
    curveVertex(x + .6*wd, y + .35*ht);  
  endShape();  
}

//Changes via Different Key Presses
void keyPressed()
{
  
  //Increase Size of Initials via +/= Keys
  if((key == '+') || (key == '='))
  {
    dia = dia + 10;
    wd = dia; //width  
    ht = dia; //height  
  }
  
  //Decrease Size of Initials via -/_ Keys
  else if ((key == '-') || (key == '_'))
  {
    dia = dia - 10;
    wd = dia; //width  
    ht = dia; //height  
  }
  
  //Move Initials to the Right via the Right Arrow
  else if (keyCode == RIGHT)
  {
    x = x+10;
  }
  
  //Move Initials to the Left via the Left Arrow
  else if (keyCode == LEFT)
  {
    x = x-10;
  }
  
  //Move Initials Up via the Up Arrow
  else if (keyCode == UP)
  {
    y = y-10;
  }
  
  //Move Initials Down via the Down Arrow
  else if (keyCode == DOWN)
  {
    y = y+10;
  }
  
  //Hit the Spacebar to Return to the Original Settings
  else if (key == 32)
  {
    col = color(240,214,255);
    col2 = color(214,255,233);
    col3 = color(0,98,98);
    col4 = color(0,27,98);
    col5 = color(85,0,98);
    x = 75;
    y = 75;
    dia = 300; //diameter 
    wd = dia; //width  
    ht = dia; //height 
  }
  
  //Hit the k/K Key to Change the Color of the K Initial
  else if ((key == 'k') || (key == 'K'))
  {
    col3= color(0, random(256), 0);
    fill(col3);
  }
  
  //Hit the m/M Key to Change the Color of the M Initial
  else if ((key == 'm') || (key == 'M'))
  {
    col4= color(0, 0, random(256));
    fill(col4);
  }
  
  //Hit the a/A Key to Change the Color of the A Initial
  else if ((key == 'a') || (key == 'A'))
  {
    col2= color(random(256), random(256), random(256));
    fill(col2);
    col5= color(random(256), random(256), random(256));
    stroke(col5);
  }
}
 
//Click the Mouse Button to Change the Color of the Background Circle
void mousePressed()
{
  noStroke();
  col= color(random(256), 0, 0);
  fill(col);
}

//Click and Drag the Mouse Button to Move the Initials Around
void mouseDragged()
{
  x = mouseX - width/2.75;  
  y = mouseY - width/2.75; 
}


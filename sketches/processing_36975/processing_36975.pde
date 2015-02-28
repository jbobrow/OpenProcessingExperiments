
//Homework 4
//copyright Maitri Shah September 2011 Pittsburgh,PA



float x,y,wd,ht;
int deltaw, deltah;
color col1, col2, col3;


void setup()
{
  size(500,500);
  smooth();
  x=250;
  y=250;
  wd=25;
  ht=25;
  deltaw = 1;
  deltah = 1;
  col1 = color(255,128,0);
  col2 = color(random(0),random(255),random(0));
  col3 = color(random(255),random(0),random(0));

}


void draw()
{
  //Repeating Background
  noStroke();
  fill(255,255,255);
  rect(0,0,500,500);
  
  //Base Circle
  stroke(0);
  strokeWeight(1);
  fill(117, 129,191,60);
  ellipse(x,y,16*wd,16*ht);


  //letter D
  stroke(col1);
  strokeWeight(6);
  noFill();

  beginShape();

   curveVertex(x-4*wd,y-8*ht);
   curveVertex(x-2*wd,y-7*ht);
   curveVertex(x,y-6*ht);
   curveVertex(x+wd,y-5*ht);
   curveVertex(x+2*wd,y-3*ht);
   curveVertex(x+3*wd,y);
   curveVertex(x+3*wd,y+5*ht);
   curveVertex(x+wd,y+7*ht);
   curveVertex(x-wd,y+7*ht);
   curveVertex(x-3*wd,y+6*ht);
   curveVertex(x-3*wd,y+4*ht);
   curveVertex(x-2*wd,y+2*ht);
   curveVertex(x,y-ht);
   curveVertex(x+wd,y+ht);
   curveVertex(x+3*wd,y+2*ht);
   curveVertex(x+4*wd,y+3*ht);

  endShape();

 //Letter M

  stroke(col2);
  strokeWeight(10);

  beginShape();

   curveVertex(x-9*wd,y+4*ht);
   curveVertex(x-7*wd,y+2*ht);
   curveVertex(x-7*wd,y-2*ht);
   curveVertex(x-6*wd,y-3*ht);
   curveVertex(x-5*wd,y-3*ht);
   curveVertex(x-4*wd,y+2*ht);
   curveVertex(x-3*wd,y-3*ht);
   curveVertex(x-2*wd,y-3*ht);
   curveVertex(x- wd,y-2*ht);
   curveVertex(x- wd,y+2*ht);
   curveVertex(x+wd,y+4*ht);

  endShape();

 //Letter S

  stroke(col3);
  strokeWeight(12);

  beginShape();

   curveVertex(x+6*wd,y-4*ht);
   curveVertex(x+5*wd,y-5*ht);
   curveVertex(x+3*wd,y-6*ht);
   curveVertex(x+2*wd,y-6*ht);
   curveVertex(x     ,y-5*ht);
   curveVertex(x     ,y-3*ht);
   curveVertex(x+wd  ,y-  ht);
   curveVertex(x+2*wd,y     );
   curveVertex(x+4*wd,y     );
   curveVertex(x+6*wd,y+  ht);
   curveVertex(x+7*wd,y+2*ht);
   curveVertex(x+7*wd,y+4*ht);
   curveVertex(x+5*wd,y+6*ht);
   curveVertex(x+3*wd,y+6*ht);
   curveVertex(x+  wd,y+5*ht);
   curveVertex(x+  wd,y+3*ht);

  endShape();
}


void keyPressed()
{
  if ( keyCode == RIGHT )
  {
    x = x + 5;
  }

  else if ( keyCode == DOWN )
  {
    y = y + 5;
  }

  else if ( keyCode == LEFT )
  {
    x = x - 5;
  }
  
  else if (keyCode == UP )
  {
    y = y - 5;
  }
  

  else if ( key == 'g')
  {
    if( wd <=  - 25 || wd >= 25)
     {
      deltaw = -deltaw ;
     }
      
    wd   = wd + deltaw;
    col2 = color(random(0),random(255),random(0));
  }
  
  
  else if ( key == 'h' )
  {
    if( ht <= -25 || ht >= 25 )
    {
      deltah = -deltah;
    }
    
    ht = ht + deltah;
    col3 = color(random(255),random(0),random(0));
    
  }
  
  else if (key == 'b' )
  {
    x=250;
    y=250;
    wd=25;
    ht=25;
  }


}

void mousePressed()
{
  if ( mouseButton == CENTER )
  {
    x = mouseX;
    y = mouseY;
  }


  else if ( mouseButton == LEFT )
  {
    wd = wd - 5;
    ht = ht - 5;
  }
  
  else if ( mouseButton == RIGHT )
  {
    wd = wd + 5;
    ht = ht + 5;
  }

}



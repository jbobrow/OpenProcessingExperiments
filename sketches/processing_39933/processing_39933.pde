
//Cristina Mele    
// Computing for the Arts with Processing    
// 51-257    
// Copyright © Cristina Mele    
// September 2011 
// Homework 7
// Tuesday 0920 A

// Wrapping Motion


float x, y, dia, deltaX, deltaY;
color blu,darkOrang,orang;
PFont univers;


void setup( )
{
  size( 400, 400);
  smooth();
  
  x = width/2;
  y = height/2;
  
  orang = color(250,200,140);  
  darkOrang = color(240,90,50);  
  blu = color(140,160,190);
  
  dia= width/4;
  
  deltaX=2;
  deltaY=2;
  
  univers = loadFont("UniversLTStd-48.vlw");
}

void draw( )
{
  background (blu);
  drawSpeed();
  drawInitials(x,y,dia,dia);
  moveInitials();
  initialsSpeed();
  reset();

}


void moveInitials( )
{
  x=x+deltaX;
  y=y+deltaY;
  
   if ( x > width + dia/2 ) //right
   {
      x = -dia/2;
   }
    
   if ( x < -dia/2 ) //left
   {
      x = width + dia/2;
   }
    
   if ( y > height + dia/2 ) //top
   {
      y = -dia/2;
   }
    
   if ( y < -dia/2 ) //bottom
   {
      y = height + dia/2;
   }
}
   
   
   
void initialsSpeed()   
{
  if (mouseX > pmouseX)
  {
    deltaX = deltaX + .2;
  }

  if (mouseX < pmouseX)
  {
   deltaX = deltaX -.2;
  }

  if (mouseY > pmouseY)
  {
    deltaY = deltaY + .2;
  }

  if (mouseY < pmouseY)
  {
    deltaY = deltaY - .2;
  }

}


void reset( )
{
   if (keyPressed==true) 
   {
     x = width/2;
     y = height/2;
   }
}



void drawSpeed()
{
  fill(255);
  textFont(univers,15);
  text("vertical speed:" + ' ' + deltaY, width-width+10, height-35);
  text("horizontal speed:" + ' ' + deltaX, width-width+10, height-15);

    
}






void drawInitials(float x, float y, float wd, float ht)
{
  //circle    
  fill(orang);    
  noStroke();    
  ellipse (x,y,wd+(.075*wd),ht+(.075*ht));    
  strokeWeight(2);    
  stroke(blu);    
  ellipse (x,y,wd,ht);   

  //C   
  strokeWeight(1);    
  stroke(darkOrang);  
  beginShape();    
  curveVertex( x-(.1*wd),y-(.3*ht));    
  curveVertex( x-(.1*wd),y-(.3*ht));    
  curveVertex(x-(.32*wd), y-(.3*ht));    
  curveVertex(x-(.32*wd), y-(.3*ht));    
  curveVertex( x-(.32*wd), y+(.3*ht));    
  curveVertex(x-(.32*wd), y + (.3*ht));    
  curveVertex(x-(.1*wd), y+(.3*ht));    
  curveVertex(x-(.1*wd), y + (.3*ht));    
  endShape( );   

  //L    
  beginShape();    
  curveVertex(x,y-(.4*ht) );    
  curveVertex(x,y-(.4*ht) );    
  curveVertex(x,y+(.4*ht) );    
  curveVertex(x,y+(.4*ht) );    
  curveVertex(x+(.2*wd),y+(.4*ht) );    
  curveVertex(x+(.2*wd),y+(.4*ht) );    
  endShape();    
        
  //M    
  beginShape();    
  curveVertex(x+(.15*wd),y+(.3*ht) );    
  curveVertex(x+(.15*wd), y+(.3*ht) );    
  curveVertex(x+(.15*wd),y-(.25*ht) );    
  curveVertex(x+(.15*wd),y-(.25*ht) );    
  curveVertex(x+(.25*wd),y+(.1*ht) );    
  curveVertex(x+(.25*wd),y+(.1*ht) );    
  curveVertex(x+(.35*wd),y-(.25*ht) );    
  curveVertex(x+(.35*wd),y-(.25*ht) );    
  curveVertex(x+(.35*wd),y+(.3*ht) );    
  curveVertex(x+(.35*wd),y+(.3*ht) );    
  endShape();
}




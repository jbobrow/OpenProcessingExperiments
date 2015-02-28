
//Cristina Mele    
// Computing for the Arts with Processing    
// 51-257    
// Copyright © Cristina Mele    
// September 2011 
// Homework 6


float x,y,wd,ht;  
color blu,darkOrang,orang;  
int mCount; 

void setup()  
{  
  x=0;     
  y=0;    
  
  mCount = 0;  
  orang = color(250,200,140);  
  darkOrang = color(240,90,50);  
  blu = color(140,160,190); 

  size(400,400);    
  background (blu);    
  noFill();    
  smooth();  
} 

    

void draw()  
{      
  //background (blu);
  
   
  while(x<=width)
  {
    drawInitials(x-25,y-25,45,45);
    x = x+70;   
  } 
 
     x=25;
 while(y<=height)
  {

    drawInitials(x,y+25,45,45);
    y = y+1; 
    x=x+70;  
  }  
  x=frameCount;
  y=frameCount;
  
     
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


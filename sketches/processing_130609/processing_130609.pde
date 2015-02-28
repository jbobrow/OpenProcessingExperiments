
// © julia shen
// yuans @ andrew.cmu.edu

// click around for sound

import ddf.minim.*;

Minim minim;
AudioPlayer s1, s2, s3, s4, s5, s6, s7, s8;

boolean bShowCircle=false;
float opacity;
int diam = 0; 


void setup( )
{
   size( 800, 200 );
   opacity=255;
   noStroke();
   
   
  minim = new Minim(this);
  s1 = minim.loadFile("c.wav");
  s2= minim.loadFile("a.wav");
  s3= minim.loadFile("b.wav");
  s4= minim.loadFile("g.wav");
  s5= minim.loadFile("e.wav");
  s6= minim.loadFile("f.wav");
  s7 = minim.loadFile("gm.wav");
  s8= minim.loadFile("d.wav");
 
}


void draw()
{
  background(0);
  frameRate(90);
  
 
    
  if (bShowCircle) {
      
       
   fill(255, opacity);
   ellipse(mouseX, mouseY, diam, diam);
   ellipse(mouseX, mouseY, diam*.75, diam*.75);
   ellipse(mouseX, mouseY, diam*.5, diam*.5);
   ellipse(mouseX, mouseY, diam*.25, diam*.25);
   

   opacity--;
   diam++; 
   
    
  
  }
 

  
}



void mousePressed()
{
  
  
  if ( dist(mouseX, mouseY, 50 , height/2) < 60) 
  {
  
    s1.play();
    s1=minim.loadFile("c.wav");
  
  }
  
  if ( dist(mouseX, mouseY, 150, height/2) < 60)
  {
    s2.play();
    s2=minim.loadFile("a.wav");
  }
  
   if ( dist(mouseX, mouseY, 250, height/2) < 60)
  {
    s3.play();
      s3= minim.loadFile("b.wav");

  }
  
   if ( dist(mouseX, mouseY, 350, height/2) < 60)
  {
    s4.play();
      s4= minim.loadFile("g.wav");

  }
  
   if ( dist(mouseX, mouseY, 450, height/2) < 60)
  {
    s5.play();
      s5= minim.loadFile("e.wav");

  }
  
   if ( dist(mouseX, mouseY, 550, height/2) < 60)
  {
    s6.play();
      s6= minim.loadFile("f.wav");

  }
  
   if ( dist(mouseX, mouseY, 650, height/2) < 60)
  {
    s7.play();
      s7= minim.loadFile("gm.wav");

  }
  
   if ( dist(mouseX, mouseY, 750, height/2) < 60)
  {
    s8.play();
      s8= minim.loadFile("d.wav");

  }
}



void mouseClicked()
{
   bShowCircle = true;
   opacity=255;
   diam=0;
   
   
  
}

void stop()
{
  s1.close();
  
  minim.stop();
  super.stop();
  
}


 



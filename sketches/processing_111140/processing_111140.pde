
//Homework 5
//Reproducion of code wihout consent is prohibited
//Coral Pais, Carnegie Mellon University

float x,y, wd, ht,easingCoefficient,r,g,b;
int i, e, n, m, h;
void setup ( )
{
  size (400,400);
  x=width*0.5;
  y=height*0.5;
  wd=width;
  ht=height;
  e=1;
  n=1;
  m=1;
  h=1;
  easingCoefficient = 0.1;
  r=17;
  g=142;
  b=142;
  
  
  
  
}

void draw ()
{
  background (r,g,b);
  drawFace ( );
  drawEyes (e);
  drawNose(n);
  drawMouth(m);
  drawHair (h);
  drawText (e,n,m,h);
  
}



void drawFace ( )
{
  strokeWeight (3);
  fill (232,205,186);
  ellipse (x,y,wd*0.6,ht*0.85);
  //eyebrows
  noFill( );
  arc (x-wd*0.0675, y+ht*0.12,wd*0.425,ht*0.4375,radians(240), radians(260));
  arc (x+wd*0.0675, y+ht*0.12,wd*0.425,ht*0.4375,radians(280), radians(300));
}

void drawEyes (int e )
{
  if (e==1)
  {
    fill (255);
    ellipse (x-wd*0.12, y-ht*0.0125, wd*0.125, ht*0.125);
    ellipse (x+wd*0.12, y-ht*0.0125, wd*0.125, ht*0.125);
    fill (0); //black
    ellipse (x-wd*0.1, y-ht*0.008, wd*0.075, ht*0.075);
    ellipse (x+wd*0.145, y-ht*0.008, wd*0.075, ht*0.075);
  }
  else if (e==2)
  {
    arc(x+wd*0.1125, y-ht*0.0375,wd*0.125,ht*0.1375, radians(0), radians(180));
    arc(x-wd*0.1125, y-ht*0.0375,wd*0.125,ht*0.1375, radians(0), radians(180));
    
  }
  
  else if (e==3)
  {
    strokeWeight (3);
    noFill( );
    arc(x-wd*0.1, y,wd*0.1175,ht*0.125, radians (10), radians (200), CHORD);
    fill (0);
    arc(x-wd*0.1, y,wd*0.0425,ht*0.05, radians (10), radians (200), CHORD);
    noFill( );
    arc(x+wd*0.1, y, wd*0.1175,ht*0.125, radians (-20), radians (170), CHORD);
    fill (0);
    arc(x+wd*0.1, y, wd*0.0425,ht*0.05, radians (-20), radians (170), CHORD);
  }
}

void drawNose (int n )
{
  
  if (n==1)
  {
    noFill( );
   arc (x+wd*0.21, y-ht*0.0525,wd*0.425,ht*0.4375,radians(120), radians(180));
   line (x+wd*0.1025, y+ht*0.1325,x+wd*0.01, y+ht*0.16);
    
  }
  
  else if (n==2)
  {
    noFill( );
    arc (x+wd*0.0625, y+ht*0.2125,wd*0.11,ht*0.135,radians(210), radians(270));
    line (x, y+ht*0.05,x+wd*0.0625, y+ht*0.1375);
  }
  
  else if (n==3)
  {
    strokeWeight (3);
    noFill( );
    arc (x-wd*0.0625, y+ht*0.212,wd*0.2,ht*0.135,radians(270), radians(320));
    line (x,y+ht*0.05,x-wd*0.0625, y+ht*0.1375);
  }
}

void drawMouth ( int m )
{
  if (m==1)
   {
     noFill( );
      stroke (0);
      strokeWeight (3);
      arc(x, y-ht*0.1175, wd*0.65, ht*0.72, radians(60), radians(120));
    }
   else if (m==2)
   
   {
    noFill( );
    stroke (0);
    strokeWeight (3);
    arc(x, y+ht*0.35, wd*0.325, ht*0.2375, radians(200), radians(340));
   }
   
   else if (m==3)
   
   {
      fill(0);
      stroke (0);
      strokeWeight (3);
      ellipse(x, y+ht*0.2875,wd*0.125,ht*0.075);
   }
}

void drawHair ( int h )
{
  if (h==1)
  {
  fill (0);
  arc (x-wd*0.1425, y-ht*0.3, wd*0.4575, ht*0.375,radians(-40), radians(126));
  arc (x+wd*0.15, y-ht*0.35, wd*0.3425, ht*0.37,radians(50), radians(200));
  arc (x, y-ht*0.25, wd*0.5, ht*0.417,radians(140), radians(375));
  arc (x-wd*0.225, y-ht*0.1875, wd*0.1375, ht*0.125,radians(40), radians(270) );
  arc (x+wd*0.195, y-ht*0.2525, wd*0.1725, ht*0.18,radians(-90), radians(200) );
  }
  
  else if (h==2)
  {
    strokeWeight (4);
    fill (0);
    stroke (0);
    bezier (x-wd*0.025, y-ht*0.425, x-wd*0.6, y-ht*0.425,x-wd*0.075, y+ht*0.425,x-wd*0.425, y+ht*0.425);
    bezier (x-wd*0.025, y-ht*0.425, x+wd*0.6, y-ht*0.425,x+wd*0.075, y+ht*0.425,x+wd*0.425, y+ht*0.425);
  }
  else if (h==3)
   
   {
     noFill( );
     strokeWeight (1);
     stroke (0);
     for (i=220; i<=320; i+=2)
      {
        line (x+wd*0.3*cos (radians(i)), y+ht*0.425*sin (radians(i)), x+wd*0.35*cos (radians(i)), y+ht*0.475*sin (radians(i)));
        
      }
      
   }
  
}


void keyPressed( )
{
  
   if (key=='e')
    {
      e++;
      if (e==4)
      e=1;
      
    }
    if (key=='n')
    {
      n++;
      if (n==4)
      n=1;
      
    }
     
      if (key=='m')
    {
      m++;
      if (m==4)
      m=1;
      
    }
    
    if (key=='h')
    {
      h++;
      if (h==4)
      h=1;
      
    }

}

void mouseDragged ( )
{
  
  if (mouseX>=x-wd*0.3 && mouseX <= x+wd*0.3)
    if (mouseY >= y-ht*0.85 && mouseY <= y+ht*0.85)
  {float dx = mouseX - x;
  float dy = mouseY - y;
   x = x + ( dx * easingCoefficient );
  y = y + ( dy * easingCoefficient );
  }
  
}

void mousePressed ( )
{
  r=mouseX;
  g=mouseY;
  b=random(255);
 
} 

void drawText (int e, int n, int m, int h)
{
  textSize(32);
  if (e==1 && n==1 && m==3 && h==1)
    text ("Scared", 0,40);
  if (e==2 && n==1 && m==1 && h==2)
    text ("Happy", 0,40);
  if (e==1 && n==2 && m==2 && h==1)
    text ("Sad", 0,40);
  if (e==3 && n==3 && m==2 && h==3)
    text ("Angry", 0,40);
  
  
}

  
  



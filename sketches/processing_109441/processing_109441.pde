
//Homework4
//Reproducion of code wihout consent is prohibited
//Coral Pais, Carnegie Mellon University

float x, y, wd, ht,radius,r,g,b,br,bg,bb,w;
int n;

void setup ( )
{
  size(500,500);
  fill (0,0,0);
  x= width*0.5;
  y=height*0.5;
  wd=width*0.1;
  w=wd/8;
  ht=height*0.1;
  radius=width*0.16;
  n=12;
  rect (0, 0, width, height);
  r=255;
  g=255;
  b=255;
  
  br=0;
  bg=0;
  bb=0;
 
}

void draw ( )
{
  background (br,bg,bb);
  
  noStroke();
  fill(237,28,36);
  rect (width-wd-10,ht,wd,ht);
  rect (width-wd-10,8*ht,ht/8,ht);
  fill(255,127,39);
  rect (width-wd-10,2*ht,wd,ht);
  rect (width-7*w-10, 8*ht,ht/8,ht);
  fill(255,242,0);
  rect (width-wd-10,3*ht,wd,ht);
  rect (width-6*w-10, 8*ht,ht/8,ht);
  fill(34,177,76);
  rect (width-wd-10,4*ht,wd,ht);
  rect (width-5*w-10,8*ht,ht/8,ht);
  fill(0,162,232);
  rect (width-wd-10,5*ht,wd,ht);
  rect (width-4*w-10,8*ht,ht/8,ht);
  fill(63,72,204);
  rect (width-wd-10,6*ht,wd,ht);
  rect (width-3*w-10,8*ht,ht/8,ht);
  fill(163,73,164);
  rect (width-wd-10,7*ht,wd,ht);
  rect (width-2*w-10,8*ht,ht/8,ht);
  fill(255);
  rect (width-w-10,8*ht , ht/8, ht);
  noFill();
  stroke (255);
  rect (width-wd-60, height-38, wd*2, ht*0.5);
  
  text ("Click on the palette on the right to change the color of the design", 20,20);
  text ("Click on the center of the design and drag to new position", 20,40);
  text ("Arrow Keys-Change Design   Any Key-Change Background Color       Click for Default", 20,height-20);
  
  
  
  strokeWeight(2);  
  stroke(r,g,b);  
  noFill( );
  for (int i=0; i<=n; i++)
  {
      ellipse (x+radius*cos(radians(i*360/n)),y+radius*sin(radians(i*360/n)),radius*2,radius*2);
  }
  
}

void keyPressed( )
{
   
    if (key==CODED)
     
      {if (keyCode== UP)
         n++;
       
        else if (keyCode==DOWN)
            {
              if (n>1)
              n--;
            }
      else if (keyCode == LEFT)
           { 
             radius++;
           }
       
      else if (keyCode == RIGHT)
          {
            radius--;
          }
        
      }
     
     else
    {
      br=random(255);
      bg=random (255);
      bb=random (255);
    } 

}

//palette
void mousePressed ()

{
  println (mouseX);
  if (mouseX>= width-wd-10 && mouseX<= width-10)
    {
      if (mouseY>= ht  && mouseY< 2*ht)
          {r=237; g=28; b=36;}
      else if (mouseY>= 2*ht  && mouseY< 3*ht)
          {r=255; g=127; b=39;}
      else if (mouseY>= 3*ht  && mouseY< 4*ht)
          {r=255; g=242; b=0;}
      else if (mouseY>= 4*ht  && mouseY< 5*ht)
          {r=34; g=177; b=76;}
      else if (mouseY>= 5*ht  && mouseY< 6*ht)
          {r=0; g=162; b=232;}
      else if (mouseY>= 6*ht  && mouseY< 7*ht)
          {r=63; g=72; b=204;}
      else if (mouseY>= 7*ht  && mouseY< 8*ht)
          {r=163; g=73; b=164;}
      else if (mouseY>= 8*ht  && mouseY< 9*ht)
          {r=random(255); g=random(255); b=random(255);}
    }
    
    else if (mouseX>= width-wd-60 && mouseX<= width-wd-60+(wd*2))
    {
      if (mouseY>=height-38  && mouseY<= height-38+( ht*0.5))
          {x= width*0.5;
            y=height*0.5;
            wd=width*0.1;
            ht=height*0.1;
            radius=width*0.16;
           n=12;
           r=255; g=255; b=255; 
           br=0; bg=0; bb=0;}
      
    }
    
    else if (mouseX>= x-wd && mouseX<= x+wd)
    {
      if (mouseY>= y-ht  && mouseY<= y+ht)
          {x=mouseX;
            y=mouseY;}
      
    }
  
  
  
  
}



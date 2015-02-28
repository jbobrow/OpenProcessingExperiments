
float c;

void setup ()
{
 size (600,600);
 noFill ();
frameRate (10);
 background (0,0,0);
    c=1;   


}

void draw ()
{
 
  circleloop();
  excitingcolor();
}

 void keyPressed ()
{
 

    if (key == ' ') 
 {
   c=c+1;
   fill (0,255,0);
   strokeWeight (c);
 }
}

void circleloop()
{
 for (int x=0; x < width; x+=10)
   {
      line (x,0,width/2,width/6);
   } 
  for (int x=0; x < width; x+=10)
   {
      line (width/2,width/6,x, width/3);
   } 
   for (int x=0; x < width; x+=10)
   {
      line (x,width/3,width/2,width/2);
   } 
  for (int x=0; x < width; x+=10)
   {
      line (width/2,width/2,x, 2*(width/3));
   } 
   for (int x=0; x < width; x+=10)
   {
      line (x,2*(width/3),width/2,5*(width/6));
   } 
     for (int x=0; x < width; x+=10)
   {
      line (width/2,5*(width/6),x, height);
   } 
}


void excitingcolor ()
    {
      if (0 < mouseX && mouseX < width && 0 < mouseY && mouseY< height)
      {
        stroke (random(255),random(255),random(255));
      }
      if (mousePressed)
      {
       stroke (255,255,255); 
      }
    }
    


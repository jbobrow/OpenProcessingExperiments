
/*
Justin Lee
Massive Scale
* Just move the mouse
*/

Blitxer a,b,c;
int g, h, i;

void setup()
{
  size (640,480);
  smooth();
  
  a = new Blitxer();
  a.x = 40;
  a.y = 40;
 
 g = 0;
 h=206;
 i = 206;
}

void draw()
{
  fill(0,2);
  rect(0,0,width,height);
  fill(i, h, g);
  for(int x = 0  ; x<100 ; x += 2 )
  {
    stroke(255);
    line(pmouseY,pmouseY,mouseX,mouseY);
  }
  for(int i=0;i<100;i++)
  {
    noStroke();
    //fill(206,206,g);
    ellipse(width/2+random(-640,480),height/2+random(-640,480), 10,10);
  }
    
  a.show();
}
  /*line(pmouseY,pmouseY,mouseX,mouseY);
  line(pmouseY+50,pmouseY+50,mouseX+50,mouseY+50);
  line(pmouseY,pmouseX,mouseY,mouseX);
  line(pmouseY+50,pmouseX+50,mouseY+50,mouseX+50);
  rect(mouseX,mouseY,50, 50);
  rect(mouseY,mouseX,50, 50);
  line(pmouseY,pmouseY,mouseY,mouseX);
  line(pmouseY+50,pmouseY+50,mouseY+50,mouseX+50);
  rect(mouseX,mouseX,50, 50);
  rect(mouseY,mouseX,50, 50);
  */
  class Blitxer
  {
    float x,y;
  
  void show()
  {
    //if (mousePressed == true) 
  
  
  if(keyPressed)
  {
   if (key == ' ') 
   {
     background (255);
   }
   if (key == 's')
   {
     g = round(random(255));
     h = round(random(255));
     i = round(random(255));
     
   }
   
  }
}
  }


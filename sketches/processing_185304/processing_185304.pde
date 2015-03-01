
void setup() 
  { 
   size(400,400);
   background(20);
  } 
   
   
float b=random(255);
float c=random(255); 

void draw()
{
  tray();
  chalk();
}

void tray()
{

  noStroke(); 
  fill(150,100,63);rectMode(CORNER); rect(0,365,width,20);
  fill(b,192,203);rectMode(CENTER); rect(5*width/9,380,50,15);
  fill(152,c,152);rectMode(CENTER); rect(3*width/4,380,50,15);
  fill(205,133,63);rectMode(CORNER); rect(0,380,width,20);
}

void chalk()
  { 
    float a=random(50,350);

     if (mousePressed&&(mouseButton==LEFT))
        {
          if (pmouseY<360)
          {
            noStroke(); 
              if (pmouseX<a)
               { 
                fill(b,192,203,150);
               }
              else
              {
                fill(152,c,152,150);
              }
            ellipseMode(CENTER); ellipse(mouseX,mouseY,10,10);
          } 
        }
     else if (mousePressed&&(mouseButton==RIGHT))
        {
          if(pmouseY<350)
           {
              noStroke();
              fill(20,100);
              rectMode(CENTER); rect(mouseX,mouseY,60,30,20);
           }
        }        
  }


int y=200+mouseY;
int speed=10;

void setup ()
{
  size(500,500);
  smooth();
  background(176,226,255);
  frameRate(24);
  cursor(HAND);
}

void draw()
{
  
  if ((mouseY>0) && (mouseY<=100))
  
  {
    noStroke();
    
    //ellipse 1
    int a= int(random(200,210));
    int b= int(random(200,210));
    int c= int(random(200,210));
    int opacity= int(random(10,40));
    
    fill(a,b,c,opacity);
    
    //ellipse 1
    ellipse(pmouseX+25,pmouseY,40,40);
    
    //ellipse 2
    ellipse(pmouseX,pmouseY+25,40,40);
    
    //ellipse 3
    ellipse(pmouseX-10,pmouseY-10,40,40);
  }
  
  else if ((mouseY>0) && (mouseY<100))
  
  {
    noStroke();
    
    //ellipse 1
    int a= int(random(0,5));
    int b= int(random(5,5));
    int c= int(random(0,5));
    int opacity= int(random(10,40));
    
    fill(a,b,c,opacity);
    
    //ellipse 1
    ellipse(pmouseX+25,pmouseY,40,40);
    
    //ellipse 2
    ellipse(pmouseX,pmouseY+25,40,40);
    
    //ellipse 3
    ellipse(pmouseX-10,pmouseY-10,40,40);
  }
  
  else if ((mouseY>100) && (mouseY<200))
  
  {
    noStroke();
    
    //ellipse 1
    int a= int(random(235,255));
    int b= int(random(245,250));
    int c= int(random(250,255));
    int opacity= int(random(10,40));
    
    fill(a,b,c,opacity);
    
    //ellipse 1
    ellipse(pmouseX+25,pmouseY,40,40);
    
    //ellipse 2
    ellipse(pmouseX,pmouseY+25,40,40);
    
    //ellipse 3
    ellipse(pmouseX-10,pmouseY-10,40,40);
  }
  
   else if ((mouseY>250) && (mouseY<500))
  
  {
    noStroke();
   
    
    //ellipse 1
    int a= int(random(10,20));
    int b= int(random(75,85));
    int c= int(random(135,145));
    int opacity= int(random(10,40));
    
    fill(a,b,c,opacity);
    
    //ellipse 1
    ellipse(pmouseX+25,y,5,10);
    
    if (y<250)
    {
    ellipse(pmouseX+25,y,5,10);
    }
    
    if (y>=250)
    {
      speed=-10;
    }
    
    if (y<=500)
    {
      speed=10;
    }
    
    y=y+speed;
   
   
  }
}

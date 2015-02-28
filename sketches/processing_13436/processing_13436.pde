
//runs 30 seconds, you have to hit the flying circles and it will give you a certain amount of points

void setup()
{  
  size (640,450);
  noStroke();
}
float x=-random (50), y=random(450),   //x,y white circle
x1=-random (50), y1=random (450),  //    blue
x2=-random (50), y2=random (450);  //    green
int counterhit=0, end=0;

void draw ()
{ 
  if (end<1600)
  {
  background(0);                           

  if (x<640)          //white circle
  { 
    if (dist(x,y,mouseX,mouseY)<=10)
    {
      counterhit=counterhit+2;
      println(x);
      x=-random (50);
    }
    else 
    {
      fill(255);
      ellipse(x,y,10,10);
      x=x+2;
    }
  }
  else 
  {
    x=0;
    y=random(450);
  }

  if (x1<640)      //blue circle
  { 
    if (dist(x1,y1,mouseX,mouseY)<=10)
    {
      counterhit=counterhit+4;
      println(x1);
      x1=-random (50);
    }
    else 
    {
    fill(0,0,200);
    ellipse(x1,y1,10,10);
    x1=x1+5;
    }
  }
  else 
  {
    x1=-340;
    y1=random(450);
  }

  if (x2<640)      //green circle
  { if (dist(x2,y2,mouseX,mouseY)<=10)
    {
      counterhit=counterhit+3;
      println(x2);
      x2=-random (50);
    }
    else 
    {
    fill(0,255,0);
    ellipse(x2,y2,10,10);
    x2=x2+3;
    }
  }
  else 
  {
    x2=-340;
    y2=random(450);
  }    
  fill(255);
  rect(560,400,80,40);  
  fill(0);
  text("points:",560,410); 
  text (counterhit,560,430);
  end++;
  }
}

                
                                                

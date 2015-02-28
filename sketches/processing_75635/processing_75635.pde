
void setup()
{
  size(215,120);
  background(#2BEAC2);
  colorMode(HSB);
  frameRate(30);
  //println(frameRate());
}

void draw()
{
      
      //println(frameRate(x));
      cube1();
      cube2();
     
    }

void cube1()  //ellipse 
{
    int x=215,y=150;
    fill(#050505);
    float a = mouseX; 
    float b = mouseY;
    if(keyPressed)
    {
      for(int i=0; i<10; i++)
      {
        float radius = random(30);
        float angle = random(TWO_PI);
        float r=radius*sin(angle);
        float s= radius * cos(angle);
        ellipse(random(x),random(y),2,2);
        fill(#168971);
      }

    }
    
}
void cube2() //rectangular
{
    int x=150,y=85;
    int c=43, d=-50;
    fill(#050505);
    float a = mouseX; 
    float b = mouseY;
    if(keyPressed)
    {
      for(int j=5; j<20; j++)
      {
        float radius = random(30);
        float angle = random(TWO_PI);
        float r=radius*sin(angle);
        float s= radius * cos(angle);
        rect(x,y,70,-30);
        fill(#168971);
      }
      for(int k=10;k<30;k++)
      {
        float radius = random(50);
        float angle = random(TWO_PI);
        float r=radius*sin(angle);
        float s= radius * cos(angle);
        rect(d,-c,60,50);
        fill(#168971);
      }
    }
}

//  for (int i=0; i<height; i+=9)
//  {
//    float myHue=map(i,0,height,0,255);
//    for (int j=0; j<width; i+=10)
//    {
//      float mySaturation = map(j,0,width, i, 255);
//      fill(myHue, mySaturation,255);
//      rect(j,i, 14,14);
//    }
//  }








//      if(mousePressed)
//        {
//          for (int i=5; i<20; i++)      
//          {
//          float radius = random(50);
//          float angle = random(TWO_PI);
//          float r=radius*sin(angle);
//          float s= radius * cos(angle);
//          ellipse(mouseX,mouseY,4,4);
//          fill(#168971);
//          }


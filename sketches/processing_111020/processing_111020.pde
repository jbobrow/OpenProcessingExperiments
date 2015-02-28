
PImage back, reject, cloud;
float bwidth=1000;
float bheight=667;
boolean firstTime=true;
void setup()
{
  back=requestImage("fire.jpg");
  reject=requestImage("rejected.jpg");
  cloud=requestImage("cloud.jpg");
  size(1000,667);
  background(0);
}

void draw()
{
  
  imageMode(CENTER);
  if (back.width > 0)
  {
    
    
    if(firstTime)
    {
      back.filter(BLUR,10);
      image(back,bwidth/2,bheight/2);
    float x=250, y=333, prevX=x, prevY=y;
    stroke(255);
      while(x<750)
      {
        x+=5;
        y+=random(-5,5);
        if(x<0)
        {
          x+=25;
        }
        if(y<0)
        {
          y+=25;
        }
        stroke(255,120,120);
        line(prevX,prevY,x,y);
        prevX=x;
        prevY=y;
      }
    }
    //y=pheight/2;
    if(mousePressed)
    {
      
    }
    firstTime=false;
    for(int i=0,i2=0;i<bwidth;i+=85)
    {
      stroke(255);
      line(i,0,i,bheight);
      line(0,i2,bwidth,i2);
      i2+=70;
    }
    image(reject,250,333,reject.width/2,reject.height/2);
    image(cloud,750,333,cloud.width/2,cloud.height/2);
  }
  
}



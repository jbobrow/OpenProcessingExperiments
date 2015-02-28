
void setup()
{
  size(400, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

}

 

void draw()
{
  background(255,255,255);
  image( loadImage("dynamite.jpg"),50,150);
  
  fill(0,0,0);
  textSize(80);
  textAlign(CENTER);
  
  if(frameCount>=50 && frameCount<100)
  {
   text("5",width/2,height/2);
  }
  
  if(frameCount>=100 && frameCount<150)
  {
   text("4",width/2,height/2);
  }
    if(frameCount>=150 && frameCount<200)
  {
   text("3",width/2,height/2);
  }
     if(frameCount>=200 && frameCount<250)
  {
   text("2",width/2,height/2);
  }
     if(frameCount>=250 && frameCount<300)
  {
   text("1",width/2,height/2);
  }
  {
  fill(random(255),0,0);
  if(frameCount>350)
  ellipse(mouseX,mouseY,1000,1000);
 
  }

 

}




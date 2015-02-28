

void setup()
{
  size(600,600);
  //background();
  noFill(); 
  smooth();
  strokeWeight(2);
}

void draw ()
{
  
  background(196,253,255);
  
smooth();
  stroke(27,32,242);
  ellipse(150,250,90,90);

  smooth();
  stroke(0);
  ellipse(220,250,90,90);
 
smooth();
  stroke(248,252,5);
  ellipse(172.5,295,90,90);

smooth();
  stroke(5,252,114);
  ellipse(240,295,90,90);
  
  
  float x=int(random(0,600));
  
  float y=int(random(0,600));
  stroke(255,8,28);
       if((x!=290)&&(y!=250))
       {
         ellipse(x,y,90,90);
       }
       else
       {
         ellipse(290,250,90,90);
         noLoop();
       }
  
}


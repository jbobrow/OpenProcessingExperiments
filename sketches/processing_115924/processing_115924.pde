
int lastSecond;
int secondsElapsed = 0;
int dot = 0;

void setup()
{
  size(300, 1200);
  rectMode(CORNER);
}

void draw()
{
  println(secondsElapsed);
  
  float sWidth= map(secondsElapsed`, 0, 60, 0, 600);
  
  float sandHeight= map(secondsElapsed`, 0, 60, 1200, 0);
  
  //dot = map(secondsElapsed`, 0, 60, 0, 1200);
  
  if (second() != lastSecond)
  {
   secondsElapsed++;
   lastSecond = second();
   
   dot += sandHeight/60;
   
   if(dot > sandHeight)
     dot = 0;
     
  }
  
  background(85);
  fill(0);
  
  noStroke();
  fill(255);
  rect(50,0,200,1200);
  fill(0); 
  rect(50,0,200,sandHeight);
  fill(255);
  rect(145,dot,5,5);
  }

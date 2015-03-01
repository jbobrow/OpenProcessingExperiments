
int count;
void setup(){
  size(700, 700);
 
  //noStroke();
  //background(0,160,230);
  //count=0;
  
  


  
}

 
void draw()
{
  

  stroke(255);
  noFill();
  translate(width/2, height/2);
  background(0,160,230);
  

  

   

  
 //borrowed code
   for(int i = 0; i < 700; i+=3)
  {
    float n = sin(radians(i));
    float x = sin(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*10));
    float y = cos(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*10));
    ellipse(x, y, noise(i)*10 , noise(i)*10);
    //end of borrowed code
    
   
    
  }
 

}

void mousePressed()
{
   
  stroke(255);
  noFill();
  translate(width/2, height/2);
  background(120,0,130);
  
 //borrowed code starts
  for(int i = 0; i < 700; i+=3)
  {
    float n = sin(radians(i));
    float x = sin(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*2));
    float y = cos(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*2));
    ellipse(x, y, noise(i)*40 , noise(i)*40);
  }
  //borrowed code ends
}

void keyPressed()
{
  if (key==CODED)
  {
    if (keyCode=UP)
    {
       //borrowed code starts
  for(int i = 0; i < 700; i+=3)
  {
    float n = sin(radians(i));
    float x = sin(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*12));
    float y = cos(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*2));
    ellipse(x, y, noise(i)*10 , noise(i)*10);
  }
  //borrowed code ends
}

if (keyCode=DOWN)
{ 
  //borrowed code starts
  for(int i = 0; i < 700; i+=3)
  {
    float n = sin(radians(i));
    float x = sin(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*2));
    float y = cos(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*12));
    ellipse(x, y, noise(i)*10 , noise(i)*10);
  }
  //borrowed code ends
  

  }
  if (keyCode=RIGHT)
  {
    background(0);
  }
  if (keyCode=LEFT)
  {
    background(255);
  }
  
  
}
}



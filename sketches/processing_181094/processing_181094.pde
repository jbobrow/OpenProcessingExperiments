
int timer=0;
void setup(){
  size(700, 700);

   
   
 
 
   
}
 
  
void draw()
{
   
 
  stroke(255);
  noFill();
  translate(width/2, height/2);
  if(millis()>timer)
  {
    drawLines(15);
    timer+=1000;
  }
  

 
    
 
   
 //borrowed code
   for(int i = 0; i < 700; i+=2)
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
    
  stroke(random(255),random(255),random(255));
  noFill();
  translate(width/2, height/2);
  background(120,0,130);
  
 
  {
    if (mousePressed==true)
    {
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
}
}
 
void keyPressed()
{
  if(keyPressed==true)
  {
    if (key=='u')
  
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
  }
 
if (key=='d')
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
  if (key=='b')
  {
    background(0);
  }
  if (key=='r')
  {
    background(120,0,0);
  }
  if (key=='g')
  {
    background(0,80,0);
  }
  if (key=='y')
  {
    background(255,204,0);
  }
  if (key=='o')
  
  {
  background(220,50,0);
  }
  if (key=='a')
  {
    background(0,0,140);
  }
  
}

void drawLines(int n)

{
  
  for (int i = 0; i < n; i++)
  {
    stroke(random(255),random(255),random(255));
  strokeWeight(1);
    line(random(width),random(height),350,350);
  }
   for (int i = 5; i < n; i++)
  {
    stroke(random(255),random(255),random(255));
  strokeWeight(1);
    line(random(width),random(height),-350,-350);
  }
}
  


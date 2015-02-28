
//Melanie Danver
//copyright 2012 mdanver
float x, y, valueR, valueG, valueB;
void setup()
{
  size(400,400);
  background(255,255,255);
  valueR = random(255);
  valueG = random(255);
  valueB = random(255);
  
}

void draw()
{
  background(255);
 y = (frameCount)%height;
   x =(frameCount)%width;
     
     if (x <= width){
     y = height -(frameCount)%(height*2);
   x =  width-(frameCount)%(width*2);
 }
    if (x<=0){
       y =frameCount%height;
       x =frameCount%width;
     }
       
 while(x<width || y<height)
  {
  
    stroke(valueR,valueG,valueB);
    x = 1+x;
    y = 1+y;
line(y,x,height,0);
  line(0,width,x,y);
  
  }
    
  
}
void keyPressed()
{
  if (key == ' ')
  { noLoop(); }
  if (key == 'r'){
  loop();}
}

void mousePressed()
{
valueR = random(255);
valueG = random(255);
valueB = random(255);
}


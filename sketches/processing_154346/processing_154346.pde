
//Stefan Joseph scjoseph
//copyright: that means you Zuckerberg

void setup()
{
  size (400, 400);

} 
void draw()
{
  float x= 200;
  
  float y= 200;
  
  float mywidth = 200;
  
  float myheight = 200;
  
  background(100, 100, 100);
    
  fill(255, 100, 0);
  
  arc(x, y, mywidth, myheight, 0, TWO_PI);
  
  fill(255, 255, 0);
  
  ellipseMode(CENTER);
  
  ellipse(x, y, mywidth/2, myheight/2);
  
  fill(150, 50, 200);
  
  rectMode(CENTER);
  
  rect(x, y, (mywidth*40)/x, (myheight*40)/y);
}



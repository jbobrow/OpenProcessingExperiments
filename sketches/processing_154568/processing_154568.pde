
PImage flame = loadImage("http://t3.rbxcdn.com/bc8cee98e00daca5b5d4701f2aaa3fb3");
PImage flame2 = loadImage("http://oi62.tinypic.com/111uqvb.jpg");
//PImage valley = loadImage("http://farm9.staticflickr.com/8496/8386460315_94d41bbb39_c.jpg");
int gravityToll = 1;
int Velocity = 0;
int yCoord = 100;
boolean state = true;
boolean fireSide = true;

void setup()  //setup function called initially, only once
{
size(600,600);
background(255);
strokeWeight(3);
}

void draw()  //draw function loops 
{
  background(255);
  //image(valley,0,40);
  
  line(1,598,600,598);
  
  if (state)
  {
  
  
  Velocity = Velocity + gravityToll;
  yCoord =  yCoord + Velocity;
  
  fill(255);
  ellipse(300,yCoord,60,60);
  point(290, yCoord  - 10);
  point(310, yCoord - 10);
  line(290,yCoord+10,310,yCoord+10);
  
 fill(0);
  textSize(20);
  text("Kill me.",270,yCoord+50);
  
  
  if(yCoord >= 555)
  Velocity = -25;
  }
  
  else
   {
     fill(0);
  textSize(20);
 text("kThnxBye",250,yCoord+150);
 
if(fireSide)
{
 image(flame,85,yCoord-300);
 fireSide = false;
 }
 else
 {
 image(flame2,85,yCoord-300);
 fireSide = true;
 }
  line(1,598,600,598);
  
  }
    fill(0);
  textSize(20);

  
  
  //text("yCoord: " + yCoord +" \nVelocity: " + Velocity,50,50);
  
}



void mouseClicked()
{
    if(state)
    state = false;
    else
    state = true;
    
}



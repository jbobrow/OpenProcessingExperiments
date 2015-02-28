
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int speed;
int ran;
int rand;
int x;
int y;
int xp;
int yp;
int xspeed;
int yspeed;


 
   
void setup()
{
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
}
   
void draw()
{
  ran = int(random(250));
  rand = 100;
  x = mouseX;
  y = mouseY;
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
//    speed();
    xp = xpos.get(i);
    yp = ypos.get(i);
    fill(ran,ran,ran);
    ellipse(x+rand,y+rand,20,20);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    

    //Paw
    fill(250);
    colorChoice();
    ellipse(xp+10,yp+10,60,50);
    ellipse(xp-10,yp+10,60,50);
    ellipse(xp,yp+5,40,60);
    ellipse(xp,yp-50,35,35);
    ellipse(xp+40,yp-35,30,30);
    ellipse(xp-40,yp-35,30,30);
    
    //Black paw
    fill(20);
    ellipse(xp,yp+10,40,40);
    ellipse(xp,yp+19,60,30);
    ellipse(xp,yp-45,20,20);
    ellipse(xp+37,yp-30,15,15);
    ellipse(xp-37,yp-30,15,15);
    
    //Paw 2
    fill(250);
    colorChoice();
    ellipse(xp+10+rand,yp+10+rand,60,50);
    ellipse(xp-10+rand,yp+10+rand,60,50);
    ellipse(xp+rand,yp+5+rand,40,60);
    ellipse(xp+rand,yp-50+rand,35,35);
    ellipse(xp+40+rand,yp-35+rand,30,30);
    ellipse(xp-40+rand,yp-35+rand,30,30);
    
    //Black paw 2
    fill(20);
    ellipse(xp+rand,yp+10+rand,40,40);
    ellipse(xp+rand,yp+19+rand,60,30);
    ellipse(xp+rand,yp-45+rand,20,20);
    ellipse(xp+37+rand,yp-30+rand,15,15);
    ellipse(xp-37+rand,yp-30+rand,15,15);
    
 
    
    
    //Trans
    if (ypos.get(i) < 0 )
    {
      ypos.set(i,width);
    }
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.get(i) < 0 )
    {
      xpos.set(i,width);
    }
  }
  //Restart
  if (ypos.size() == 8)                       
  {
    xpos.clear();
    ypos.clear();
  }
}
  
  
  
  
void mouseClicked()
{
  yspeed = -3;
  xspeed = 1;
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(0);
  yvelocity.add(-3);
  if (xpos.size() % 2 == 0)
    {
      xspeed = xspeed * -1;
      xvelocity.add(-1);
      yvelocity.add(yspeed);
    }
  else
    {
      xspeed = xspeed * -1;
      xvelocity.add(1);
      yvelocity.add(yspeed);
    }
}
 




void colorChoice()
{
  if (keyPressed)
  {
    if (key == 'c')
    {
      fill(random(250),random(250),random(250));
    }
    if (key == 'o')
    {
      fill(250,100,50);
    }
    if (key == 'r')
    {
      fill(250,0,0);
    }
    if (key == 'b')
    {
      fill(0,0,250);
    }
    if (key == 'g')
    {
      fill(0,250,0);
    }
    if (key == 'y')
    {
      fill(200,150,0);
    }
    if (key == 'p')
    {
      fill(200,0,200);
    }
    if (key == 't')
    {
      fill(0,200,200);
    }
    if (key == 'q')
    {
      fill(0,random(200),random(200));
    }
    if (key == 'z')
    {
      fill(random(200),random(200),0);
    }
    if (key == 'x')
    {
      fill(random(200),0,random(200));
    }
  }
}
 
 




//void speed() //Not running Properly
//{
//      if (keyPressed)
//  {
//    if (key == 's')
//    {
//      speed = 0;    
//    }
//  }
//    if (keyPressed)
//  {
//    if (key == 'd')
//    {
//      speed = speed + int(.1);    
//    }
//  }
//    if (keyPressed)
//  {
//    if (key == 'a')
//    {
//      speed = speed - int(.1);
//    }
//  }
//}



int scene;
int x = 0;
int y = 0;
int e = 0;

float y1,y2;
int counter1 = 0;
float mil = millis();
boolean m = false;
PImage a,b,c,d,bck,bck1,bck2,arrow1,downarrow,uparrow,gopher,app,app2,basket,girl,girl2,girl2p5,test,test2,test3;

void setup()
{
  
  
  size(600,600);
  background(255);
  smooth();
  scene = 0;

  
  
  //a = loadImage("mush1.png");
  //b = loadImage("mush2.png");
  //c = loadImage("mush3.png");
  //d = loadImage("mush4.png");
  bck = loadImage("proj2back.png");
  bck1 = loadImage("proj2back1.png");
  bck2 = loadImage("proj2back2.png");
  basket = loadImage("basket.png");
  arrow1 = loadImage("arrow1.png");
  downarrow = loadImage("downarrow.png");
  uparrow = loadImage("uparrow.png");
  gopher = loadImage("gopher.png");
  girl = loadImage("girl.png");
  girl2 = loadImage("girl2.png");
  girl2p5 = loadImage("girl2p5.png");
  app = loadImage("apple.png");
  app2 = loadImage("apple2.png");
  test = loadImage("icon1.png");
  test2 = loadImage("icon2.png");
  test3 = loadImage("icon3.png");
  
  noCursor();
  
}

void draw()
{
  background(255);
  
  image(bck,0,0,600,600);
  image(app,40,40,70,70);
  image(app,180,20,70,70);
  image(app,60,190,70,70);
  image(app,160,150,70,70);
  image(app2,200,430,70,70);
 
  
  x = mouseX;
  y = mouseY;


    if(scene == 0)
  {
   image(girl,400,270,250,250);
   image(arrow1,430,420,70,70);
   
   image(test,x - 15, y - 15,30, 30);
      
    if (mousePressed)
    {
      image(test2,x - 15, y - 15,30, 30);
    }
    
    if (mouseX<520 && mouseX>420 && mouseY>430 && mouseY<480) 
    {
      image(test3,x - 15, y - 34,30, 49);
      if (mousePressed)
      {
        scene++;
      }
    }
   

  }
  else if(scene == 1)
  {

   image(girl2p5,40,300,250,250);
   image(basket,100,480,30,30);
   image(downarrow,220,410,30,30);
   image(uparrow,35,300,60,60);
   
   image(test,x - 15, y - 15,30, 30);
   
    if (mousePressed)
    {
      image(test2,x - 15, y - 15,30, 30);
    }
    
    if (mouseX<90 && mouseX>50 && mouseY>310 && mouseY<370) 
    {
      image(test3,x - 15, y - 34,30, 49);
      if (mousePressed)
      {
        scene++;
      }
    }
        if (mouseX<260 && mouseX>220 && mouseY>430 && mouseY<490) 
    {
      image(test3,x - 15, y - 34,30, 49);
      if (mousePressed)
      {
        scene += 50;
      }
    }

  }
  else if(scene == 2)
  {
   image(girl2,-85,160,250,250);
   image(downarrow,60,25,30,30);
   image(downarrow,80,175,30,30);
   image(downarrow,180,135,30,30);
   
    image(test,x - 15, y - 15,30, 30);
      
    if (mousePressed)
    {
      image(test2,x - 15, y - 15,30, 30);
    }
    if (mouseX<100 && mouseX>70 && mouseY>30 && mouseY<100) 
    {
      image(test3,x - 15, y - 34,30, 49);
      if (mousePressed)
      {
        scene += 50;
      }
    }
        if (mouseX<120 && mouseX>90 && mouseY>180 && mouseY<250) 
    {
      image(test3,x - 15, y - 34,30, 49);
      if (mousePressed)
      {
        scene += 50;
      }
    }
        if (mouseX<220 && mouseX>190 && mouseY>140 && mouseY<210) 
    {
      image(test3,x - 15, y - 34,30, 49);
      if (mousePressed)
      {
        scene += 50;
      }
    }

  }

    else if(scene == 3)
  {

    image(girl,70,80,500,500);
  }
    else if(scene == 51)
  {
 
      
  
    
   image(bck2,-60,-250,900,900);
   image(bck1,-60,-250,900,900);
   image(basket,100,480,60,60);
   image(app2,340,410,120,120);
   
   for (int i = 0; i<3; i++)
   {
     y1 = second()+i;
   image(girl,30,150,500,500);
   }

   

   
   // count(100);
  }
  else
  {
    scene = 0;
  }
  

  
}


//void count(int range)
//{
//   if(counter1 == 0)
//   {
//     e++;
//     if(e >range+1)
//      counter1 = 1;
//   }
//   else
//   {
//     e--;
//     if(e <-1)
//       counter1 = 0;
//   }
//}
 



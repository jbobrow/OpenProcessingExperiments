
Rain s1,s2,s3,s4;
int x = 0;
int z = 0;
int w = 0;
float a = .5;
ArrayList<Rain> rainfall = new ArrayList<Rain>();
PImage Aminus;
PImage Wminus;
PImage Aplus;
PImage Wplus;

void setup()
{
  background(0);
  size(500,500);
  Aminus=loadImage("minus.png");
  Wminus=loadImage("minus.png");
  Aplus=loadImage("plut.png");
  Wplus=loadImage("plut.png");
  //This makes more raindrops. The amount of rain(a) starts halfway through so rain can increase or decrease.
  for (int i = 0; i < 10; i++)
  {
    rainfall.add(new Rain()); 
    rainfall.add(new Rain());
    rainfall.add(new Rain());
    rainfall.add(new Rain());
  }
}

void draw()
{
  background(0);
  control();
  if (random(1) < a)
  {
    rainfall.add(new Rain());
    rainfall.add(new Rain());
  }
  for (int i = 10; i < rainfall.size(); i++)
    {
      Rain r = rainfall.get(i);
      r.drawRain();
      if (z>0)//this makes the rain dissapear at the grey box. z is at the bottom of the code.
      {
        rainfall.remove(i);
        z=0;   
      }
    }
  } 

//Drawing control panel/UI(this is just drawing it, nothing complicated)
void control()
{
  fill(87);
  rect(0,425,500,75);
  fill(#4E89FA);
  rect(25,436,50,50);
  rect(175,436,50,50);
  rect(255,436,50,50);
  rect(425,436,50,50);
  textSize(16);
  text("Amount", 95,450); 
  text("of rain", 98,475);
  text("Wind strength", 310,450); 
  textSize(12);
  text("(- goes to left)", 320,465);
  text("(+ goes to right)", 315,480); 
  image(Aminus, 33,442,35,40);
  image(Wminus, 263,442,35,40);
  image(Aplus, 180.5,441,40,40);
  image(Wplus, 430.5,441,40,40); 
}

//This controls the buttons at the bottom.
void mousePressed()
  {  
    //Amount minus button
    if ((mouseX<75 && mouseX>25)&&(mouseY<490 && mouseY>430))//this is the range of the button, so when you click it registers
    {
      a=a-.1;
    }
    //Amount plus button
    if ((mouseX<225 && mouseX>175)&&(mouseY<490 && mouseY>430))
    {
      a=a+.1;
    }
    //Wind minus button
    if ((mouseX<300 && mouseX>250)&&(mouseY<490 && mouseY>430))
    {
      w=w-1;
    }
    //Wind plus button
    if ((mouseX<475 && mouseX>425)&&(mouseY<490 && mouseY>430))
    {
      w=w+1;
    }
  }
 
class Rain
 {
   float xpos;
   int ypos;
   float xvel;
   float yvel;
   float size;
   float wind;
   
   Rain()
   {
     xpos = random(width);
     ypos = 0;
     yvel = 0.05;
     xvel= 0;
     size = random(5,10);
     wind = 0;
   }
   
void rainfall(float x,float s)
  {
  xpos=x;
  ypos=0;
  yvel=.05;
  size=s;
  xvel=0;
  }

void drawRain()
  {
   noStroke();
   if (ypos> 425)
   {
    z=1;//makes rain dissapear as it reaches box
   }
   else
   {
   fill(31,153,216,160);
   ellipse(xpos,ypos,size,size);
   if(w != 0)//Adding wind and x movement
   {
     ypos = int( ypos + yvel );
     xpos = int(xpos+xvel);
     yvel = yvel +.1;
     xvel= xvel + w*.01;
   }
   else//(If there's no wind, there's no x movement)
   {
     ypos = int( ypos + yvel );
     yvel = yvel +.1;
   }
   }
  }
 }

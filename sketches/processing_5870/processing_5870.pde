
float pwr;
int hairscroll;
float scroll;
int stache;
PShape rob1,rob2,rob3,rob4,rob5,rob6,rob7,rob8;
PImage spacebg,hair;



void setup()
{
size(320,480);
smooth();
rob1= loadShape("rob1.svg");
rob2= loadShape("rob2.svg");
rob3= loadShape("rob3.svg");
rob4= loadShape("rob4.svg");
rob5= loadShape("rob5.svg");
rob6= loadShape("rob6.svg");
rob7= loadShape("rob7.svg");
rob8= loadShape("rob8.svg");
spacebg= loadImage("spacebg.jpg");
hair= loadImage("hair.jpg");
}

void draw()
{

 
   float vel=speed(mouseY);

  image(spacebg,vel-5,scroll-5000+vel);
  
   hair(mouseY);
 window(mouseY,mouseX);
  power(mouseY);
  
  scroll+=mouseY/38;
  if(scroll>=5500)
  {scroll=0;}
  
  

}


void power(int x)
{
 
  smooth();
  
  int pwrLvl=mouseY/(height/9);
  
  shapeMode(CENTER);
 
  if(pwrLvl>=7)
  {

    shape(rob8,150,250);

  }
else
  if(pwrLvl==0)
  {
  shape(rob1,150,250);
  }
  else
  if(pwrLvl==1)
  {
  shape(rob2,150,250);
  }
   else
  if(pwrLvl==2)
  {
  shape(rob3,150,250);
  }
   else
  if(pwrLvl==3)
  {
  shape(rob4,150,250);
  }
   else
  if(pwrLvl==4)
  {
  shape(rob5,150,250);
  }
   else
  if(pwrLvl==5)
  {
  shape(rob6,150,250);
  }
   else
  if(pwrLvl>=6)
  {
    shape(rob7,150,250);
  }

 
  


}

float speed(float x)
{
  float spd= random(-x/30,x/30);
  if(x>=370)
  {
    spd=0;
  }
  return spd;
  
}
  
  void hair(float x)
  {
    
    if(x>=370)
    {
    image(hair,0,-1800+hairscroll);
    hairscroll+=2;
    }
  }
 
 void window(float y,float x)
 {
   
    if(y>=370)
   {
     x=0;
   }
   
   
   float trans=x*.8;
   noStroke();
   fill(255,trans);
   rect(112,215,80,80);
   println(trans);
  
 }
 


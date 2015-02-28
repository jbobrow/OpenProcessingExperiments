
class Fruit
{
 
  float spX;
  float spY;
  int taillex;
  int tailley;
  float speedx;
  boolean existe;
  boolean sens;
 
 
  Fruit()
  {
    spX=width/3;
    spY=100;
 
    existe=false;
 
    speedx = 4;
 
    taillex = 5;
    tailley = 5;
  }
 
 

  void display()
  {
    if(existe==true)
    {
      
    imageMode(CENTER);
    image(apple, spX,spY); 
 
    }
  }

  void lancement(float k)
  {
    if( k < 1 )
    {
      
      spX=-7*taillex;
      sens = true;
    }
    else
    {
      spX=width+7*taillex;
      sens=false;
    }
    speedx=random(0.8,2);
    existe=true;
  }
  
  
  void move()
  {
    if(spX +9*taillex > 0 && spX - 8*taillex < width)
    {
      if( sens == true ) 
      {
         spX = spX + speedx;
      }
      else
      {
        
        spX = spX -speedx;
      }
    }
    else
    {
      existe=false;
    }
  }

  boolean contact(float x_, float y_)
  {
    if(existe==true)
    {
      if(x_ < spX +8*taillex && x_ > spX - 8*taillex && y_> -3*tailley+spY && y_ < 3*tailley+spY)
      {
        existe=false;

      } 
      return existe;
    }
    else
    {
      return true;
    }
  }
}




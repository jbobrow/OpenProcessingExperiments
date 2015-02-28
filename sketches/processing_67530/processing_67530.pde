
class ball
{
  float a, b;
  int speed, speed2;
 
 
  void show()
  {
    
    imageMode (CENTER); 
    image(jelly,a,b, 80,100);
    
    
    if (b > height)              //if jellyfish reaches bottom
    {
//      b = (int)random(-10);    //loses life
      life = life - 1;
      if( life == 0)
      {
        life = life;
        screenNum = 4; //THE END!!!
      }
            a = random(50, width-50);

    }
    b += speed;
     
//    if (screenNum == 1)
//    {
//      b = -100;
//    }
    
//    if (screenNum == 4)
//    {
//      b = -100;
//      a = -200;
//    }
  }
   
//  void nothing()
//  {
//    b = random(-250,-50);
//      a = -200;
//  }

   // SCORE
 void checkCollisionJelly()
  { 
    if(dist(x,y,a,b)<(50))
    {
      b = -100;
      a = random(50, 350);
      score = score +1;
    }
    
  }
   
  void charInside()
  {
    if( x > width-5 ) x = width;
    if( y > height ) y = height;
    if( x < 2 ) x = 2;
    if( y < 2 ) y = 2;
  }
} // end of class


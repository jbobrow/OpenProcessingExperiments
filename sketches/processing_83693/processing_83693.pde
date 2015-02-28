
PImage spongebob;   
int t=0;
int randomNumber=0;
int shapesDrawn = 0;
int count=0;
int x = 524;
int y = 519;

void setup()
{
  size(524,519);
  frameRate(1);
  spongebob = loadImage ("spongebob.png");
  randomNumber = int(random(15,30));
}

void draw()
{
  background (spongebob);
  if ( shapesDrawn <= 150)
  {
    print("Random number is: ");
    print(randomNumber);
    println();
    while(count < randomNumber)
    {
      if(randomNumber%6==0 && randomNumber%4==0)
      {
        fill(183,46,198);
      }
      else if (randomNumber%6==0)
      {
        fill(227,23,23);
      }
      else if (randomNumber%4==0)
      {
        fill(46,67,198);
      }

      
      if((randomNumber%3 == 0 && randomNumber%5 == 0) 
          || (randomNumber%3 == 0 && randomNumber%2 == 0) 
          || (randomNumber%2 == 0 && randomNumber%5 == 0)
        )
      {
         int c=int(random (40,65));
         int c2=int(random (40,65));
         while(c2 == c)
         {
           c2=int(random (40,65));
         }
         ellipse (int(random(x)),(random(y)),c,c2);
      }
      else if (randomNumber%3==0)
      {
         int c=int(random (40,65));
         ellipse (int(random(x)),(random(y)),c,c);
      }
      else if (randomNumber%5==0)
      {
         int c=int(random (40,65));
         rect (int(random(x)),(random(y)),c,c);
      }
      else if (randomNumber%2==0)
      {
         int c=int(random (40,65));
         int c2=int(random (40,65));
         while(c2 == c)
         {
           c2=int(random (40,65));
         }
         rect (int(random(x)),(random(y)),c,c2);
      }
      
      count = count + 1;
      shapesDrawn = shapesDrawn + 1;
    }
    randomNumber = randomNumber*2;   
  }
  else
  {
     print("--- 150 shapes or over have been drawn ---");
     println();
     shapesDrawn = 0;
     count = 0;
     randomNumber = int(random(15,30));
  }
}
  
  
        
   
      





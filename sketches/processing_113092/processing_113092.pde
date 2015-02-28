
/* @pjs preload="Car.jpg";*/

PImage car;
float timer;
float T; // Timer Variable
float X;
float Y;
float A; // Greyscale image alpha variable
float A2; // Color image alpha variable
float A3;
float B; // Y position of scaled greyscale image
float deg;
void setup()
{
  T = 0;  
  X = 0;
  Y = 0;  
  A = 30; 
  A2 = 0;
  A3 = 0;
  B = 1200; 
  car= loadImage("Car.jpg");
  size(1440,810);
}

void draw()
{
  
  T = T + 1; // Starts the animation timing control
  colorMode(HSB);
  
  if (T <= 70) 
    {
      Static();  
    }
  if (T >= 35) // starts first phase, fading in black and white photo
    {
      pushMatrix();
      scale(2.0);
      imageMode(CENTER);
      tint(255,A);
      image(car,width/4,height/4);
      filter(GRAY);
      popMatrix();
      if(A < 255)
          {
            A = A + 10;
          }
    }
    if(T >=80 && T <= 86)
          {         
            glitchScreen();
            filter(GRAY);
          }
    if(T >= 120)
     {
       pushMatrix();
       scale(2.0);
       tint(255,A2);
       image(car,width/4,height/4);
       popMatrix();
       if (A2 < 255)
        {
          A2 = A2 + 20;
        }
     }
    if(T >= 142 && T <= 143)
      {
        Static();
      } 
    if(T >=144 && T <= 154)
      {
        glitchScreen();
      }
    if(T == 184 || T == 186 || T == 188 || T == 189 || T >= 190 && T <= 192)
      {
       filter(INVERT);
      }
    if (T >= 212)
    {
      filter(POSTERIZE,5);
    }
    if (T >= 222 && T <=223)
    {
      Static();
    }
    if (T >= 224)
    {
      glitchScreen2();
    }
  println(T);
  println(A);
}



void glitchScreen2()
 {
    scale(2.0,.5);
    imageMode(CENTER);
    image(car,width/4,height*1.5);
    filter(GRAY);
    image(car,width/4,height*2);
   
    image(car,width/4,height);
    filter(INVERT);
    image(car,width/4,height/2);
    filter(POSTERIZE,5);
    image(car,width/4,height/4);
 
  }
void glitchScreen() // Creates greyscale glitch screen
  {
    scale(2.0,.5);
    imageMode(CENTER);
    image(car,width/4,height*1.5);
    image(car,width/4,height*2);
    image(car,width/4,height);
    image(car,width/4,height/2);
    image(car,width/4,height/4);
  }
  
void Static() // Creates TV style static effect
{
  background(0,99,0);
  for (Y = -50; Y <= 810; Y += random(15)+random(10))
        {
          strokeWeight(random(1.5));
          stroke(255);
          line(0,Y,1440,Y + 50);
        }
        for(Y = 0; Y < 810; Y += random(7))
          { frameRate(120);
            for(X = 0; X < 1440; X += random(7))
              {
                noStroke();
                fill(random(150,255));
                rect(X,Y,random(4),random(3));
              }
          }
}



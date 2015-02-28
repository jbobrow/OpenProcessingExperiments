
// made by julie baldassano 2013



float x, y, b, R, G, B, zzz, xsun, ysun, wdmom, htmom, wdpup1, htpup1, easingCoefficient, momX, mommY;
float pmomX, pmommY, time;
float catX, catY, wdcat, htcat, catxspeed, catyspeed, q, spin, crayx, crayy, xrando, yrando;
PImage mom, pup1, pup2, pup3, momPup, rainbow, realSun, cat;
Dog pound[] = new Dog[100];
int i, numberOfDogs;
boolean gameStart = false;
int numFollowingMommy = 0;

void setup ()
{
  size (800,480);
  xrando = 615;
  yrando = height/2;
  easingCoefficient = 0.05;
  numberOfDogs = 0;
  smooth();
  imageMode( CENTER );
  wdmom = 100;
  htmom = 125;
  xsun = 400;
  ysun = 50;
  spin = .2;
  catX = -1800;
  catY = height/2;
  wdcat =70;
  htcat =70;
  catxspeed =10;
  catyspeed = 3;
  b = 255;
  q = 10;
  momX = width/2;
  mommY = height+5;
  pmomX = momX;
  pmommY = mommY;
  mom = loadImage ("head.png");
  realSun = loadImage ("sun.png");
  rainbow = loadImage ("rainbow.png");
  cat = loadImage ("cat.png");
  frameRate = 20;
  
}

void draw ()
{  
  if (mousePressed)
    gameStart = true;
    
  if (gameStart != true)
  {
      
      background (R%255,G%255,B%255);
      R = frameCount + 10;
      G = frameCount + 150;
      B = frameCount + 100;
      rotate (spin);
      image( mom, momX, mommY, wdmom, htmom );
      image( rainbow, 420, 55, 380, 30 );
      image (mom, xrando+ frameCount%90, yrando, 20, 30);
      image (mom, xrando-frameCount%90, yrando, 20, 30);
      image (mom, xrando, yrando+frameCount%90, 20, 30);
      image (mom, xrando, yrando-frameCount%90, 20, 30);
      
      image (mom, xrando, yrando, 20, 30);
      fill(0,0,255);
      textSize(40);
      text("Welcome to Chihuahua Chase!", 120, 35);
      fill(100, 0, 100);
      textSize(20);
      text("Spawn your puppies with the", 100, 100);
      text("mouse pointer, then reunite", 100, 150);
      text("them using the UP DOWN RIGHT and", 55, 200);
      text("LEFT arrow keys before they scatter!", 70, 250);
      text("(and avoid the cat at all costs)", 105, 300);
      text("Gather all puppies to WIN!!", 125, 350);
      text("Click to start...", 190, 400);
  }
  else
  {
      background (0,0,b,20);
      b --;
      image( realSun, xsun, ysun, 175, 175);
      time = millis()/1000;
      text (time + " seconds wasted!", 480, 400);
      if (time >20 && time < 26)
      {
      fill(255,0,0);
      textSize(70);
      text("don't stop now!", 100, height/2);
      }
      if (time >45 && time < 49)
      {
      fill(255,0,0);
      textSize(70);
      text("why does this exist?", 100, height/2);
      }
      if (time >60 && time < 63)
      {
      fill(255,0,0);
      textSize(70);
      text("A full minute!? WHY", 100, height/2);
      }
      if (time >30 && time < 36)
      {
      fill(255,0,0);
      textSize(q);
      q ++;
      text("Meeeeooooow", 100, height/2);
      }
      if (time >100 && time < 106)
      {
      fill(255,0,0);
      textSize(q);
      q ++;
      text("Wooooooof", 100, height/2);
      }
      if (time >120 && time < 126)
      {
      fill(255,0,0);
      textSize(q);
      q ++;
      text("Cray", 100, height/2);
      }
      if (time >1000)
      {
      fill(255,0,0);
      textSize(q);
      q += 2;
      text("PGSS", 100, height/2);
      }
      ysun += 3;
      
      image (cat, catX, catY, wdcat, htcat);
      catX = catX + catxspeed;
      catY = catY + catyspeed;
    
    if (catX > width)
    {
      catxspeed = random (-2,-8);
      catyspeed = random (-5, 5);
    }
     if (catX < 2)
     {
      catxspeed = random (2, 8);
      catyspeed = random (-5, 5);
     }
     if (catY < 2)
     {
      catxspeed = random (-5,5);
      catyspeed = random (2, 8);
     }
     if (catY > height - 2)
     {
      catyspeed = random (-2, -8);
      catxspeed = random (-5,5);
     }
 
       image( mom, momX, mommY, wdmom, htmom );

      for ( i = 0; i < numberOfDogs; i++)
      {
         if ( pound[i] != null && i==5) println(pound[5].x+"   " + pound[5].y);
        if(pound[i] != null)// && pound[i].y < height)
        {
          pound[i].displayMuhDog();
          if(!pound[i].isFollowingMom && dist(pound[i].x,pound[i].y,momX,mommY) < 50 && numberOfDogs == 100)
          {
            pound[i].isFollowingMom = true;
            pound[i].nthFollowingMom = numFollowingMommy;
            numFollowingMommy ++;
          }          
            //pound[i].xoff = 3;
            //pound[i].yoff = 
           pound[i].move();
        }
         else if (pound[i] != null && !(pound[i].isFollowingMom))
        {
         //pound[i] = null; 
        }
      }
      fill(255,255,255);
      textSize(30);
      text (numFollowingMommy + " puppies saved!", 530, 450);
      if (numFollowingMommy == 100)
      {
        catxspeed = 0;
        catyspeed = 0;
        background (frameCount%255,frameCount%250,frameCount%200);
        textSize(20);
        text ("YOU ARE VICTORIOUS!!", width/2 - 300, height/2 + 200);
        fill (frameCount%55,frameCount%2,frameCount%6);
        text ("YOU ARE VICTORIOUS!!", width/2 +25, height/2 - 200);
        fill (frameCount%55 +55,frameCount%2 - 53,frameCount%6 -60);
        text ("YOU ARE VICTORIOUS!!", width/2 - 800, height/2 + 600);
        fill (frameCount%55 - 23,frameCount%2,frameCount%6 + 60);
        text ("YOU ARE VICTORIOUS!!", width/2, height/2 - 520);
        fill (frameCount%55,frameCount%2 - 25,frameCount%6);
        text ("YOU ARE VICTORIOUS!!", width/2 - 1000, height/2);
        image( realSun, crayx + 200, crayy, 200, 200);
        image( mom, crayx, crayy+ 200, 200, 200);
        image( cat, crayx + 100, crayy- 200, 200, 200);
        crayx = random (0, width);
        crayy = random (0, height);
        rotate(spin);
        spin += .1;
        textSize (75);
        text ("YOU ARE VICTORIOUS!!", width/2 - 300, height/2);
      }
      
      
      if( numberOfDogs < 100)
      {
        pound[numberOfDogs] = new Dog(mouseX, mouseY,mouseX-pmouseX+random(-2,2),mouseY-pmouseY+random(-2,2), loadImage("head.png")); 
        numberOfDogs ++; 
      }
      float dx = mouseX - x;
      float dy = mouseY - y;
      x = x + ( dx * easingCoefficient );
      y = y + ( dy * easingCoefficient );
      if (keyPressed)
      {
         pmomX = momX;
         pmommY = mommY;
         if (keyCode == UP)
           mommY -=9;
         if (keyCode == RIGHT)
           momX += 9;
         if(keyCode == LEFT)
           momX -= 9;
         if (keyCode == DOWN)
           mommY += 9;
        
      }
      
      if(dist(catX,catY,momX,mommY) < 100)
      {
        for( i = 0; i < numberOfDogs; i++)
        {
          if(pound[i].isFollowingMom)
          {
           pound[i].xspeed = random(-5,5); 
           pound[i].yspeed = random(-5,5);
           pound[i].isFollowingMom = false;
          }
        }
        numFollowingMommy = 0;
      }
      
   }
}

class Dog
{
 float x, y, xspeed, yspeed, xoff, yoff, dist; 
 PImage muhdog;
 boolean isFollowingMom;
 int nthFollowingMom;
 
 void move()
 {
  if(!isFollowingMom)
  {
    x = x + xspeed;
    y = y + yspeed;
    
    if (x > width)
     x = 0;
    if (x < 0)
      x = width;
     if (y < 10)
      yspeed += 9.8;
     if (y > height - 8)
      yspeed = random (-2, -15);
      

  } 
  else
  {
    if (momX - pmomX > 0)
    {
     xspeed = momX - x - 10*nthFollowingMom-5;
     yspeed = mommY -y;
    }
    else if(momX - pmomX < 0)
    {
      xspeed = momX - x + 5*nthFollowingMom +5;
      yspeed = mommY -y;
    }
    else if(mommY - pmommY > 0)
    {
      yspeed = mommY - y -10*nthFollowingMom-5;
      xspeed = momX -x;
    }
    else
    {
      yspeed = mommY - y + 5*nthFollowingMom+5;
      xspeed = momX -x;
    }

    x = x + xspeed*easingCoefficient;
    y = y + yspeed*easingCoefficient;
  }  
 }
 
 void displayMuhDog()
 {
   image( muhdog, x, y, 25, 35 );
 }
 
 Dog(float xin, float yin, float xspeedin, float yspeedin,
     PImage imgofmuhdog)
 {
  x = xin;
  y = yin;
  xspeed = xspeedin + random (-7, 7);
  yspeed = yspeedin + random(-7, 7);
  muhdog = imgofmuhdog;
  isFollowingMom = false;
 }
}



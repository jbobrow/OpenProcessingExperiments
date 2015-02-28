
int game = 0;
int intro = 0;
int play = 1;
int win  = 2;
int lose = 3;
int fear = 10;
int clickHere = 0;
PFont bahaus;
//=============================================================================================================================

//bowl
float timer = 30;
float bowlTimer = 0;
float bowlSize = 100;
float bx;
float by;
int bs = 50;
int clickcount = 30;


float bdifx = 0.0; 
float bdify = 0.0; 

PImage bowl;

boolean bover = false;
boolean locked = false;


//==============================================================================================================================
//splash
PImage fence;
PImage start;
PImage win1;
PImage lose1;

//=============================================================================================================================
class Cat
{
  PImage cat;
  PImage fear;
  PImage happy;

  float x = 250;
  float y = 300; 
  float speed = 5;
 
  float easing = -.5;
  float coolDown = 0;
  float happyTime = 0; 
  
 Cat()
 {
   cat = requestImage("pusheen.png");
   fear = requestImage("fear.png");
   happy = requestImage("happy.png");
 }
 
 void draw()
 {
   this.x += this.speed;
   if ( this.x > width - (this.cat.width/3) || this.x < (this.cat.width/3))
   {
     this.speed = -this.speed;
   }
   if (this.cat.width > 0)
   {
     pushMatrix();
     translate(this.x, this.y);
     if (this.speed > 0)
     {
       scale( -1,1);
     }
     imageMode(CENTER);
     if (coolDown > 0 )
     {
       image(this.fear, 0,0);
     }
     else if (happyTime > 0)
     {
       image (this.happy, 0,0);
     }
     else
     {
       image(this.cat, 0,0);
     }
     
     imageMode(CORNER);
     popMatrix();
   }
   coolDown = coolDown - (1/30.0);
   happyTime = happyTime - (1/30.0);
 
      if (dist (  bx,  by, this.x,this.y) < 160 && happyTime <= 0)
    {
      
      happyTime += 2;
      coolDown = coolDown - 5;
    
    }
     else if (dist ( mouseX, mouseY, this.x, this.y) < 150 && coolDown <= 0)
   {
     coolDown = 2;
     
     happyTime = happyTime - 5;
     
     if (mouseX - this.x < 0 && this.speed < 0)
     {
       this.speed = - this.speed;
     }
     if (mouseX - this.x > 0 && this.speed > 0)
     {
       this.speed = - this.speed;
     }   
    }
   
   
 }
 boolean rectRectIntersect(float left, float top, float right, float bottom,
 float otherLeft, float otherTop, float otherRight, float otherBottom) {
 return !(left > otherRight || right < otherLeft || top > otherBottom || bottom < otherTop); }
}

Cat kitty = new Cat();
//=================================================================================================================================


//______________________________________________________



void setup()
{
  
  size ( 1200,500);
  bx = 900;
  by = 440;
  
 frameRate(30);
  
  bahaus = createFont("Bauhaus 93", 32);
  
 
    start = requestImage("PuStart.png");
   win1  = requestImage("PuWin.png");
  lose1  = requestImage("PuLose.jpg");
  imageMode(CENTER);  
  bowl = requestImage("bowl.png");

  fence = requestImage("fence.jpg");
  

}




void draw()
{
 textFont(bahaus);
  
  if (game == intro)
  {
    
    image(start, 600 ,250,width,height);
    fill(247,241,227);
    textAlign(LEFT);
    textSize(60);
    text("FEED PUSHEEN", 50, 75);
    textSize(30);
    text("click here to start", 900, 450);
    
    if (mousePressed == true)
    {
      clickHere += 1;
    }
    if (clickHere == 1)
    
    {
      game = play;
      
    }
  }
  
  else if (game == play)
  {
      timer = timer - (1.0/30.0);
      bowlTimer = bowlTimer + (1.0/30.0);
      
      if (bowlTimer > 2.5)
      {
        bowlTimer = 0;
        bx = random((width - kitty.x) - bowlSize );
        by = random(0, (height - kitty.y) - bowlSize);
      }
      
      if (bowl.width > 0)
      {
        image(bowl, bx, by, bowlSize, bowlSize);
      }
      
      
        
      
      cursor(HAND);
      image(fence,0,0,width,height);
      kitty.draw();
     
     
     
      if (mouseX > bx-bs && mouseX < bx+bs && 
    
          mouseY > by-bs && mouseY < by+bs) {
    
        bover = true;  
    
        if(!locked) { 
    
         
    
        } 
    
      } else {
        
         noTint();
    
        bover = false;
    
      }
      image(bowl,bx, by, bs, bs);
      
      
      if (mouseX >bx -bs && mouseX < bx+bs && mouseY > by - bs && mouseY < by + bs)
      {
          bover = true;  
    
        if(!locked) { 
    
         
    
        } 
    
      } else {
        
         noTint();
    
        bover = false;
    
      }

      
      fill(0);
      text("FEAR" + (int)kitty.coolDown, 55,25);
      text("Happy" +(int)kitty.happyTime, 1050,25);
      
      if (kitty.coolDown <= - 80)
      {
        game = win;
      }
      else if (kitty.happyTime < -50)
      {
        game = lose;
      }
  }

    if (game == lose)
    {
      image(lose1,0,0,width,height);
      textAlign(CENTER);
      
     
      textAlign(CENTER);
      textSize (30);
      fill(137,98,69);
      text("Play again? Refresh the Page!", 600, 490);
      
      if (mousePressed == true)
        {
          clickHere += 1;
        }
       if (clickHere == 1)
       {
         game = play;
       }
       
    
    }
    if (game == win)
    {
      image(win1, 0,0,width,height);
      textAlign(CENTER);
      fill(255);
      textSize( 90);
      text("you win", 160, 480);
      textSize(20);
      text("Play Again? Refresh the page!",1050,490);
    }
    
    
}




void mousePressed() 
{

  if(bover) { 

    locked = true; 

 

  } else {

    locked = false;

  }

  bdifx = mouseX-bx; 

  bdify = mouseY-by; 






}



void mouseDragged() {

  if(locked) {

    bx = mouseX-bdifx; 

    by = mouseY-bdify; }
    
    if (locked)
    {
    


    }

  }





void mouseReleased()
{
  locked = false;
  if ( clickcount > 0)
  {
    if ( mouseX > bx 
    && mouseY > by
    && mouseX < (bx + bowlSize)
    && mouseY < (by + bowlSize))
    {
      clickcount = clickcount -1;
      bowlSize = bowlSize * 0.95;
    }
  }
}




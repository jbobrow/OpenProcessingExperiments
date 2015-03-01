
PImage twinsy1, twinsy2, twinsy3, twinsy4, sign, freedom, pball, cursorkid;
PFont chills;
float counting=1;
float creepy=1;
float timer = 10;
float exittimer = 0;
float exitx = 0;
float exity = 0;
float exitsize = 100;
float ballx = 0;
float bally = 0;
float ballsize = 100;
   
int gamestat = 0;
int playstat = 0;
int winstat = 1;
int losestat = 2;
int clicker = 10;

   
void setup(){
  size(600,400);
  chills=createFont("Chiller",46);
  twinsy1=requestImage("twins1.png");
  twinsy2=requestImage("twins2.png");
  twinsy3=requestImage("twins3.png");
  twinsy4=requestImage("twins4.png");
  cursorkid=requestImage("danny.png");
  freedom=requestImage("freedom.jpg");
  sign=requestImage("exit.png");
  pball=requestImage("ball.png");
  noCursor();
  
}
   
void draw(){
  counting++;  
  creepy++;
 //frees=requestImage(freedom);
  imageMode(CENTER);
  image(twinsy1, 300,200,width,height);
  if (gamestat == playstat){
  counting++;  
  creepy++;
 //frees=requestImage(freedom);
  imageMode(CENTER);
  image(twinsy1, 300,200,width,height);
  
      if (counting>=300){
    image(twinsy2,300,200,width,height);
    /*if(mouseX >=155 && mouseX <= 205 && mouseY >=100 && mouseY <=200){
      image(sign,180,150,95,95);
    } */ 
    }
    if (counting>=600){
    image(twinsy3,300,200,width,height);
    /*if(mouseX >=500 && mouseX <= 590 && mouseY >= 25 && mouseY <= 50){
      image(sign,567,37,100,100);
    }*/
    }
    
    if (creepy>=310){
     noStroke();
     textSize(36);
     fill(#5F1313);
     text("Come play with us Danny~",100,200);
   }
   if(creepy>=600){
     noStroke();
     textSize(36);
     fill(#5F1313);
     text("forever and ever~",150,250);
   }
    if (counting>=750){
     filter(INVERT,twinsy4,300,200,width,height);
     
  
    }
//  image(forest, 0, 0, width, height);
  timer = timer - (.75 / 40.0);
  exittimer = exittimer + (1.0 / 30.0);     
    if (exittimer < .50)
    {
      if (exitx < width - exitsize)
      {
      exitx = exitx + (5 * exittimer);
      }
        if (exity > 0)
        {
        exity = exity - 2;
        }
          if (ballx < width - ballsize)
          {
          ballx = ballx + (5 * exittimer);
          }
            if (bally > 0)
            {
            bally = bally - 3.0;
             }
    }
    else
    {
      if (exitx > 0)
      {
      exitx = exitx - 2;
      }
        if (exity < height - exitsize)
        {
        exity = exity + (3 * exittimer);
        }
          if (ballx > 0)
          {
          ballx = ballx - 2;
          }
            if (bally < height - ballsize)
             {
             bally = bally + (3 * exittimer);
             }
    }
    if (exittimer > 1.5)
    {
     exittimer = 0;
     exitx = random(width - exitsize);
     exity = random(0, height - exitsize);
     ballx = random(width - ballsize);
     bally = random(0, height - ballsize);
     }   
      if (sign.width > 0)
      {
      image(sign, exitx, exity, exitsize, exitsize);
      }
        if (pball.width > 0)
        {
        image(pball, ballx, bally, ballsize, ballsize);
        }
    //    text("TIME: " + (int)timer, 300, 300);
       text("POINTS: " + clicker, 200, 400);
     
          if (timer < 0)
          {
            if (clicker <= 0)
            {
            gamestat = winstat;
            }
          else
          {
          gamestat = losestat;
          }
          }
   }
    if (gamestat == losestat){
       fill(0);
       rect(0,0,width,height);
       textFont(chills,50);
 //textSize(43);
       fill(#8E0D0D);
       text(" GAME OVER ", 175,200);
     }
      if (gamestat == winstat)
      {
      image(freedom, 300, 200, width, height);
      }
      image(cursorkid,mouseX, mouseY);
}
   
void mouseReleased()
{
  if (clicker > 0)
  {
    if (mouseX > exitx
    && mouseY > exity
    && mouseX < (exitx + exitsize)
    && mouseY < (exity + exitsize))
    {
    clicker = clicker - 1;
    exitsize = exitsize * 1;
    }
      if (mouseX > ballx
      && mouseY > bally
      && mouseX < (ballx + ballsize)
      && mouseY < (bally + ballsize))
      {
      clicker = clicker + 1;
      ballsize = ballsize * 1.25;
      }
  }
 
}




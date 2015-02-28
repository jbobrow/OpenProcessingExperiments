
//shape and gun variables
float bulletY;
float bulletSpeed;
float laserY;
float laserSpeed;
float laserX;
float bulletX;
float rayX;
float rayY;
float raySpeed;
float gunY;
float gunSpeed;
float gunX;

//upgrade
boolean upgrade = false;
boolean upgrade2 = false;

//IncBulletSpeed
boolean IncBulletSpeed = false;
boolean IncBulletSpeed2 = false;

//shockwave
float waveSpeed;
float waveY=540;
boolean shock = false;

//shockwave counter
int shockwaves=0;

//asteroid variables
float ballX=random(20,480);
float ballY=11;
float xSpeed;
float ySpeed = 1;

float redX=random(20,480);
float redY=11;
float redXspeed;
float redYspeed = 1;

float greenX = random (20,480);
float greenY=11;
float greenXspeed;
float greenYspeed = 1;

float yellowX = random (20,480);
float yellowY=11;
float yellowXspeed;
float yellowYspeed = 1;


//background
PImage background1;
PImage background2;
PImage background3;

//sounds
//import ddf.minim.* ;
//Minim minim;
//AudioPlayer Shoot ;
//AudioPlayer Explosion ;
//AudioPlayer GameOver;
//AudioPlayer LaserCannon;



//score counter
int score=0;

//game start
boolean startgame = false;

//choose ship
boolean quad1 = false;
boolean triangles = false;
boolean ship = true;

void setup()
  {
  size(500,500);
  background(0,0,0);
  smooth();
  frameRate(20);
  background1 = loadImage ("Game Background.jpg");
  background2 = loadImage ("Level2B.jpg");
  background3 = loadImage ("Level3B.jpg");
  
//  minim = new Minim(this) ;
//  Shoot = minim.loadFile("Shoot.wav") ;
//  Explosion = minim.loadFile("Explosion.wav");
//  GameOver = minim.loadFile("GameOver.wav");
//  LaserCannon = minim.loadFile ("LaserCannon.wav");
 
  
  bulletY = height-40;
  bulletSpeed=0;
  laserY = height -40;
  laserSpeed = 0;
  
  image (background1, 0,0, 500,500);
  textSize(18);
  textAlign (CENTER);
  text ("Use the mouse to move along the bottom\nPress 'A' to shoot white at white asteroids\nPress 'S' to shoot red at red asteroids\nDon't let the asteroids reach the bottom!",width/2,100);
  
  textSize(30);
  text("Galactica",width/2,65);
  stroke(255,255,255);
  line(150,67, 350,67);
  
  text("Choose your ship", width/2, 300);
  fill(255);
  ellipse (100,375,100,100);
  fill(0,0,50);
  quad(80,400, 100,350, 120,400, 100,390);
  fill(255);
  ellipse(400,375,100,100);
  noStroke();
  fill(100,0,0);
  beginShape();
  vertex(400,415);
  vertex(375,365);
  vertex(385,340);
  vertex(400,365);
  vertex(415,340);
  vertex(425,365);
  endShape(CLOSE);
  triangle(425,405, 375,405, 400,365);
  
}
  
  
  
  
void draw ()
{
  if (startgame == true)
{
 stroke(0);
 textAlign(LEFT);  
    
    //background
    if (score < 50)
    {
  image (background1,0,0, 500,500);
    }
    
    if (score >= 51)
    {
  image (background2,0,0,  700,500);
    }  
  
    if (score >= 101)
    {
  image (background3,0,0,  700,500);
    }
  
  //score
  fill(255,255,255);
  textSize(16);
  text ("Score: " + score, 10,30);
  textSize(12);
  text ("Pause 'p'",10,50);
  
  //shape
  if (quad1 == true)
  {
  fill(0,0,50);
  quad(mouseX-20,height-15, mouseX,height-65, mouseX+20,height-15, mouseX,height-25);
  }
 
  if (triangles == true)
{
   noStroke();
  fill(100,0,0);
   beginShape();
  vertex(mouseX,height);
  vertex(mouseX-25,height-50);
  vertex(mouseX-15,height-75);
  vertex(mouseX,height-50);
  vertex(mouseX+15,height-75);
  vertex(mouseX+25,height-50);
    endShape(CLOSE);
  triangle(mouseX,height-50, mouseX-25, height-10, mouseX+25, height-10);
  }   
 
    

  //shockwave
    if (shock == true)
    {
      fill(255);
      textSize(12);
      text ("Shockwaves: " + shockwaves,10,68);
      
    if (key == 'g')  
      {
      if (shockwaves > 0)
      {
      fill(255,153,0,100);
      rect(0, waveY,    width, 5);
      fill(255,153,0,75);
      rect(0, waveY,    width, 7);
      fill(255,153,0,50);
      rect(0, waveY,    width, 9);
      fill(255,153,0,25);
      rect(0, waveY,    width, 11);
       
      if (waveY <= ballY)
          {
            ballY = -50;
          }   
       if (waveY <= redY)
          {
            redY = -50;
          } 
       if (waveY <= greenY)
          {
            greenY = -50;
          } 
       if (waveY <= yellowY)
          {
            yellowY = -50;
          } 
      } 
      }//firewave 
     if (waveY <= 0)
          {
            waveSpeed = 0;
            waveY = height+40;
            shockwaves = shockwaves - 1; 
          }        
      if (shockwaves < 0)
          {
            shockwaves=0;
          }    
     waveY = waveY + waveSpeed;     
    } //shock = true
 
  //laser
    if (key == 's')
    {
      fill(200,0,0);
      rect(laserX,laserY,4,20);
      bulletY = height+40;
      rayY=height+40;
      gunY=height+40;
    }
   laserY=laserY+laserSpeed;    
   
   
  //bullet
    if (key == 'a')
    {
      fill(255);
      rect(bulletX,bulletY,4,20);
      laserY=height+40;
      rayY=height+40;
      gunY=height+40;
    }  
  bulletY=bulletY+bulletSpeed;
  
  //ray
    if (score >= 51)
    {
    if (key == 'd')
    {
      fill(0,200,0);
      rect(rayX,rayY,4,20);
      bulletY = height+40;
      laserY=height+40;
      gunY=height+40;
    }  
   rayY=rayY+raySpeed;
    }
    
    
  //gun 
    if (score >= 101) 
    {
    if (key == 'f')
    {
      fill (255,255,0);
      rect (gunX, gunY, 4,20);
      bulletY = height+40;
      laserY=height+40;
      rayY=height+40;
    }  
    gunY = gunY+gunSpeed;
    }

     
    
  //gun reset
        if (bulletY < -20)
    {
      bulletSpeed=0;
      bulletY=height+40;
      bulletX=mouseX;
    }  
    
        if (laserY < -20)
    {
      laserSpeed=0;
      laserY=height+40;
      laserX=mouseX;
    }    
   
    if (score >= 51)
    {
        if (rayY < -20)
    {    
      raySpeed=0;
      rayY=height+40;
      rayX=mouseX;
    }
    }
        
    if (score >= 101)
    {
        if (gunY < -20)
    {
      gunSpeed=0;
      gunY=height+40;
      gunX=mouseX;
    }
    }    
        
  //asteroids
  fill(255);
  ellipse(ballX,ballY,40,40);
  ballX = ballX+xSpeed;
  ballY = ballY + ySpeed;
  
  fill (200,0,0);
  ellipse (redX,redY,40,40);
  redX = redX + redXspeed;
  redY = redY + redYspeed;
  
  if (score >= 51)
  {
    fill(0,200,0);
    ellipse(greenX,greenY,40,40);
    greenX = greenX+greenXspeed;
    greenY = greenY+greenYspeed;
  }  
  
  if (score >= 101)
  {
    fill (255,255,0);
    ellipse (yellowX,yellowY,40,40);
    yellowX = yellowX + yellowXspeed;
    yellowY = yellowY  + yellowYspeed;
  }  
  
  //asteroid x-direction
      if (ballX>=width-10)
        {
      xSpeed = xSpeed * -1;
        }
       if(ballX<=10)
         {
      xSpeed = xSpeed *-1;
        }  
 
 
       if (redX>=width-10)
      {
      redXspeed = redXspeed * -1;
      }
      if(redX<=10)
      {
      redXspeed = redXspeed *-1;
      }  
      
        if (greenX >= width-10)
      {
        greenXspeed = greenXspeed * -1;
      }
        if (greenX <=10)
      {  
        greenXspeed = greenXspeed * -1;
      }  
  
      if (yellowX >= width-10)
      {
        yellowXspeed = yellowXspeed * -1;
      }
        if (yellowX <=10)
      {
        yellowXspeed = yellowXspeed *-1;  
      }
      
      
   //game over
   if (ballY>height)
    {
    noLoop();
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    //GameOver.play ();
    }
    
    if (redY>height)
    {
    noLoop();
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    //GameOver.play ();
    }
    
    if (greenY>height)
    {
    noLoop();
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    //GameOver.play ();
    }
    
    if (yellowY>height)
    {
    noLoop();
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    //GameOver.play ();
    }
    
   //shooting asteroids
    if (dist(bulletX,bulletY, ballX, ballY) <= 40)
     {
       ballX = random(20,480);
       ballY=-50;
       ySpeed = ySpeed+.2;
       xSpeed = random(-4,4);
       score++;   
//       Explosion.rewind ();
//       Explosion.play ();
     }  
     
    if (dist (laserX,laserY,  redX, redY) <=40)
    {
      redX = random (20,480);
      redY = -50;
      redYspeed = redYspeed + .2;
      redXspeed = random (-4,4);
      score++;
//      Explosion.rewind ();
//      Explosion.play ();
    } 
    
    if (dist (rayX,rayY,  greenX, greenY) <=40)
    {
      greenX = random (20,480);
      greenY = -50;
      greenYspeed = greenYspeed + .2;
      greenXspeed = random (-4,4);
      score++;
//      Explosion.rewind ();
//      Explosion.play ();
    } 
    
    if (dist (gunX, gunY,  yellowX, yellowY) <=40)
    {
      yellowX= random (20,480);
      yellowY = -50;
      yellowYspeed = yellowYspeed + .2;
      yellowXspeed = random(-4,4);
      score++;
//      Explosion.rewind ();
//      Explosion.play ();
    }  
    
}//start game

// level 2
    if (score == 50)
     {
     ySpeed=1;
     redYspeed=1;
     greenYspeed=1;
     ballY=-50;
     greenY=-50;
     yellowY=-50;
     redY=-50;
     score = score + 1;   
     startgame = false;
     upgrade = true; 
     upgrade2 = false;
     fill(0);
     rect(0,0, width, height);
     fill(255);
     textSize(18);
     textAlign (CENTER);
     text ("Good Work!\nLevel 2\nPress 'D' to shoot at green\n\nAND",width/2,100);
     text("Select an upgrade", width/2, 265);
     textSize(16);
     text ("Shockwave\nPress 'g' to activate", 360, 300);
     text ("+ Bullet Speed", 140,370);
     textSize(12); 
     text("Fires a wave that destroys all asteriods.\n Use carefully because you are only given 3.\nAlso no score is gained from the wave", 360,350);
     fill(255);
     ellipse (140,440,100,100);
     ellipse(360,440,100,100);
     
    if (triangles == true)
     {
       fill(100,0,0);
        beginShape();
        vertex(400-40,415+65);
        vertex(375-40,365+65);
        vertex(385-40,340+65);
        vertex(400-40,365+65);
        vertex(415-40,340+65);
        vertex(425-40,365+65);
        endShape(CLOSE);
        triangle(425-40,405+65, 375-40,405+65, 400-40,365+65);
        
        fill(100,0,0);
        beginShape();
        vertex(400-40-220,415+65);
        vertex(375-40-220,365+65);
        vertex(385-40-220,340+65);
        vertex(400-40-220,365+65);
        vertex(415-40-220,340+65);
        vertex(425-40-220,365+65);
        endShape(CLOSE);
        triangle(425-40-220,405+65, 375-40-220,405+65, 400-40-220,365+65);
     }
    if (quad1 == true)
     {
       fill(0,0,50);
       quad(340,460, 360,410, 380,460, 360,450);
       
       fill(0,0,50);
       quad(340-220,460, 360-220,410, 380-220,460, 360-220,450);
     }
     
     
   } //level2end
     
// level 3
     if (score == 100)
     {
    ySpeed=1;
     redYspeed=1;
     greenYspeed=1;
     ballY=-50;
     greenY=-50;
     yellowY=-50;
     redY=-50;
     score = score + 1;   
     startgame = false;
     upgrade2 = true; 
     upgrade = false;
     fill(0);
     rect(0,0, width, height);
     fill(255);
     textSize(18);
     textAlign (CENTER);
     text ("Good Work!\nLevel 3\nPress 'F' to shoot at yellow\n\nAND",width/2,100);
     text("Select an upgrade", width/2, 265);
     if (IncBulletSpeed == true)
     {
     textSize(16);
     text ("Shockwave\nPress 'g' to activate", 360, 300);
     text ("+ Bullet Speed 2", 140,370);
     textSize(12); 
     text("Fires a wave that destroys all asteriods.\n Use carefully because you are only given 3.\nAlso no score is gained from the wave", 360,350);
     }
     
     if (shock == true)
     {
     textSize(16);
     text("5 extra shockwaves", 360,370);
     text ("+ Bullet Speed", 140,370);
     }
     
     fill(255);
     ellipse (140,440,100,100);
     ellipse(360,440,100,100);
     
    if (triangles == true)
     {
       fill(100,0,0);
        beginShape();
        vertex(400-40,415+65);
        vertex(375-40,365+65);
        vertex(385-40,340+65);
        vertex(400-40,365+65);
        vertex(415-40,340+65);
        vertex(425-40,365+65);
        endShape(CLOSE);
        triangle(425-40,405+65, 375-40,405+65, 400-40,365+65);
        
        fill(100,0,0);
        beginShape();
        vertex(400-40-220,415+65);
        vertex(375-40-220,365+65);
        vertex(385-40-220,340+65);
        vertex(400-40-220,365+65);
        vertex(415-40-220,340+65);
        vertex(425-40-220,365+65);
        endShape(CLOSE);
        triangle(425-40-220,405+65, 375-40-220,405+65, 400-40-220,365+65);
     }
    if (quad1 == true)
     {
       fill(0,0,50);
       quad(340,460, 360,410, 380,460, 360,450);
       
       fill(0,0,50);
       quad(340-220,460, 360-220,410, 380-220,460, 360-220,450);
     } 
     }//level 3
     
}//draw
     

void keyPressed()
{  
  
  if (key == ' ')
    {
      startgame=true;
    }
  
  if (key == 'p')
    {
     startgame=false;
     fill(255);
     textSize(18);
     textAlign (CENTER);
     text ("Game Paused\n Press space to continue", width/2,100);
    } 
 
   
   if (key == 'a')
    {
      bulletX=mouseX;
      bulletY=height-40;
//      Shoot.rewind();
//      Shoot.play();
      if (IncBulletSpeed == true)
      {
        bulletSpeed = -35;
      }
      if (IncBulletSpeed2 == true)
      {
        bulletSpeed = -50;
      }  
      if (IncBulletSpeed == false)
      {
        bulletSpeed = -20;
      }  
    } 
   
   if (key == 's')
    {
      laserX=mouseX;
      laserY=height-40;
//      Shoot.rewind();
//      Shoot.play();
      if (IncBulletSpeed == true)
      {
        laserSpeed = -35;
      }
      if (IncBulletSpeed2 == true)
      {
        laserSpeed = -50;
      }  
     if (IncBulletSpeed == false)
      {
        laserSpeed = -20;
      }  
    }
  
    if (key == 'd')
    {
      rayX = mouseX;
      rayY = height -40;
//      Shoot.rewind();
//      Shoot.play();
      if (IncBulletSpeed == true)
      {
        raySpeed = -30;
      }
      if (IncBulletSpeed2 == true)
      {
        raySpeed = -50;
      }  
      if (IncBulletSpeed == false)
      {
        raySpeed = -20;
      }  
    }
  
    if (key == 'f')
    {
      gunX= mouseX;
      gunY = height-40;
//      Shoot.rewind();
//      Shoot.play();
      if (IncBulletSpeed == true)
      {
        gunSpeed = -30;
      }
      if (IncBulletSpeed2 == true)
      {
        gunSpeed = -50;
      }  
      if (IncBulletSpeed == false)
      {
        gunSpeed = -20;
      }  
    }  
    
    
    if (key == 'g')
    {
      waveSpeed = -20;
      waveY=height-40;
      if (shockwaves > 1)
      {
//      LaserCannon.rewind();
//      LaserCannon.play (); 
      }      
    }  
    
}  

void mousePressed ()
  {
    if (ship == true)
    {
    if (mousePressed && dist( mouseX, mouseY, 100,375) < 100 )
    {
      quad1 = true;
      startgame = true;
      ship =false;
    }  
    if (mousePressed && dist (mouseX, mouseY, 400,375) < 100 )
    {
      triangles = true;
      startgame = true;
      ship=false;
    }  
    } //choose ship
    
    if (upgrade == true)
    {
     if (mousePressed && dist (mouseX, mouseY, 360,440) < 100 )
      {
      shock = true;
      shockwaves = 3;
      startgame = true;
      upgrade = false;
      }
      
      if (mousePressed && dist (mouseX, mouseY, 140,440) < 100 )
      {
       IncBulletSpeed = true;
       startgame = true;
       upgrade = false;
      } 
    } //upgrade
    
    
   if (upgrade2 == true)
   {
     if (shock == true)
     {
     if (mousePressed && dist (mouseX, mouseY, 360,440) < 100 )
      {
      shockwaves = shockwaves + 5;
      startgame = true;
      upgrade2 = false;
      }
      if (mousePressed && dist (mouseX, mouseY, 140,440) < 100 )
      {
       IncBulletSpeed = true;
       startgame = true;
       upgrade2=false;
      } 
     }
      
      
      if (IncBulletSpeed == true)
      {
        if (mousePressed && dist (mouseX, mouseY, 360,440) < 100 )
      {
      shock = true;
      shockwaves = 3;
      startgame = true;
      upgrade2 = false;
      }
      
      if (mousePressed && dist (mouseX, mouseY, 140,440) < 100 )
      {
       IncBulletSpeed2 = true;
       startgame = true;
       upgrade2=false;
      } 
      }
     }//upgrade2
      
     
}//mousepressed



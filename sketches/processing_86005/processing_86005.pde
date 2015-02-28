
/**
  Space Adventure 2013
  Use a and d to move
  Use w to fire laser
  Use s to launch gernade
  Destroy the Alien at the top of the screen!
*/
float ballgX ;
float ballgY ;
float xSpeedg = 1 ;
float ySpeedg = 1 ;
float ballbX ;
float ballbY ;
float xSpeedb = 1.03 ;
float ySpeedb = 1.03 ;
float ballrX ;
float ballrY ;
float xSpeedr = .5 ;
float ySpeedr = .5 ;
float ShipX ;
int score = 0 ;
int lives = 10 ;
float boltX ;
float boltY ;
float boltSpeed ;
float gernadeX ;
float gernadeY ;
float AlienX ;
int aSheild = 30 ;
float bomb ;
float bombX ;
float bombY ;
float bomblX ;
float bomblY ;
float[] metX ;
float[] metY ;
float metSpeed ;
float time ;
boolean launch ;
boolean drop ;
boolean met[] ;

// Sounds
//import ddf.minim.* ;
//Minim minim ;
//AudioPlayer laser ;
//AudioPlayer blast ;

void setup()
{
  size(600,600) ;
  smooth() ;
  background(255) ;
  met=new boolean[4] ;
  metX=new float[4] ;
  metY=new float[4] ;
  ballgX = random(100,500) ;
  ballgY = random(50,150) ;
  ballbX = random(100,500) ;
  ballbY = random(50,150) ;
  ballrX = random(100,500) ;
  ballrY = random(50,150) ;
  AlienX = random(50,550) ;
  score = 0 ;
  
  //minim = new Minim(this) ;
  //laser = minim.loadFile("Laser.wav") ;
  //blast = minim.loadFile("Bomb.wav") ;
}

void draw()
{
  metSpeed=score/100 ;
  
  // background
  fill(0,0,0,50) ;
  stroke(0) ;
  strokeWeight(1) ;
  rect(0,0,width,height) ;
  fill(0,255,0) ;
  
  //green ball
  if(ballgX >= width-10)
  {
    xSpeedg = xSpeedg * -1 ;
    ballgX=width-10 ;
  }
  
  if(ballgX <= 10)
  {
    xSpeedg = xSpeedg * -1 ;
    ballgX=10 ;
  }
  if(ballgY >= height-10)
  {
    if(ballgX-ShipX >= -15)
    {
     if(ballgX-ShipX  <= 15) 
     {
       lives+=-1 ;
     }
    }
    ySpeedg*=random(1.4,1.2) ;
    ballgY=0 ;
    ballgX=random(50,550) ;
  }
  
  if(lives<=0)
  {
    textAlign(CENTER) ;
    textSize(30) ;
    text("--YOU LOSE--", width/2,height/2) ;
    text("TROLOLOLOLOL", width/2,height/2+30) ;
    stroke(255,0,0) ;
    fill(255,255,0) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 10,10) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 10,10) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 12,12) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 12,12) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 13,13) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 13,13) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 15,15) ;
    ellipse(random(ShipX-30,ShipX+30),random(550,590), 15,15) ;
    noLoop() ;
  }
  
  if(dist(ballgX,ballgY, boltX,boltY) <= score/5+10)
  {
    ballgY=0 ;
    ballgX=random(50,550) ;
    score+=2 ;
  }
  if(dist(ballgX,ballgY, gernadeX,gernadeY) <= 30)
  {
    launch=false ;
    stroke(255,0,0) ;
    fill(255,255,0) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    //blast.play() ;
    //blast.rewind() ;
    gernadeY=590 ;
    gernadeX=ShipX ;
    score+=3 ;
    ballgY=0 ;
    ballgX=random(50,550) ;
  }
  
  ellipse(ballgX,ballgY,20,20) ;
  ballgX=ballgX+xSpeedg ;
  ballgY=ballgY+ySpeedg ;
  
  if(xSpeedg>=5)
  {
    xSpeedg=5 ;
  }
  if(ySpeedg>=5)
  {
    ySpeedg=5 ;
  }
  
  //blue ball
  fill(0,0,255) ;
  if(ballbX >= width-5)
  {
    xSpeedb = xSpeedb * -1.03 ;
    ballbX=width-5 ;
  }
  
  if(ballbX <= 5)
  {
    xSpeedb = xSpeedb * -1.03 ;
    ballbX=5 ;
  }
  
  if(ballbY >= 580)
  {
    if(ballbX-ShipX >= -18)
    {
     if(ballbX-ShipX  <= 18) 
     {
       lives=lives-1 ;
     }
    }
    ySpeedb = ySpeedb * random(1.5,1.3) ;
    ballbY=0 ;
    ballbX=random(50,550) ;
  }
  
  if(dist(ballbX,ballbY, boltX,boltY) <= score/5+5)
  {
    ballbY=0 ;
    ballbX=random(50,550) ;
    score+=3 ;
  }
  if(dist(ballbX,ballbY, gernadeX,gernadeY) <= 15)
  {
    launch=false ;
    stroke(255,0,0) ;
    fill(255,255,0) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    //blast.play() ;
    //blast.rewind() ;
    gernadeY=590 ;
    gernadeX=ShipX ;
    score+=4 ;
    ballbY=0 ;
    ballbX=random(50,550) ;
  }
  
  ellipse(ballbX,ballbY,10,10) ;
  ballbX=ballbX+xSpeedb ;
  ballbY=ballbY+ySpeedb ;
  
  if(xSpeedb>=5)
  {
    xSpeedb=5 ;
  }
  if(ySpeedb>=5)
  {
    ySpeedb=5 ;
  }
  
  // red ball/nuke
  if(ballrX >= width-40)
  {
    xSpeedr = xSpeedr * -1 ;
    ballrX=width-40 ;
  }
  
  if(ballrX <= 0)
  {
    xSpeedr = xSpeedr * -1 ;
    ballrX=0 ;
  }
  
  if(ballrY >= height-40)
  {
    if(ballrX-ShipX >= -55)
    {
     if(ballrX-ShipX  <= 55) 
     {
       lives=lives-2 ;
     }
    }
    ySpeedr = ySpeedr * random(1.1,1) ;
    ballrY=0 ;
    ballrX=random(50,550) ;
  }
  
  if(dist(ballrX,ballrY, boltX,boltY) <= score/5+40)
  {
    ballrY=0 ;
    ballrX=random(50,550) ;
    score+=1 ;
  }
  if(dist(ballrX,ballrY, gernadeX,gernadeY) <= 30)
  {
    launch=false ;
    stroke(255,0,0) ;
    fill(255,255,0) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    //blast.play() ;
    //blast.rewind() ;
    gernadeY=590 ;
    gernadeX=ShipX ;
    score+=3 ;
    ballrY=0 ;
    ballrX=random(50,550) ;
  }
  
  image(loadImage("nukesimp.png"), ballrX,ballrY, 40,40) ;
  ballrX=ballrX+xSpeedr ;
  ballrY=ballrY+ySpeedr ;
  
  if(xSpeedr>=5)
  {
    xSpeedr=5 ;
  }
  if(ySpeedr>=5)
  {
    ySpeedr=5 ;
  }
  
  if(keyPressed)
  {
    if(key=='a')
    {
      ShipX=ShipX-5 ;
    }
    if(key=='d')
    {
      ShipX=ShipX+5 ;
    }
  }
  
  //Ship
  fill(255,0,255) ;
  triangle(ShipX-15,580,ShipX,560,ShipX+15,580) ;
  stroke(20,255,235) ;
  strokeWeight(5) ;
  line(ShipX,560,ShipX,578) ;
  noFill() ;
  strokeWeight(1) ;
  ellipse(ShipX,572, 45,35) ;
  
  // Bolt and/or Weapon
  strokeWeight(score/5+1) ;
  line(boltX,boltY, boltX, boltY-random(score/5+1,score/3+1)) ;
  boltY+=boltSpeed ;
  if(dist(AlienX,50, boltX,boltY) <= 20)
  {
    boltY=605 ;
    boltSpeed=0 ;
  }
    if(boltY<0)
  {
    boltY=605 ;
    boltSpeed=0 ;
  }
  
  // Gernade
  strokeWeight(1) ;
  stroke(random(255)) ;
  fill(random(255),random(255),random(255)) ;
  ellipse(gernadeX,gernadeY, random(10,15),random(10,15)) ;
  
  if(launch==false)
  {
    gernadeX=ShipX ;
  }
  if(launch==true)
  {
    gernadeY-=1.3 ;
  }
  if(dist(bombX,bombY, gernadeX,gernadeY) <= 10)
  {
    launch=false ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    //blast.play() ;
    //blast.rewind() ;
    gernadeY=590 ;
    gernadeX=ShipX ;
    score+=3 ;
  }
  if(gernadeY<=50)
  {
    if(dist(gernadeX,gernadeY, AlienX,55) <= 30)
    {
      score+=1 ;
      aSheild-=5 ;
    }
    launch=false ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 10,10) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    ellipse(random(gernadeX-30,gernadeX+30),random(gernadeY-30,gernadeY+30), 12,12) ;
    //blast.play() ;
   // blast.rewind() ;
    gernadeY=590 ;
  }
  
  // Alien
  AlienX+=random(-10,10) ;
  
  if(AlienX < 20)
  {
    AlienX=20 ;
  }
  
  if(AlienX > width-20)
  {
    AlienX=width-20 ;
  }
  stroke(0) ;
  strokeWeight(1) ;
  fill(152) ;
  rect(AlienX-10,50, 20,10) ;
  stroke(150,30,190) ;
  point(AlienX-5,55) ;
  point(AlienX+5,55) ;
  noFill() ;
  ellipse(AlienX,55, 30,20) ;
  if(dist(AlienX,50, boltX,boltY) <= score/5+20)
  {
    aSheild-=1 ;
    score+=2 ;
  }
  
  // Bomb
  bomb=random(1,100) ;
  stroke(random(255)) ;
  fill(random(255),random(255),random(255)) ;
  ellipse(bombX,bombY, random(5,10),random(5,10)) ;
  if(bomb>=97)
  {
    drop=true ;
    bombY+=1 ;
  }
  if(drop==false)
  {
    bombX=AlienX ;
  }
  if(drop==true)
  {
    bombY+=bombY/60 ;
  }
  if(dist(bombX,bombY, boltX,boltY) <= 5)
  {
    drop=false ;
    bombY=60 ;
    bombX=AlienX ;
    score+=2 ;
  }
  if(bombY>=580)
  {
    if(dist(bombX,bombY, ShipX,580) <= 18)
    {
      lives-=1 ;
    }
    drop=false ;
    bombY=60 ;
  }
  
  // Metiors
  if(score<100)
  {
    met[1]=false ;
  }
  else
  {
  met[1]=true ;
  }
  if(met[1]==true)
  {
    metX[1]+=metSpeed*.8 ;
    metY[1]+=metSpeed*1.5 ;
  }
  if(met[1]==false)
  {
    metX[1]=-15 ;
    metY[1]=0 ;
  }
  if(metY[1]>=590)
  {
    metY[1]=0 ;
    metX[1]=random(-15,550) ;
  }
  
  if(score<200)
  {
    met[2]=false ;
  }
  else
  {
  met[2]=true ;
  }
  if(met[2]==true)
  {
    metX[2]-=metSpeed*.9 ;
    metY[2]+=metSpeed*1.8 ;
  }
  if(met[2]==false)
  {
    metX[2]=615 ;
    metY[2]=0 ;
  }
  if(metY[2]>=590)
  {
    metY[2]=0 ;
    metX[2]=random(50,615) ;
  }
  
  if(score<300)
  {
    met[3]=false ;
  }
  else
  {
  met[3]=true ;
  }
  if(met[3]==true)
  {
    metY[3]+=metSpeed*2 ;
  }
  if(met[3]==false)
  {
    metX[3]=-15 ;
    metY[3]=0 ;
  }
  if(metY[3]>=590)
  {
    metY[3]=0 ;
    metX[3]=random(10,590) ;
  }
  
  if(dist(metX[1],metY[1], ShipX,570) <= 30)
  {
    lives-=3 ;
    metX[1]=random(-15,550) ;
    metY[1]=-10 ;
  }
  if(dist(metX[2],metY[2], ShipX,570) <= 30)
  {
    lives-=3 ;
    metX[2]=random(50,615) ;
    metY[2]=-10 ;
  }
  if(dist(metX[3],metY[3], ShipX,570) <= 30)
  {
    lives-=3 ;
    metX[3]=random(10,590) ;
    metY[3]=-10 ;
  }
  
  fill(65) ;
  stroke(187) ;
  ellipse(metX[1],metY[1], 18,15) ;
  ellipse(metX[2],metY[2], 15,18) ;
  ellipse(metX[3],metY[3], 12,20) ;
  
  // Data
  fill(255) ;
  textSize(8) ;
  textAlign(LEFT) ;
  text(ShipX,25,575) ;
  text("Score: " + score,width/2,30) ;
  text("<" + "--A",100,500) ;
  text("D--" + ">",465,500) ;
  text("Your Sheild: " + lives,10,100) ;
  text("Eneimes Sheild: " + aSheild,width-150,100) ;
  
  if(key=='p')
  {
    textAlign(CENTER) ;
    textSize(30) ;
    text("PAUSED  there is no resume button", width/2,height/2) ;
    noLoop() ;
  }
  
  if(aSheild <= 0)
  {
    time=millis()/1000 ;
    textAlign(CENTER) ;
    textSize(30) ;
    text("--YOU WIN!!!--", width/2,height/2) ;
    text("Final Score: " + score, width/2,height/2+60) ;
    text("Time: " + time, width/2,height/2+30) ;
    fill(255,255,0) ;
    stroke(255,0,0) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 10,10) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 10,10) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 12,12) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 12,12) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 13,13) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 13,13) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 15,15) ;
    ellipse(random(AlienX-30,AlienX+30),random(35,75), 15,15) ;
    noLoop() ;
  }
  fill(255,0,0, 50) ;
  rect(ballrX-2,height-5,45,10) ;
  fill(0,255,0, 50) ;
  rect(ballgX-12,height-5,25,10) ;
  fill(0,0,255, 50) ;
  rect(ballbX-7,height-5,15,10) ;
  
  if(score>1000) 
  {
    stroke(255,0,0) ;
    strokeWeight(10) ;
    fill(255,255,0) ;
    ellipse(random(width),random(height), 100,100) ;
    ellipse(random(width),random(height), 100,100) ;
    ellipse(random(width),random(height), 120,120) ;
    ellipse(random(width),random(height), 120,120) ;
    ellipse(random(width),random(height), 130,130) ;
    ellipse(random(width),random(height), 130,130) ;
    ellipse(random(width),random(height), 150,150) ;
    ellipse(random(width),random(height), 150,150) ;
    ellipse(random(width),random(height), 100,100) ;
    ellipse(random(width),random(height), 100,100) ;
    ellipse(random(width),random(height), 120,120) ;
    ellipse(random(width),random(height), 120,120) ;
    ellipse(random(width),random(height), 130,130) ;
    ellipse(random(width),random(height), 130,130) ;
    ellipse(random(width),random(height), 150,150) ;
    ellipse(random(width),random(height), 150,150) ;
    time=millis()/1000 ;
    fill(128) ;
    textSize(25) ;
    textAlign(CENTER) ;
    text("The Freakin' Lazer Beam Blew Up The Game!", width/2,height/2) ;
    text("Time: " + time, width/2,height/2+30) ;
    text("Score: MAXED OUT", width/2,height/2+60) ;
    noLoop () ;
  }
}

void keyPressed()
{
  if(key=='w')
  {
    boltSpeed= -5 ;
    boltX=ShipX ;
    //laser.rewind() ;
    //laser.play() ;
  }
  if(key=='s')
  {
    if(score>=5)
    {
    launch=true ;
    }
  }
  if(key=='v')
  {
    aSheild-=1 ;
  }
  if(key=='b')
  {
    score+=10 ;
    lives=10 ;
  }
  if(keyCode==RIGHT)
  {
    gernadeX+=5 ;
  }
  if(keyCode==LEFT)
  {
    gernadeX-=5 ;
  }
}

void mousePressed()
{
  if(score>=100)
  {
    stroke(255,0,0) ;
    fill(255,255,0) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 10,10) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 10,10) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 12,12) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 12,12) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 13,13) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 13,13) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 15,15) ;
    ellipse(random(mouseX-30,mouseX+30),random(mouseY-30,mouseY+30), 15,15) ;
  }
}



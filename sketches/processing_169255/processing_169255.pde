
//Boo movement
  float booX = 50, booY = 200;
  float booXspeed = 2.8, booYspeed = 2.2;
  int booXdirection = 1, booYdirection = 1;

//Potato movement
  float potatoX = 0;
  float potatoSpeed = 1;
  int potatoXdirection = 1, potatoYdirection = 1;

//smashBall movement
  float smashBallX = 325, smashBallY = 150, smashBallSpeed = 2.5;
  int smashBallXdirection = -1, smashBallYdirection = -1;

void setup(){
  size(600, 600);
  
//images
  windows = loadImage("windows.jpg");
  cracked_windows = loadImage("cracked_windows.jpg");
  boo = loadImage("boo.png");
  scared_boo = loadImage("scared_boo.gif");
  potato = loadImage("potato.png");
  smashBall = loadImage("smashBall.png");
  smashBallRed = loadImage("smashBallRed.png");
  smashBallBlack = loadImage("smashBallBlack.png");
  pac_man = loadImage("pac_man.png");
  ESRR = loadImage("ESRR.png");
  
}
  
void draw(){
  time = millis()/1000;
  
  //window background
    windows.resize(600, 600);
    image(windows, 0, 0);
    
  //cracked_window background
    if(time > 5){
      cracked_windows.resize(600, 600);
      image(cracked_windows, 0, 0);
    }
    
  //boo
    if(time>0){
      if(time<17.5){
        booX = booX + (booXspeed * booXdirection);
        booY = booY + (booYspeed * booYdirection);
        
        if(booX >width-50 || booX < 0){
          booXdirection *= -1;
        }
        if(booY >height-50 || booY <0){
          booYdirection *= -1;
        }
        
        boo.resize(50, 50);
        image(boo, booX, booY);
      }
    }
    
  //Munch
    if(time>17.5){
      scared_boo.resize(50, 50);
      image(scared_boo, 450, 300);
    }
   
  //potato
  if(time>4){
    potatoX = potatoX + potatoSpeed;
    potato.resize(90, 70);
    image(potato, potatoX, 300);
  }
  
//SmashBall
  if(time > 6){
    if(time <24){
    smashBallX = smashBallX + (smashBallSpeed * smashBallXdirection);
    smashBallY = smashBallY + (smashBallSpeed * smashBallYdirection);
    
    if(smashBallY >height-60 || smashBallY <-5){
      smashBallYdirection *= -1;
    }
    else if(smashBallX <-40){
      smashBallX = 640;
    }
    smashBall.resize(50, 60);
    image(smashBall, smashBallX, smashBallY);
    }
  }
  
//SmashBall Dying
  if(time > 11){
    if(time < 12){
      smashBallRed.resize(50, 60);
      image(smashBallRed, smashBallX, smashBallY);
    }
  }
  if(time > 15){
    if(time < 16){
      image(smashBallRed, smashBallX, smashBallY);
    }
  }
  if(time > 18){
    if(time < 19){
      image(smashBallRed, smashBallX, smashBallY);
    }
  }
  if(time > 21){
    if(time < 22){
      image(smashBallRed, smashBallX, smashBallY);
    }
  }

  if(time > 24){
    smashBallBlack.resize(50, 60);
    image(smashBallBlack, 100, 350);
  }

//THE MOTTO
  if(time> 26){
    ESRR.resize(600, 600);
    image(ESRR, 0, 0);
  }
}



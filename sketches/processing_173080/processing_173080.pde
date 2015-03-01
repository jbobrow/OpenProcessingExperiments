
int a = 0, q = 0, s = 0, d = 0, e = 0;
int da = 1;
int score = 0;
int gokuX = 50, bar = 0, barHorizontal = 0;
int blastRight = 0, blastLeft = 0, blastX = 6;
float horizontal = 0;
boolean strafe = true;
//power up
int frames = 3; 
int panel = 0;

void setup(){
  size(500, 500);
  final_dest = loadImage("final_dest.png");
  winner = loadImage("Midnight-Conspiracy-.jpg");
  //forms
    SSJ = loadImage("SS_Stand.png");
    SSJ2 = loadImage("SS2_Stand_1.png");
  //Ki
    power = loadImage("power_1.png");
    power2 = loadImage("power2_1.png");
    blast = loadImage("kamehameha.png");
    blast2= loadImage("kamehameha2.png");
  //Kicks
    RightKick= loadImage("RightKick_1.png");
    RightKick2 = loadImage("RightKick2_1.png");
    LeftKick = loadImage("LeftKick_1.png");
    LeftKick2 = loadImage("LeftKick2_1.png");
  //Punches
    PunchRight = loadImage("SSJ_Right_Punch_1.png");
    PunchLeft = loadImage("SSJ_Left_Punch_1.png");
  //strafe
    FlyRight = loadImage("SS_FlyRight.png");
    FlyLeft = loadImage("SS_FlyLeft.png");

}

void draw(){
  m = millis()/1000;
  
  //background
    final_dest.resize(700, 700);
    image(final_dest, -100, -50); 
   
  //goku
    gokuX += horizontal;
    SSJ.resize(80, 100);
    if(bar >=150){
      SSJ = SSJ2;
    }
    image(SSJ, gokuX, 295);

  //Que bar
    noFill();
    stroke(#FFFFFF);
    strokeWeight(2);
    rect(0, 25, 100, 50);
    rect(100, 25, 100, 50);
    rect(200, 25, 100, 50);
    rect(300, 25, 100, 50);
    rect(400, 25, 100, 50);
    
   //Flying Letters
     fill(#FFFFFF);
     textSize(50);
     a-=da;
     q-=da;
     s-=da;
     d-=da;
     e-=da;
       text("A", 35, a);
       text("Q", 135, q);
       text("S", 235, s);
       text("D", 335, d);
       text("E", 435, e);
       
  //Letter movement
    if( a<0){
      a = 550;
    }
    if( q<0){
      q = 600;
    }
    if( s<-50){
      s = 650;
    }
    if( d<-70){
      d = 600;
    }
    if( e<-40){
      e = 690;
    }
    
  //Difficulty
    if(m >= 23){
      da = 2;
    }
    if(m >= 35){
      da = 3;
    }
    if(m >= 47){
      da = 4;
    }
   
  //Invisible powerbar
    noFill();
    noStroke();
    if(bar <= 150){
      if(strafe == true){
      bar += barHorizontal;
      }
    }
    rect(100, 25, bar, 20);
    
  //Kamehameha
    if(key == 'e' && bar >= 100){
      blast.resize(70, 50);
      blastRight += blastX;
      image(blast, gokuX+80+blastRight, 306);
    }
    if(key == 'q' && bar >= 150){
      blastLeft -= blastX;
      blast2.resize(70, 50);
      image(blast2, gokuX-70+blastLeft, 306);
    }
    
  //Score Text
    fill(#FFFFFF);
    textSize(50);
    text("Score:"+score, 280, 480);
    
  //Final score
    if(m >= 60){
      winner.resize(500, 500);
      image(winner, 0, 0);
      fill(random(255), random(255), random(255));
      textSize(60);
      text("Final Score:"+score, 50, 450);
      }
 
}

void keyPressed(){
  //Goku's movements
    if (key == CODED && keyCode == LEFT){
      strafe = false;
      horizontal = -3;
      SSJ = FlyLeft;
      SSJ2 = FlyLeft;
    }
    if (key == CODED && keyCode == RIGHT){
      strafe = false;
      horizontal = 3;
      SSJ = FlyRight;
      SSJ2 = FlyRight;
    }
      
  //Power Levels
    if (key == 's'){
      barHorizontal = 1;
      SSJ = power;
    }
    
    if (key == 's' && bar >= 150){
      SSJ2 = power2;
    }
      
  //Punching
    if (key == 'e'){
      SSJ = PunchRight;
      SSJ2 = PunchRight;
    }
    if (key == 'q'){
      SSJ = PunchLeft;
      SSJ2 = PunchLeft;
    }
  //Kicking
  if (key == 'd'){
    SSJ = RightKick;
    SSJ2 = RightKick2;
  }
  if (key == 'a'){
    SSJ = LeftKick;
    SSJ2 = LeftKick2;
  }
  
  //score system
    if(key == 'a'){
      if(a>25 && a<75){
        score = score + 1;
      }
    }
    if(key == 'q'){
      if(q>25 && q<75){
        score = score + 1;
      }
    }
    if(key == 's'){
      if(s>25 && s<75){
        score = score + 1;
      }
    }
    if(key == 'd'){
      if(d>25 && d<75){
        score = score + 1;
      }
    }
    if(key == 'e'){
      if(e>25 && e<75){
        score = score + 1;
      }
    }
 
}
    
void keyReleased(){
  if (key == CODED){
    if (keyCode == LEFT || keyCode == RIGHT){
        horizontal = 0;
        strafe = true;
    }
  }
  if (key == 's' || key == 'e' || key == 'q' || key == 'a' || key == 'd'
  || key == CODED && keyCode == LEFT || key == CODED && keyCode == RIGHT){
    SSJ = loadImage("SS_Stand.png");
    SSJ2 = loadImage("SS2_Stand_1.png");
  }
  if(key == 's'){
    barHorizontal = 0;
  }
}



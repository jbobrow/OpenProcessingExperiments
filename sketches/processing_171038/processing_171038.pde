
int gokuX = 50, bar = 0, barHorizontal = 0;
int blastRight = 0, blastLeft = 0, blastX = 6;
float horizontal = 0;
boolean strafe = true;

void setup(){
  size(500, 500);
  final_dest = loadImage("final_dest.png");
  //forms
    SSJ = loadImage("SS_Stand.png");
    SSJ2 = loadImage("SS2_Stand.png");
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

  //Power Bar
    textSize(20);
    fill(#FFFFFF);
    text("Ki Level:", 20, 40);
    noFill();
    stroke(#FFFFFF);
    strokeWeight(2);
    rect(100, 25, 150, 20);
    fill(#FF0808);
    strokeWeight(2);
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
      SSJ = power;
      barHorizontal = 1;
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
    SSJ2 = loadImage("SS2_Stand.png");
  }
  if(key == 's'){
    barHorizontal = 0;
  }
}



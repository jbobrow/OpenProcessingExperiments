
int xpos = 200;
int ypos = 300;
boolean stop;
int xpos2 = 600;
int ypos2 = 300;

int pointWidth=8;

int trigger = 0;
int trigger2 = 0;
int motionController_1 = 0;
int[][] td = new int[802][602];
Snake red;
Snake green;
void setup() {
  size(800, 600);
  background(50);
  red = new Snake(255, 0);
  green = new Snake(0, 255);
    for(int i=0; i<802; i++){
  for(int j=0; j<602; j++){
    td[i][j]=0;
  }  
  }
  design();
}

void draw() {
  red.appear();
  red.triggerFunction();
  red.posSaver();
  red.colCheck();


  green.appear();
  green.triggerFunction2();
  green.posSaver();
  green.colCheck();

  
  if(stop==false){
      red.move();
      green.move2();
  }
  
  if(keyPressed && (key=='r'|| key=='R') && stop==true){
   restart(); 
  }
}


void keyReleased() {
  motionController_1=0;
}

void restart(){

    xpos = 200;
  ypos = 300;

  xpos2 = 600;
  ypos2 = 300;

  trigger = 0;
  trigger2 = 0; 
  background(50);
      for(int i=0; i<802; i++){
  for(int j=0; j<602; j++){
    td[i][j]=0;
  }  
  }
stop=false;
design();
}

void design(){
  textSize(10);
  fill(255);
 text("Coded by Alex Pilkevych",300,height-12); 
}

class Snake {

  int redSnake;
  int greenSnake;

  Snake(int TredSnake, int TgreenSnake) {
    redSnake = TredSnake;
    greenSnake = TgreenSnake;
  }

  /*
  GENERAL
   */
  void appear() {
    xpos = constrain(xpos,1,width);
    xpos2 = constrain(xpos2,1,width);
    ypos = constrain(ypos,1,width);
    ypos2 = constrain(ypos2,1,width);
    
    fill(redSnake, greenSnake, 0); 
    if (redSnake == 255) {
      ellipse(xpos, ypos, pointWidth, pointWidth);
    } 
    else {
      ellipse(xpos2, ypos2, pointWidth, pointWidth);
    }
  }
 
  void posSaver() {
    td[xpos][ypos]=1;
    td[xpos2][ypos2]=1;
  }

  void colCheck() {
    /*
    Check RED:
    */
    //Down and right
    if (trigger==0 || trigger==1) {
      if (td[xpos+1][ypos+1]!=0) {
        redLoose();
      }
    }

    //Up and Left
    if (trigger==2 || trigger==3) {
      if (td[xpos-1][ypos-1]!=0) {
        
        redLoose();
      }
    }
    
    //Offscreen
    if(xpos>width||xpos<2||ypos>height||ypos<2){
     redLoose(); 
    }
    
    
        /*
    Check GREEN:
    */
    
    //Down and right
    if (trigger2==0 || trigger2==1) {
      if (td[xpos2-1][ypos2-1]!=0) {
        greenLoose();
      }
    }

    //Up and Left
    if (trigger2==2 || trigger2==3) {
      if (td[xpos2+1][ypos2+1]!=0) {
        greenLoose();
      }
    }
    
    //Offscreen
    if(xpos2>width||xpos2<2||ypos2>height||ypos2<2){
     greenLoose(); 
    }
    
    //DRAW
    if(dist(xpos,ypos,xpos2,ypos2)<5){
     gameDraw(); 
    }
  }

void gameDraw(){
    textSize(50);
    fill(0,80);
    rectMode(CENTER);
    rect(width/2,height/2,500,100);
    fill(255, 0, 0);
    text("DRAW", width/2-120,height/2+15);
    
    textSize(20);
    text("Press R to restart", width/2-220, height/2+40);
    stop=true;
}
/*
RED
*/
  
   void triggerFunction() {
    if (keyPressed && keyCode==RIGHT && motionController_1==0) {
      trigger++; 
      motionController_1 = 1;
    } 
    else if (keyPressed && keyCode==LEFT && motionController_1==0) {
      trigger--;   
      motionController_1 = 1;
    }
    //Trigger Repeat
    if (trigger>3) {
      trigger=0;
    } 
    else if (trigger<0) {
      trigger=3;
    }
  }


  void move()
  { 
    if (trigger==0) {
      xpos++;
    } 
    else
      if (trigger==1) {
        ypos++;
      } 
      else
        if (trigger==2) {
          xpos--;
        } 
        else
          if (trigger==3) {
            ypos--;
          }
  }

  void redLoose() {
    
    textSize(50);
    fill(0,80);
    rectMode(CENTER);
    rect(width/2,height/2,500,100);
    fill(0, 255, 0);
    text("Green Player Wins!", width/2-220,height/2+15);
    stop=true;
    
    textSize(20);
    text("Press R to restart", width/2-220, height/2+40);
  }

/*
GREEN
*/
 void triggerFunction2() {
    if (keyPressed && (key=='d' || key=='D') && motionController_1==0) {
      trigger2++; 
      motionController_1 = 1;
    } 
    else if (keyPressed && (key=='a' || key=='A') && motionController_1==0) {
      trigger2--;   
      motionController_1 = 1;
    }
    //trigger2 Repeat
    if (trigger2>3) {
      trigger2=0;
    } 
    else if (trigger2<0) {
      trigger2=3;
    }
  }

  void move2()
  { 
    if (trigger2==0) {
      xpos2--;
    } 
    else
      if (trigger2==1) {
        ypos2--;
      } 
      else
        if (trigger2==2) {
          xpos2++;
        } 
        else
          if (trigger2==3) {
            ypos2++;
          }
  }

  void greenLoose() { 
     
    textSize(50);
    fill(0,80);
    rectMode(CENTER);
    textMode(CENTER);
    rect(width/2,height/2,500,100);
    fill(255, 0, 0);
    text("Red Player Wins!", width/2-220,height/2+15);
    textSize(20);
    text("Press R to restart", width/2-220, height/2+40);
stop=true;
  }
}

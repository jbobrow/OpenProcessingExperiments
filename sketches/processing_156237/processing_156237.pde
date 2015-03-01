
float xPos, yPos, xBar, yBar,xOpen,yOpen,score,time;
int boxColor, speed,count,adjust,maxSpeed,deaths;
PFont myfont;
boolean passed;
int test;



void setup () {
  size (1000, 1000);
  xPos = 50;
  speed =10;
  boxColor=255;
  yPos=height/2;
  xBar=width;
  count = 0;
  test=0;

  myfont=loadFont("8bit.vlw");
  deaths=0;
  
  
  
  adjust=0;
  maxSpeed=30;
}

void draw() {
  time = millis()*0.006;
  
  if (test==0){
  
  score=+time;
//  print("score: ");
//  println(score);
 
  background(0);
  

  //  if (mousePressed) { 
  //      yPos++;
  //      boxColor=0;
  //      
  //    } else
  //    {
  //      boxColor=255;
  //      yPos--;
  //    }

  yPos=mouseY;    //Player movement
  xPos=mouseX;

  fill(0, 255, 0);
  rect( xBar, yBar, 50, height);    //Obstacle

  if (xBar<0) {
    xBar=width;
    yOpen=random(150,height-150);  //opening placement Y
    speed++;
    adjust++;// adjusting horizontal position of opening
    
    if(speed>maxSpeed){
      speed=maxSpeed;
      adjust--;
    } //Max Speed
    
    
  }

  xBar-=speed;    // Obstacle movement
  
   
  fill(0, 0, 0);
  rect( xBar+10+adjust, yOpen, 50, 100);    //opening 
  
    if((xBar+10+adjust)<xPos)        // Check if the mouse has crossed the bar
    {
      passed=true;
    }
    else{
      passed=false;
    }
    
//    print(passed);
    
    if( !passed){    // if not passed
      if ((mouseY+25>yOpen+75  || mouseY-25<yOpen-25) && xBar<xPos ) //collision_check 
      {
          background(255,0,0);
          deaths++;
          if (deaths==11){
            endgame();
          }
      }
    }
   
  fill(0, 0, boxColor);
  rect(xPos, yPos, 50, 50);    //Player Box
  
  float sinOfTime = sin(millis()*0.007);    // Score
  float sinMapped = map(sinOfTime,-1,1,20,30);
  fill(255);
  textFont(myfont,30);
  text("Score",width-100,50);
  textFont(myfont,sinMapped);
  textAlign(CENTER,CENTER);
  text(score,width-100,90);
  
  fill(255,0,0);
  textFont(myfont,30);
  text("Deaths",width-100,height -100, 50);
  text(deaths,width-100,height -50, 50);
  }
  
}

void endgame(){
  
  fill(255,255,0);
//  rect(0,0,width,height);
  textFont(myfont,30);
  text("Game Over !",width/2,height/2, 50);
  println("gameover");
  test=1;
  
  
  
   
//  while(infinite){
//  
//  
//  }
}



//variables for levels with time limits
int timer;
int startTime;
int timeLimit=35;
//changes when re-read instructions is clicked
boolean instructionsOn=false; 
//array for mouse positions, for black slug effect, and position of robot (xpos[0],ypos[0])
int[] xpos=new int[40];
int[] ypos=new int[40];
//text displayed when failed level in specific ways
String deadText="";
//determines wether teleport mats chnge color or not
int teleport1Color=0;
int teleport2Color=0;
int teleport3Color=0;
int teleport4Color=0;
int deathCount=0;
//which level of the game the player is on
int stage=1;
//wheather you are alive in a level, or not
int deadAlive=0;
//where the robot stops when you go into the yellow corridor without it following
int redCircleStopX=0;
int redCircleStopY=0;
//whether the robot is appearing on screen or not
int redVisible=0;

//third level map (original)
void mapThree(){ 
  //black barriers
  fill(0);
    rect(0,20,780,20);
    rect(0,120,680,20);
    rect(760,40,20,600);
    rect(660,140,20,80);
    rect(600,260,180,20);
    rect(600,180,20,140);
    rect(540,140,20,240);
    rect(540,360,140,20);
    rect(660,320,20,40);
    rect(660,340,20,200);
    rect(360,620,420,20);
    rect(560,580,20,60);
    rect(460,480,200,20);
    rect(460,400,20,140);
    rect(360,440,20,200);
    rect(360,380,120,20);
    rect(300,440,60,20);
    rect(300,320,20,120);
    rect(320,320,40,20);
    rect(400,260,20,120);
    rect(240,260,160,20);
    rect(240,140,20,380);
    rect(260,500,60,20);
    rect(140,620,220,20);
    rect(240,520,80,20);
    rect(140,220,20,400);
    rect(0,220,140,20);
  //blue corridors
  noStroke();
  fill(0,0,255);
    rect(0,40,760,80);
    rect(680,360,80,260);
    rect(580,580,100,40);
    rect(380,580,180,40);
    rect(380,540,300,40);
    rect(480,500,180,40);
    rect(160,140,80,480);
    rect(0,140,160,80);
    rect(680,120,80,20);
    rect(380,520,80,20);
   //teleportation mats  
   if(teleport1Color==0){
     fill(225,142,3);
   }
   if(teleport1Color==1){
     fill(73,242,250);
   }
         rect(680,140,80,80);
   if(teleport2Color==0){
      fill(225,142,3);
   }
   if(teleport2Color==1){
      fill(73,242,250);
   }
          rect(680,280,80,80);
   if(teleport3Color==0){
      fill(225,142,3);
   }
   if(teleport3Color==1){
      fill(73,242,250);
   }
          rect(380,440,80,80);
   if(teleport4Color==0){
      fill(225,142,3);
   }
   if(teleport4Color==1){
      fill(73,242,250);
   }
          rect(240,540,80,80);
  //yellow corridors
  fill(255,255,0);
      rect(620,220,140,40);
      rect(620,140,40,80);
      rect(560,140,60,40);
      rect(560,180,40,180);
      rect(600,320,60,40);
      rect(620,280,60,40);
      rect(320,340,40,100);
      rect(260,280,40,220);
      rect(360,400,100,40);
      rect(360,280,40,100);
      rect(300,280,60,40);
      rect(300,460,60,40);
      rect(320,500,40,120);
   //Clock 
  timer=(millis()-startTime)/1000;
  textSize(20);
  if((timeLimit-timer)>0){
    fill(0);
    text(timeLimit-timer,40,280);
  }
  else if((timeLimit-timer)==0){
    fill(255,0,0);
    textSize(20);
    text(0,40,280);

  }
}
//first map of tutorial (strait corridor no robot)
void map1(){
   fill(0);
      rect(0,20,800,20);
      rect(0,120,800,20);
   fill(0,0,255);
      rect(0,40,800,80);
}
//function that shows opening instructions when re-read instructions is clicked
void instructions(){
  deadAlive=0; 
  background(255,0,0);
  textSize(25);
  fill(225,142,3);
  noStroke();
  //square that you start each level from
  rect(0,40,80,80);
  cursor(CROSS);
  textSize(35);
  fill(0);
  text("To Start: Press mouse over the centre of the orange square and immidiatley start moving right along the corridor. The robot will follow you strait away.",100,400,600,200);
  //clicking in the orange box starts a level
  if((mousePressed)&&((mouseX>0)&&(mouseX<80)&&(mouseY>40)&&(mouseY<120))){
      deadAlive=1;
      //resets timer
      startTime=millis();
  
  }
}

//map3 coordinates
//these squares are now the blue squares
int[][] redCoordinates={
  {20,40,740,80},{680,360,80,260},{580,580,100,40},{380,580,180,40},{380,540,300,40},{480,500,180,40},{160,140,80,480},{20,140,140,80},{680,120,80,20},{380,520,80,20}
};
int [][] yellowCoordinates={
  {620,220,140,40},{620,140,40,80},{560,140,60,40},{560,180,40,180},{600,320,60,40},{620,280,60,40},{320,340,40,100},{260,280,40,220},{360,400,100,40},{360,280,40,100},{300,280,60,40},{300,460,60,40},{320,500,40,120}
};
int [][] barrierCoordinates={
//Horizonatls:
{20,780,40,0},{120,680,140,0},{220,140,240,0},{260,420,280,240},{260,760,280,620},{320,360,340,300},{360,660,380,540},{380,440,400,360},{440,340,460,300},{480,660,500,480},{500,300,540,240},{620,760,640,160}
//Verticals:
,{220,160,640,140},{120,260,540,240},{320,320,440,300},{440,380,640,360},{260,440,380,420},/* maybe -> */{400,480,540,460},{120,560,380,540},{580,580,640,560},{180,620,320,600},{120,680,220,660},{320,680,540,660},{20,780,640,760}
};

//these are for map1
int[][] blueCoordinates1={
  {40,800,120,0}
};



void mousePressed(){
  //clears the array holding mouse positions, so it is fresh whenever you start a new area of the map, either being followed nor not
  for (int i=0; i<xpos.length-1; i++){
          xpos[i]=0;
          ypos[i]=0;
  }
}
//when you release mouse, the robot stays where you released it
void mouseReleased(){
  redCircleStopX=mouseX;
  redCircleStopY=mouseY;
  
}

  

void setup(){
  startTime=millis();
  size(800,660);  
  background(255);
  smooth();
  textSize(25);
  //initializing array of mouse positions as all equalling 0
  for(int i=0;i<xpos.length;i++){
     xpos[i]=0;
     ypos[i]=0;
   }
}

void draw(){
  //showing the instructions for the game  
    if(instructionsOn){
         deadText="";
         background(255,0,0);
         textSize(25);
         fill(255,0,0);
         rect(0,0,800,680);
         fill(225,142,3);
         noStroke();
         //box you start the level from
         rect(0,40,80,80);
         cursor(CROSS);
         fill(255);
         text(deadText,100,100,600,600);
         textSize(25);
         fill(0);
         text("To Start: Press mouse over the centre of the orange square and immidiatley start moving right along the corridor. The robot will follow you strait away.",100,400,600,200);
         //if you click inside the orange box then you begin playing a level
         if((mousePressed)&&((mouseX>0)&&(mouseX<80)&&(mouseY>40)&&(mouseY<120))){
           deadAlive=1;
           //no longer viewing instructions
           instructionsOn=false;
           //timer resets
           startTime=millis();
         }
         textSize(15);
         fill(255);
         //Explanation and instructions on how to play
         text("You, an alien slug from the future, have just been hired by scientists who work with explosive robots. Your job is to transport these exlosive robots through the lab corridors safely. You must guide the robot (currently a red circle) through the lab without it hitting you, or the walls, and blowing up. The scientits have programmed each robot to follow your moves exactly when you hold down your mouse button, but 1 second behind, so if you move too slowly, it will catch you up, which will get you killed. Also, if you move too close to the walls, it will hit them, and be destroyed, which will get you fired. Also, teleportation is a thing. There are certain bits of the corridors which are too narrow for the robots to follow you through. So the scientits have made a teleportation mat for the robot to use at each end of the narrow corridors. To use the mats, you have to guide the robot onto the first mat, stop clicking your mouse button so it stays there, then go through the corridor, stand on the second mat, and click again to activate the teleportation mats.",100,40,600,600);
    }
    else{
  
  ////////Level 1
  if(stage==1){
    
    //if you are not in the middle of a level, the array of mouse positions becomes 0, so it is empty when you start a new level
    if((deadAlive==0)||(deadAlive==3)){
      for(int i=0;i<xpos.length;i++){
         xpos[i]=0;
         ypos[i]=0;
      }
    }
    //if you failed a level,( or are yet to play one)
    if(deadAlive==0){
      background(255,0,0);
      textSize(25);
      fill(225,142,3);
      noStroke();
      rect(0,40,80,80);
      cursor(CROSS);
      fill(255);
      //message that explains why you died, or isnt there if you havent played it yet
      text(deadText,100,100,600,600);
      //if this is not the first time playing the game, and instructions aren't already open
      if((deathCount!=0)&&(!instructionsOn)){
        textSize(20);
        text("Click here to re-read the instructions",100,300,600,100);
        noFill();
        stroke(5);
        rect(95,295,365,32);
        fill(255);
        noStroke();
        textSize(35);
          //click on button to open instructions
          if((mousePressed)&&((mouseX>95)&&(mouseX<460)&&(mouseY>295)&&(mouseY<327))){
              instructionsOn=true;
          }
       }
      //if this IS first time playing the game OR instructions are open (wont show option to re-open instructions because they will already be visble)
      else{
        textSize(25);
      }
      fill(0);
      text("To Start: Press mouse over the centre of the orange square and immidiatley start moving right along the corridor. The robot will follow you strait away.",100,400,600,200);
      //if you click in orange box, level will start
      if((mousePressed)&&(mouseX>0)&&(mouseX<80)&&(mouseY>40)&&(mouseY<120)){
        deadAlive=1;
        //timer restarts
        startTime=millis();
      }
      //if this is your first time playing
      if (deathCount==0){
        textSize(15);
        fill(255);
        //instructions on how to play the game
        text("You, an alien slug from the future, have just been hired by scientists who work with explosive robots. Your job is to transport these exlosive robots through the lab corridors safely. You must guide the robot (currently a red circle) through the lab without it hitting you, or the walls, and blowing up. The scientits have programmed each robot to follow your moves exactly when you hold down your mouse button, but 1 second behind, so if you move too slowly, it will catch you up, which will get you killed. Also, if you move too close to the walls, it will hit them, and be destroyed, which will get you fired. Also, teleportation is a thing. There are certain bits of the corridors which are too narrow for the robots to follow you through. So the scientits have made a teleportation mat for the robot to use at each end of the narrow corridors. To use the mats, you have to guide the robot onto the first mat, stop clicking your mouse button so it stays there, then go through the corridor, stand on the second mat, and click again to activate the teleportation mats.",100,40,600,600);
        //when clicked inside the orange box, the level will start
        if((mousePressed)&&((mouseX>0)&&(mouseX<80)&&(mouseY>40)&&(mouseY<120))){
          deathCount=1;
          //the timer resets
          startTime=millis();
        }
      } 
    }
    //if you reach the end of the level
    if((mouseX<800)&&(mouseX>720)&&(mouseY>40)&&(mouseY<120)&&(mousePressed)){
      deadAlive=3;
    }
    //if you have won the level
    if (deadAlive==3){
      background(0,255,0);
      fill(225,142,3);
      noStroke();
      rect(0,40,80,80);
      cursor(CROSS);
      fill(255);
      textSize(20);
      //explanation what happens on the next level
      text("Well done. Now try do the same but with a robot following you. It will copy your exact moves and speed, but one second behind you. So don't go too close to the walls- its bigger than you, so if it you go near the wall, when the robot gets there, it will probably hit that wall. Also, don't move too slowly, or the robot will catch you up, hit you, and explode and kill you!",100,40,600,600);
      textSize(35);
      fill(0);
      text("To Start Next Level: Press mouse over the centre of the orange square and immidiatley start moving right along the corridor. The robot will follow you strait away.",100,400,600,200);
      if((mouseY>40)&&(mouseY<120)&&(mouseX>20)&&(mouseX<100)&&(mousePressed)){
        deathCount=1;
        //starts playing a level
        deadAlive=1;
        //resets timer
        startTime=millis();
        //moves you onto next level
        stage=stage+2;//THIS NEEDS TO BE +1 WHEN STAGE 2 IS READY
        background(255);
       }
    }
    //if you are Mid-Level, playing on of the game's levels
    if(deadAlive==1){
      //use the first map
      map1();
      //no robot in the level
      redVisible=0;
     
     //ways to lose->
     
      //you lose because you stopped holding mouse button in blue corridor
      if(((mouseX>blueCoordinates1[0][3])&&(mouseX<(blueCoordinates1[0][1]))&&(mouseY<(blueCoordinates1[0][2]))&&(mouseY>blueCoordinates1[0][0]))&&(!mousePressed)){ 
        deadText="You're fired. You stopped holding your mouse down in the blue corridor, so the robot would stop following you, get confused, and blow itself up.";
        //You are no longer playing the level
        deadAlive=0;  
      }
     //you lose because you touched one of the corridor walls
     if(((mouseY>20)&&(mouseY<40)||(mouseY>120)&&(mouseY<140))&&(mousePressed)){
       //you are no longer playing the level
       deadAlive=0;
       deadText="Don't go near the walls. If you had a robot following you it would have hit it and exploded";
     }
     
     //<-ways to lose
     
     //if you are in blue corridor
     if(mousePressed){
          background(255);
          map1();    
          noCursor();
          //array values of mouse positions shift
          for (int i=0; i<xpos.length-1; i++){
              xpos[i]=xpos[i+1];
              ypos[i]=ypos[i+1];
          }
          //current mouse position is allways joining the array
          xpos[xpos.length-1]=mouseX;
          ypos[ypos.length-1]=mouseY;
          //creates slug effect
          for (int i=0; i<xpos.length; i++){
             noStroke();
             fill(255-i*6);
             ellipse(xpos[i],ypos[i],(i/4)*3,(i/4)*3); 
             //if robot appears on screen
             if (redVisible==1){
               //draws robot being on last mouse position in the array  
               fill(255,0,0);
               ellipse(xpos[0],ypos[0],50,50);
              }
            } 
       }
       //if mouse in yellow corridor
       else {
          background(255);
          map1();
          cursor(CROSS);
          xpos[xpos.length-1]=mouseX;
          ypos[ypos.length-1]=mouseY;
          for (int i=0; i<xpos.length-1; i++){
             //array values of mouse shifts
             xpos[i]=xpos[i+1];
             ypos[i]=ypos[i+1];
             //draws slug from mouse position just before the end of the array value, because that value stays where you left red
             noStroke();
             fill(255-i*6);
             ellipse(xpos[i],ypos[i],(i/4)*3,(i/4)*3);
             //if red is shown on screen, it is draw in the last place it was when it was following you
             if(redVisible==1){
                fill(255,0,0);
                ellipse(redCircleStopX,redCircleStopY,50,50);
             }
           }
       }        
    }    
  }
  //^^^^^^end of level 1
  
  
  //STAGE 2 GOES HERE, NOT READY YET
  
////////Level 3  
else if(stage==3){  
  
    //if the time runs out, you lose the level
    if(((timeLimit-timer)==-1)){
      deadAlive=0;
      deathCount=deathCount+1;
      deadText= "You're fired. You took to long too transport the robot, so the scientists are hiring someone more competant to do your job.";
    }

      //if you are not in the middle of a level, the array of mouse positions becomes 0, so it is empty when you start a new level
    if((deadAlive==0)||(deadAlive==3)){
      for(int i=0;i<xpos.length;i++){
         xpos[i]=0;
         ypos[i]=0;
      }
    }
    //if you failed a level,( or are yet to play one)
    if(deadAlive==0){
      background(255,0,0);
      textSize(25);
      fill(225,142,3);
      noStroke();
      rect(0,40,80,80);
      cursor(CROSS);
      fill(255);
      //message that explains why you died, or isnt there if you havent played it yet
      text(deadText,100,100,600,600);
      //if this is not the first time playing the game, and instructions aren't already open
      if((deathCount!=0)&&(!instructionsOn)){
        textSize(20);
        text("Click here to re-read the instructions",100,300,600,100);
        noFill();
        stroke(5);
        rect(95,295,365,32);
        fill(255);
        noStroke();
        textSize(35);
          //click on button to open instructions
          if((mousePressed)&&((mouseX>95)&&(mouseX<460)&&(mouseY>295)&&(mouseY<327))){
              instructionsOn=true;
          }
      }
     //if this IS first time playing the game OR instructions are open (wont show option to re-open instructions because they will already be visble)
     else{
        textSize(25);
     }
      fill(0);
      text("To Start: Press mouse over the centre of the orange square and immidiatley start moving right along the corridor. The robot will follow you strait away.",100,400,600,200);
      //if you click in orange box, level will start
      if((mousePressed)&&(mouseX>0)&&(mouseX<80)&&(mouseY>40)&&(mouseY<120)){
        deadAlive=1;
        //timer restarts
        startTime=millis();
      }
      
    }
    //if you are mid level (or have won a level?)(may want to change from else to else if
    else {
      //if the robot is in exactly the same position as you(e.g. the start of the level) the robot is not shown till they are unequal
      if((xpos[0]==0)&&(ypos[0]==0)){
        redVisible=0;
      }
      //if the robot and mouse position are in different places then we Do see the robot
      else{
        redVisible=1;
       }
       //if you reach the end of the level
      if((mouseX<80)&&(mouseX>0)&&(mouseY>160)&&(mouseY<240)&&(mousePressed)){
        deadAlive=3;
      }
      
//if you have won the level
    if (deadAlive==3){
      background(0,255,0);
      fill(225,142,3);
      noStroke();
      rect(0,40,80,80);
      cursor(CROSS);
      fill(255);
      //congrats+what happens next level
      text("Well done. You didn't die, and you kept your job. It took you "+deathCount+" attempts.",100,100,600,600);
      textSize(35);
      fill(0);
      //CHANGE TO "TO START NEXT LEVEL ONCE THERE IS ONE MADE
      text("To Restart Level: Press mouse over the centre of the orange square and immidiatley start moving right along the corridor. The robot will follow you strait away.",100,400,600,200);
      if((mouseY>40)&&(mouseY<120)&&(mouseX>20)&&(mouseX<100)&&(mousePressed)){
        deathCount=1;
        //starts playing a level
        deadAlive=1;
        //resets timer
        startTime=millis();
        //moves you onto next level
       // stage=stage+1;   UNCOMMENT THIS WHEN THERE IS A NEW LEVEL
        background(255);
       }
    }
    //if you are Mid-Level, playing one of the game's levels
    if(deadAlive==1){
      //use the third map
      mapThree();
      //if you are in first square of the level, you are safe
      if((mouseY>40)&&(mouseY<120)&&(mouseX>20)&&(mouseX<100)&&(mousePressed)){
        deadAlive=1;
        background(255);
      }
      
      //ways to lose->
      
        if((
        mousePressed)&&
          ((
          //to make more diffilut change to 20 from 15 (i should make a variable)
          //you lost because the robot hit one of the walls
          (xpos[0]<(barrierCoordinates[0][1]+15))&&(xpos[0]>(barrierCoordinates[0][3]-15))&&(ypos[0]>(barrierCoordinates[0][0]-15))&&(ypos[0]<(barrierCoordinates[0][2]+15)))||
          (xpos[0]<(barrierCoordinates[1][1]+15))&&(xpos[0]>(barrierCoordinates[1][3]-15))&&(ypos[0]>(barrierCoordinates[1][0]-15))&&(ypos[0]<(barrierCoordinates[1][2]+15))||
          (xpos[0]<(barrierCoordinates[2][1]+15))&&(xpos[0]>(barrierCoordinates[2][3]-15))&&(ypos[0]>(barrierCoordinates[2][0]-15))&&(ypos[0]<(barrierCoordinates[2][2]+15))||
          (xpos[0]<(barrierCoordinates[3][1]+15))&&(xpos[0]>(barrierCoordinates[3][3]-15))&&(ypos[0]>(barrierCoordinates[3][0]-15))&&(ypos[0]<(barrierCoordinates[3][2]+15))||
          (xpos[0]<(barrierCoordinates[4][1]+15))&&(xpos[0]>(barrierCoordinates[4][3]-15))&&(ypos[0]>(barrierCoordinates[4][0]-15))&&(ypos[0]<(barrierCoordinates[4][2]+15))||
          (xpos[0]<(barrierCoordinates[5][1]+15))&&(xpos[0]>(barrierCoordinates[5][3]-15))&&(ypos[0]>(barrierCoordinates[5][0]-15))&&(ypos[0]<(barrierCoordinates[5][2]+15))||
          (xpos[0]<(barrierCoordinates[6][1]+15))&&(xpos[0]>(barrierCoordinates[6][3]-15))&&(ypos[0]>(barrierCoordinates[6][0]-15))&&(ypos[0]<(barrierCoordinates[6][2]+15))||
          (xpos[0]<(barrierCoordinates[7][1]+15))&&(xpos[0]>(barrierCoordinates[7][3]-15))&&(ypos[0]>(barrierCoordinates[7][0]-15))&&(ypos[0]<(barrierCoordinates[7][2]+15))||
          (xpos[0]<(barrierCoordinates[8][1]+15))&&(xpos[0]>(barrierCoordinates[8][3]-15))&&(ypos[0]>(barrierCoordinates[8][0]-15))&&(ypos[0]<(barrierCoordinates[8][2]+15))||
          (xpos[0]<(barrierCoordinates[9][1]+15))&&(xpos[0]>(barrierCoordinates[9][3]-15))&&(ypos[0]>(barrierCoordinates[9][0]-15))&&(ypos[0]<(barrierCoordinates[9][2]+15))||
          (xpos[0]<(barrierCoordinates[10][1]+15))&&(xpos[0]>(barrierCoordinates[10][3]-15))&&(ypos[0]>(barrierCoordinates[10][0]-15))&&(ypos[0]<(barrierCoordinates[10][2]+15))||
          (xpos[0]<(barrierCoordinates[11][1]+15))&&(xpos[0]>(barrierCoordinates[11][3]-15))&&(ypos[0]>(barrierCoordinates[11][0]-15))&&(ypos[0]<(barrierCoordinates[11][2]+15))||
          (xpos[0]<(barrierCoordinates[12][1]+15))&&(xpos[0]>(barrierCoordinates[12][3]-15))&&(ypos[0]>(barrierCoordinates[12][0]-15))&&(ypos[0]<(barrierCoordinates[12][2]+15))||
          (xpos[0]<(barrierCoordinates[13][1]+15))&&(xpos[0]>(barrierCoordinates[13][3]-15))&&(ypos[0]>(barrierCoordinates[13][0]-15))&&(ypos[0]<(barrierCoordinates[13][2]+15))||
          (xpos[0]<(barrierCoordinates[14][1]+15))&&(xpos[0]>(barrierCoordinates[14][3]-15))&&(ypos[0]>(barrierCoordinates[14][0]-15))&&(ypos[0]<(barrierCoordinates[14][2]+15))||
          (xpos[0]<(barrierCoordinates[15][1]+15))&&(xpos[0]>(barrierCoordinates[15][3]-15))&&(ypos[0]>(barrierCoordinates[15][0]-15))&&(ypos[0]<(barrierCoordinates[15][2]+15))||
          (xpos[0]<(barrierCoordinates[16][1]+15))&&(xpos[0]>(barrierCoordinates[16][3]-15))&&(ypos[0]>(barrierCoordinates[16][0]-15))&&(ypos[0]<(barrierCoordinates[16][2]+15))||
          (xpos[0]<(barrierCoordinates[17][1]+15))&&(xpos[0]>(barrierCoordinates[17][3]-15))&&(ypos[0]>(barrierCoordinates[17][0]-15))&&(ypos[0]<(barrierCoordinates[17][2]+15))||
          (xpos[0]<(barrierCoordinates[18][1]+15))&&(xpos[0]>(barrierCoordinates[18][3]-15))&&(ypos[0]>(barrierCoordinates[18][0]-15))&&(ypos[0]<(barrierCoordinates[18][2]+15))||
          (xpos[0]<(barrierCoordinates[19][1]+15))&&(xpos[0]>(barrierCoordinates[19][3]-15))&&(ypos[0]>(barrierCoordinates[19][0]-15))&&(ypos[0]<(barrierCoordinates[19][2]+15))||
          (xpos[0]<(barrierCoordinates[20][1]+15))&&(xpos[0]>(barrierCoordinates[20][3]-15))&&(ypos[0]>(barrierCoordinates[20][0]-15))&&(ypos[0]<(barrierCoordinates[20][2]+15))||
          (xpos[0]<(barrierCoordinates[21][1]+15))&&(xpos[0]>(barrierCoordinates[21][3]-15))&&(ypos[0]>(barrierCoordinates[21][0]-15))&&(ypos[0]<(barrierCoordinates[21][2]+15))||
          (xpos[0]<(barrierCoordinates[22][1]+15))&&(xpos[0]>(barrierCoordinates[22][3]-15))&&(ypos[0]>(barrierCoordinates[22][0]-15))&&(ypos[0]<(barrierCoordinates[22][2]+15))||
          (xpos[0]<(barrierCoordinates[23][1]+15))&&(xpos[0]>(barrierCoordinates[23][3]-15))&&(ypos[0]>(barrierCoordinates[23][0]-15))&&(ypos[0]<(barrierCoordinates[23][2]+15))
          )){
            deadAlive=0;
            deathCount=deathCount+1;
            deadText= "You're fired. You blew up the expensive robot because you moved too close to a wall.It followed you and hit it. Idiot. Next time try not to get too close to the walls when the robot is following you.";
          }
          //if the robot touches you...
          //change to 40 to make it more difficult (make a variable)
          if(((sqrt((sq(xpos[0]-mouseX))+(sq(ypos[0]-mouseY))))<=30)){
              //...and you are in a blue corridor, you die
              if((((mouseX>redCoordinates[0][0])&&(mouseX<((redCoordinates[0][0])+(redCoordinates[0][2])))&&(mouseY<((redCoordinates[0][1])+(redCoordinates[0][3])))&&(mouseY>redCoordinates[0][1]))
              ||((mouseX>redCoordinates[1][0])&&(mouseX<((redCoordinates[1][0])+(redCoordinates[1][2])))&&(mouseY<((redCoordinates[1][1])+(redCoordinates[1][3])))&&(mouseY>redCoordinates[1][1]))
              ||((mouseX>redCoordinates[2][0])&&(mouseX<((redCoordinates[2][0])+(redCoordinates[2][2])))&&(mouseY<((redCoordinates[2][1])+(redCoordinates[2][3])))&&(mouseY>redCoordinates[2][1]))
              ||((mouseX>redCoordinates[3][0])&&(mouseX<((redCoordinates[3][0])+(redCoordinates[3][2])))&&(mouseY<((redCoordinates[3][1])+(redCoordinates[3][3])))&&(mouseY>redCoordinates[3][1]))
              ||((mouseX>redCoordinates[4][0])&&(mouseX<((redCoordinates[4][0])+(redCoordinates[4][2])))&&(mouseY<((redCoordinates[4][1])+(redCoordinates[4][3])))&&(mouseY>redCoordinates[4][1]))
              ||((mouseX>redCoordinates[5][0])&&(mouseX<((redCoordinates[5][0])+(redCoordinates[5][2])))&&(mouseY<((redCoordinates[5][1])+(redCoordinates[5][3])))&&(mouseY>redCoordinates[5][1]))
              ||((mouseX>redCoordinates[6][0])&&(mouseX<((redCoordinates[6][0])+(redCoordinates[6][2])))&&(mouseY<((redCoordinates[6][1])+(redCoordinates[6][3])))&&(mouseY>redCoordinates[6][1]))
              ||((mouseX>redCoordinates[7][0])&&(mouseX<((redCoordinates[7][0])+(redCoordinates[7][2])))&&(mouseY<((redCoordinates[7][1])+(redCoordinates[7][3])))&&(mouseY>redCoordinates[7][1]))
              ||((mouseX>redCoordinates[8][0])&&(mouseX<((redCoordinates[8][0])+(redCoordinates[8][2])))&&(mouseY<((redCoordinates[8][1])+(redCoordinates[8][3])))&&(mouseY>redCoordinates[8][1]))
              ||((mouseX>redCoordinates[9][0])&&(mouseX<((redCoordinates[9][0])+(redCoordinates[9][2])))&&(mouseY<((redCoordinates[9][1])+(redCoordinates[9][3])))&&(mouseY>redCoordinates[9][1]))
              )){
                deadAlive=0;
                deathCount=deathCount+1;
                deadText= "You're dead. The robot hit you and exploded because you moved TOO SLOW. Next time move quickly when the robot is following you. Remember it won't explode if it hits you on an orange teleportation mat.";
              }

            }
    //you die becaue you hit the wall in a yellow corridor
    if((!mousePressed)&&(((mouseY>barrierCoordinates[0][0])&&(mouseY<barrierCoordinates[0][2])&&(mouseX<barrierCoordinates[0][1])&&(mouseX>barrierCoordinates[0][3]))||
      ((mouseY>barrierCoordinates[1][0])&&(mouseY<barrierCoordinates[1][2])&&(mouseX<barrierCoordinates[1][1])&&(mouseX>barrierCoordinates[1][3]))||
      ((mouseY>barrierCoordinates[2][0])&&(mouseY<barrierCoordinates[2][2])&&(mouseX<barrierCoordinates[2][1])&&(mouseX>barrierCoordinates[2][3]))||
      ((mouseY>barrierCoordinates[3][0])&&(mouseY<barrierCoordinates[3][2])&&(mouseX<barrierCoordinates[3][1])&&(mouseX>barrierCoordinates[3][3]))||
      ((mouseY>barrierCoordinates[4][0])&&(mouseY<barrierCoordinates[4][2])&&(mouseX<barrierCoordinates[4][1])&&(mouseX>barrierCoordinates[4][3]))||
      ((mouseY>barrierCoordinates[5][0])&&(mouseY<barrierCoordinates[5][2])&&(mouseX<barrierCoordinates[5][1])&&(mouseX>barrierCoordinates[5][3]))||
      ((mouseY>barrierCoordinates[6][0])&&(mouseY<barrierCoordinates[6][2])&&(mouseX<barrierCoordinates[6][1])&&(mouseX>barrierCoordinates[6][3]))||
      ((mouseY>barrierCoordinates[7][0])&&(mouseY<barrierCoordinates[7][2])&&(mouseX<barrierCoordinates[7][1])&&(mouseX>barrierCoordinates[7][3]))||
      ((mouseY>barrierCoordinates[8][0])&&(mouseY<barrierCoordinates[8][2])&&(mouseX<barrierCoordinates[8][1])&&(mouseX>barrierCoordinates[8][3]))||
      ((mouseY>barrierCoordinates[9][0])&&(mouseY<barrierCoordinates[9][2])&&(mouseX<barrierCoordinates[9][1])&&(mouseX>barrierCoordinates[9][3]))||
      ((mouseY>barrierCoordinates[10][0])&&(mouseY<barrierCoordinates[10][2])&&(mouseX<barrierCoordinates[10][1])&&(mouseX>barrierCoordinates[10][3]))||
      ((mouseY>barrierCoordinates[11][0])&&(mouseY<barrierCoordinates[11][2])&&(mouseX<barrierCoordinates[11][1])&&(mouseX>barrierCoordinates[11][3]))
      //vertical barriers
      ||
      ((mouseY>barrierCoordinates[12][0])&&(mouseY<barrierCoordinates[12][2])&&(mouseX<barrierCoordinates[12][1])&&(mouseX>barrierCoordinates[12][3]))||
      ((mouseY>barrierCoordinates[13][0])&&(mouseY<barrierCoordinates[13][2])&&(mouseX<barrierCoordinates[13][1])&&(mouseX>barrierCoordinates[13][3]))||
      ((mouseY>barrierCoordinates[14][0])&&(mouseY<barrierCoordinates[14][2])&&(mouseX<barrierCoordinates[14][1])&&(mouseX>barrierCoordinates[14][3]))||
      ((mouseY>barrierCoordinates[15][0])&&(mouseY<barrierCoordinates[15][2])&&(mouseX<barrierCoordinates[15][1])&&(mouseX>barrierCoordinates[15][3]))||
      ((mouseY>barrierCoordinates[16][0])&&(mouseY<barrierCoordinates[16][2])&&(mouseX<barrierCoordinates[16][1])&&(mouseX>barrierCoordinates[16][3]))||
      ((mouseY>barrierCoordinates[17][0])&&(mouseY<barrierCoordinates[17][2])&&(mouseX<barrierCoordinates[17][1])&&(mouseX>barrierCoordinates[17][3]))||
      ((mouseY>barrierCoordinates[18][0])&&(mouseY<barrierCoordinates[18][2])&&(mouseX<barrierCoordinates[18][1])&&(mouseX>barrierCoordinates[18][3]))||
      ((mouseY>barrierCoordinates[19][0])&&(mouseY<barrierCoordinates[19][2])&&(mouseX<barrierCoordinates[19][1])&&(mouseX>barrierCoordinates[19][3]))||
      ((mouseY>barrierCoordinates[20][0])&&(mouseY<barrierCoordinates[20][2])&&(mouseX<barrierCoordinates[20][1])&&(mouseX>barrierCoordinates[20][3]))||
      ((mouseY>barrierCoordinates[21][0])&&(mouseY<barrierCoordinates[21][2])&&(mouseX<barrierCoordinates[21][1])&&(mouseX>barrierCoordinates[21][3]))||
      ((mouseY>barrierCoordinates[22][0])&&(mouseY<barrierCoordinates[22][2])&&(mouseX<barrierCoordinates[22][1])&&(mouseX>barrierCoordinates[22][3]))||
      ((mouseY>barrierCoordinates[23][0])&&(mouseY<barrierCoordinates[23][2])&&(mouseX<barrierCoordinates[23][1])&&(mouseX>barrierCoordinates[23][3])))){
        deadAlive=0;
        deathCount=deathCount+1;
        deadText="You Died. You hit the walls of the yellow Corridor. For some reason (there is no explanation for this yet) this has killed you.";
      }
      //you lose because you pressed your mouse button in a yellow corridor
      if((((mouseX>yellowCoordinates[0][0])&&(mouseX<((yellowCoordinates[0][0])+(yellowCoordinates[0][2])))&&(mouseY<((yellowCoordinates[0][1])+(yellowCoordinates[0][3])))&&(mouseY>yellowCoordinates[0][1]))
      ||((mouseX>yellowCoordinates[1][0])&&(mouseX<((yellowCoordinates[1][0])+(yellowCoordinates[1][2])))&&(mouseY<((yellowCoordinates[1][1])+(yellowCoordinates[1][3])))&&(mouseY>yellowCoordinates[1][1]))
      ||((mouseX>yellowCoordinates[2][0])&&(mouseX<((yellowCoordinates[2][0])+(yellowCoordinates[2][2])))&&(mouseY<((yellowCoordinates[2][1])+(yellowCoordinates[2][3])))&&(mouseY>yellowCoordinates[2][1]))
      ||((mouseX>yellowCoordinates[3][0])&&(mouseX<((yellowCoordinates[3][0])+(yellowCoordinates[3][2])))&&(mouseY<((yellowCoordinates[3][1])+(yellowCoordinates[3][3])))&&(mouseY>yellowCoordinates[3][1]))
      ||((mouseX>yellowCoordinates[4][0])&&(mouseX<((yellowCoordinates[4][0])+(yellowCoordinates[4][2])))&&(mouseY<((yellowCoordinates[4][1])+(yellowCoordinates[4][3])))&&(mouseY>yellowCoordinates[4][1]))
      ||((mouseX>yellowCoordinates[5][0])&&(mouseX<((yellowCoordinates[5][0])+(yellowCoordinates[5][2])))&&(mouseY<((yellowCoordinates[5][1])+(yellowCoordinates[5][3])))&&(mouseY>yellowCoordinates[5][1]))
      ||((mouseX>yellowCoordinates[6][0])&&(mouseX<((yellowCoordinates[6][0])+(yellowCoordinates[6][2])))&&(mouseY<((yellowCoordinates[6][1])+(yellowCoordinates[6][3])))&&(mouseY>yellowCoordinates[6][1]))
      ||((mouseX>yellowCoordinates[7][0])&&(mouseX<((yellowCoordinates[7][0])+(yellowCoordinates[7][2])))&&(mouseY<((yellowCoordinates[7][1])+(yellowCoordinates[7][3])))&&(mouseY>yellowCoordinates[7][1]))
      ||((mouseX>yellowCoordinates[8][0])&&(mouseX<((yellowCoordinates[8][0])+(yellowCoordinates[8][2])))&&(mouseY<((yellowCoordinates[8][1])+(yellowCoordinates[8][3])))&&(mouseY>yellowCoordinates[8][1]))
      ||((mouseX>yellowCoordinates[9][0])&&(mouseX<((yellowCoordinates[9][0])+(yellowCoordinates[9][2])))&&(mouseY<((yellowCoordinates[9][1])+(yellowCoordinates[9][3])))&&(mouseY>yellowCoordinates[9][1]))
      ||((mouseX>yellowCoordinates[10][0])&&(mouseX<((yellowCoordinates[10][0])+(yellowCoordinates[10][2])))&&(mouseY<((yellowCoordinates[10][1])+(yellowCoordinates[10][3])))&&(mouseY>yellowCoordinates[10][1]))
      ||((mouseX>yellowCoordinates[11][0])&&(mouseX<((yellowCoordinates[11][0])+(yellowCoordinates[11][2])))&&(mouseY<((yellowCoordinates[11][1])+(yellowCoordinates[11][3])))&&(mouseY>yellowCoordinates[11][1]))
      ||((mouseX>yellowCoordinates[12][0])&&(mouseX<((yellowCoordinates[12][0])+(yellowCoordinates[12][2])))&&(mouseY<((yellowCoordinates[12][1])+(yellowCoordinates[12][3])))&&(mouseY>yellowCoordinates[12][1])))&&(mousePressed)){
        deadAlive=0;
        deathCount=deathCount+1;
        deadText="You're fired. You clicked while in the narrow thin corridor, the robot tried to follow you into a space where it couldn't fit. So it blew up. Next time leave it on the orange teleport mat.";
      }
      //you lose because your mouse wasn't pressed in a blue corridor
      if((((mouseX>redCoordinates[0][0])&&(mouseX<((redCoordinates[0][0])+(redCoordinates[0][2])))&&(mouseY<((redCoordinates[0][1])+(redCoordinates[0][3])))&&(mouseY>redCoordinates[0][1]))
      ||((mouseX>redCoordinates[1][0])&&(mouseX<((redCoordinates[1][0])+(redCoordinates[1][2])))&&(mouseY<((redCoordinates[1][1])+(redCoordinates[1][3])))&&(mouseY>redCoordinates[1][1]))
      ||((mouseX>redCoordinates[2][0])&&(mouseX<((redCoordinates[2][0])+(redCoordinates[2][2])))&&(mouseY<((redCoordinates[2][1])+(redCoordinates[2][3])))&&(mouseY>redCoordinates[2][1]))
      ||((mouseX>redCoordinates[3][0])&&(mouseX<((redCoordinates[3][0])+(redCoordinates[3][2])))&&(mouseY<((redCoordinates[3][1])+(redCoordinates[3][3])))&&(mouseY>redCoordinates[3][1]))
      ||((mouseX>redCoordinates[4][0])&&(mouseX<((redCoordinates[4][0])+(redCoordinates[4][2])))&&(mouseY<((redCoordinates[4][1])+(redCoordinates[4][3])))&&(mouseY>redCoordinates[4][1]))
      ||((mouseX>redCoordinates[5][0])&&(mouseX<((redCoordinates[5][0])+(redCoordinates[5][2])))&&(mouseY<((redCoordinates[5][1])+(redCoordinates[5][3])))&&(mouseY>redCoordinates[5][1]))
      ||((mouseX>redCoordinates[6][0])&&(mouseX<((redCoordinates[6][0])+(redCoordinates[6][2])))&&(mouseY<((redCoordinates[6][1])+(redCoordinates[6][3])))&&(mouseY>redCoordinates[6][1]))
      ||((mouseX>redCoordinates[7][0])&&(mouseX<((redCoordinates[7][0])+(redCoordinates[7][2])))&&(mouseY<((redCoordinates[7][1])+(redCoordinates[7][3])))&&(mouseY>redCoordinates[7][1]))
      ||((mouseX>redCoordinates[8][0])&&(mouseX<((redCoordinates[8][0])+(redCoordinates[8][2])))&&(mouseY<((redCoordinates[8][1])+(redCoordinates[8][3])))&&(mouseY>redCoordinates[8][1]))
      ||((mouseX>redCoordinates[9][0])&&(mouseX<((redCoordinates[9][0])+(redCoordinates[9][2])))&&(mouseY<((redCoordinates[9][1])+(redCoordinates[9][3])))&&(mouseY>redCoordinates[9][1]))
      )&&(!mousePressed)){
        deadAlive=0;
         deathCount=deathCount+1;
        deadText="You're fired. You stopped holding your mouse down in the blue corridor, so the robot stopped following you, got confused, and blew itself up. Next time, hold down your mouse button till you reach the orange teleportation mat.";
      }
  
    

       mapThree();
         if(
         ((xpos[0]>680)&&(xpos[0]<760)&&(ypos[0]>140)&&(ypos[0]<220))||
         ((xpos[0]>680)&&(xpos[0]<760)&&(ypos[0]>280)&&(ypos[0]<360))||
         ((xpos[0]>380)&&(xpos[0]<460)&&(ypos[0]>440)&&(ypos[0]<520))||
         ((xpos[0]>240)&&(xpos[0]<520)&&(ypos[0]>540)&&(ypos[0]<620))
         ){
           if((xpos[0]>680)&&(xpos[0]<760)&&(ypos[0]>140)&&(ypos[0]<220)){
             teleport1Color=1;
           }
           if(((xpos[0]>680)&&(xpos[0]<760)&&(ypos[0]>280)&&(ypos[0]<360))&&(mousePressed)){
             teleport2Color=1;
           }
           if((xpos[0]>380)&&(xpos[0]<460)&&(ypos[0]>440)&&(ypos[0]<520)){
             teleport3Color=1;
           }
           if(((xpos[0]>240)&&(xpos[0]<320)&&(ypos[0]>540)&&(ypos[0]<620))&&(mousePressed)){
             teleport4Color=1;
           }
           
         }
         else if((((mouseX>redCoordinates[0][0])&&(mouseX<((redCoordinates[0][0])+(redCoordinates[0][2])))&&(mouseY<((redCoordinates[0][1])+(redCoordinates[0][3])))&&(mouseY>redCoordinates[0][1]))
||((mouseX>redCoordinates[1][0])&&(mouseX<((redCoordinates[1][0])+(redCoordinates[1][2])))&&(mouseY<((redCoordinates[1][1])+(redCoordinates[1][3])))&&(mouseY>redCoordinates[1][1]))
||((mouseX>redCoordinates[2][0])&&(mouseX<((redCoordinates[2][0])+(redCoordinates[2][2])))&&(mouseY<((redCoordinates[2][1])+(redCoordinates[2][3])))&&(mouseY>redCoordinates[2][1]))
||((mouseX>redCoordinates[3][0])&&(mouseX<((redCoordinates[3][0])+(redCoordinates[3][2])))&&(mouseY<((redCoordinates[3][1])+(redCoordinates[3][3])))&&(mouseY>redCoordinates[3][1]))
||((mouseX>redCoordinates[4][0])&&(mouseX<((redCoordinates[4][0])+(redCoordinates[4][2])))&&(mouseY<((redCoordinates[4][1])+(redCoordinates[4][3])))&&(mouseY>redCoordinates[4][1]))
||((mouseX>redCoordinates[5][0])&&(mouseX<((redCoordinates[5][0])+(redCoordinates[5][2])))&&(mouseY<((redCoordinates[5][1])+(redCoordinates[5][3])))&&(mouseY>redCoordinates[5][1]))
||((mouseX>redCoordinates[6][0])&&(mouseX<((redCoordinates[6][0])+(redCoordinates[6][2])))&&(mouseY<((redCoordinates[6][1])+(redCoordinates[6][3])))&&(mouseY>redCoordinates[6][1]))
||((mouseX>redCoordinates[7][0])&&(mouseX<((redCoordinates[7][0])+(redCoordinates[7][2])))&&(mouseY<((redCoordinates[7][1])+(redCoordinates[7][3])))&&(mouseY>redCoordinates[7][1]))
||((mouseX>redCoordinates[8][0])&&(mouseX<((redCoordinates[8][0])+(redCoordinates[8][2])))&&(mouseY<((redCoordinates[8][1])+(redCoordinates[8][3])))&&(mouseY>redCoordinates[8][1]))
||((mouseX>redCoordinates[9][0])&&(mouseX<((redCoordinates[9][0])+(redCoordinates[9][2])))&&(mouseY<((redCoordinates[9][1])+(redCoordinates[9][3])))&&(mouseY>redCoordinates[9][1]))
))
         
         {
           teleport1Color=0;
           teleport2Color=0;
           teleport3Color=0;
           teleport4Color=0;
         }
          if(mousePressed){
              background(255);
              mapThree();    
              noCursor();
              for (int i=0; i<xpos.length-1; i++){
                  xpos[i]=xpos[i+1];
                  ypos[i]=ypos[i+1];
              }

              xpos[xpos.length-1]=mouseX;
              ypos[ypos.length-1]=mouseY;
  
              for (int i=0; i<xpos.length; i++){
                  noStroke();
                  fill(255-i*6);
                  ellipse(xpos[i],ypos[i],(i/4)*3,(i/4)*3); 
                  if (redVisible==1){
                  fill(255,0,0);
                   ellipse(xpos[0],ypos[0],50,50);
                  }
              } 
          }
          else {
          background(255);
          mapThree();
          cursor(CROSS);
          xpos[xpos.length-1]=mouseX;
          ypos[ypos.length-1]=mouseY;
          for (int i=0; i<xpos.length-1; i++){
             //array values of mouse shifts
             xpos[i]=xpos[i+1];
             ypos[i]=ypos[i+1];
             //draws slug from mouse position just before the end of the array value, because that value stays where you left red
             noStroke();
             fill(255-i*6);
             ellipse(xpos[i],ypos[i],(i/4)*3,(i/4)*3);
             //if red is shown on screen, it is draw in the last place it was when it was following you
             if(redVisible==1){
                fill(255,0,0);
                ellipse(redCircleStopX,redCircleStopY,50,50);
             }
           }
       }
          
          
          

    }
    }
}
    }
}


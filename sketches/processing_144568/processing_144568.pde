
//What level of the game the player is at
int level =0;
//What is being shown, 1=Instructions, 2=Dead screen, 3=Win screen, 4=In game
int screen = 1;
//Time limit for levels (if 0, timelimit doesn't apply)
int timelimit = 0;
//Stage of instructions the player is it
int instructionsStage=1;
//did you die in the example of the instructions?(0 = dead, 1 = alive)
int demoDead=1;

//MAIN GAMEPLAY array for mouse positions, for black slug effect, and position of robot (xpos[0],ypos[0])
int[] xpos=new int[40];
int[] ypos=new int[40];

//TUTORIAL PT1 array for mouse positions, for black slug effect, and position of robot (xpos[0],ypos[0])
int[] xpos1=new int[40];
int[] ypos1=new int[40];

//Function for the slug and robot (1 for normal game play, 2 for non-robot levels, 3 for tutorial pt1)
void slug(int a){
         if(a==1 || a==2){
          background(255);
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
          }
         }
         if(a==3){
          demoDead=1;
          //array values of mouse positions shift
          for (int i=0; i<xpos1.length-1; i++){
              xpos1[i]=xpos1[i+1];
              ypos1[i]=ypos1[i+1];
          }
          //last array position is moved along x (controls speed and direction the example slug moves in the tutorial)
          if((xpos1[xpos1.length-1])<=200){
          xpos1[xpos1.length-1]=((xpos1[xpos1.length-1])+10);
          }
          if(((xpos1[xpos1.length-1])>=200)&&((xpos1[xpos1.length-1])<=225)){
          xpos1[xpos1.length-1]=((xpos1[xpos1.length-1])+1);
          }
          if(((xpos1[xpos1.length-1])>=225)&&((xpos1[xpos1.length-1])<=400)){
          xpos1[xpos1.length-1]=((xpos1[xpos1.length-1])+10);
          }
          if(((xpos1[xpos1.length-1])>=400)&&((xpos1[xpos1.length-1])<435)){
          xpos1[xpos1.length-1]=((xpos1[xpos1.length-1])+1);
          }
          if((xpos1[0])>=435){
            xpos1[xpos1.length-1]=((xpos1[xpos1.length-1])+1);
          }
          //hides slug and robot for short period before restaring the demo
          if((xpos1[0])>405){
            text("Dead",350,232);
            demoDead=0;
          }
          //restarts the demo
          if((xpos1[0])>=440){
            demoDead=1;
              //resetting array
          for(int i=0;i<xpos1.length;i++){
             xpos1[i]=80;
             ypos1[i]=300;
          }
          }
          
           
          //RESTART THE DEMO ONCE FINISHED
          //creates slug effect
          //only if it's ment to be visible
          if (demoDead==1){
          for (int i=0; i<xpos1.length; i++){
             noStroke();
             fill(255-i*6);
             ellipse(xpos1[i],ypos1[i],(i/4)*3,(i/4)*3);
          }
          }         
         }
           if (a==1){   
             for (int i=0; i<xpos.length; i++){
           //draws robot being on last mouse position in the array 
           fill(255,0,0);
           ellipse(xpos[0],ypos[0],50,50);
             }
            }
           if (a==3){   
             for (int i=0; i<xpos.length; i++){
           //draws robot being on last  position in the array
           //only if it's ment to be visible
          if (demoDead==1){ 
           fill(255,0,0);
           ellipse(xpos1[0],ypos1[0],50,50);
             }
             }
            }
}
    



//Reused button, 1=instrutions part 1, 2=instructions part 2, 3=begin game, 4=continue game
void button(int a){
  fill(255,234,41);
  noStroke();
  if (a==1){
    rect(300,500,150,50);
    fill(0);
    text("Next",350,532);
  }
  if(a==2){
    rect(300,100,150,50);
    fill(0);
    text("Next",350,132);
  }
  if(a==3){
    rect(300,100,150,50);
    fill(0);
    text("Start!",350,132);
  }
  if(a==4){
    rect(300,100,150,50);
    fill(0);
    text("Resume",350,132);
  }
}

//INSTRUCTIONS function (a=level of the game, 0=not started)
void instructions(){
  background(255,255,255);
  textSize(20);
  cursor(CROSS);
  fill(0);
  if(instructionsStage==1){ 
    text("You, an alien slug from the future, have just been hired by scientists who work with explosive robots! Your job is to transport these explosive robots through the lab corridors safely. If you fail to do so, you will either end up out of a job, or dead.You must guide the robot (currently a red circle) through the lab without it hitting you, or the walls, and blowing up.",100,100,600,600);
    button(1);
    if((mousePressed)&&((mouseX>300)&&(mouseX<450)&&(mouseY>500)&&(mouseY<550))){  
      instructionsStage++; 
    }
  }
  if(instructionsStage==2){
    text("The scientits have programmed each robot to follow your moves exactly when you hold down your mouse button, but 1 second behind, so if you move too slowly, it will catch you up, which will get you killed.",100,425,600,600); 
    button(2);  
    slug(3);
    if((mousePressed)&&((mouseX>300)&&(mouseX<450)&&(mouseY>100)&&(mouseY<150))){  
      instructionsStage++; 
    }
  }
  if(instructionsStage==3){
    text("Also, because it is bigger than you, if you move too close to the walls, it will hit them, and be destroyed, which will get you fired. Stay in the middle of corridors, and keep away from corners!",100,100,600,600); 
    button(1);
    if((mousePressed)&&((mouseX>300)&&(mouseX<450)&&(mouseY>500)&&(mouseY<550))){  
      instructionsStage++; 
    }
  }
  if (instructionsStage==4){
    text("Teleportation is a thing. The yellow bits of the corridors are too narrow for the robots to follow you through. So the scientits have made a teleportation mat for the robot to use at each end of the narrow corridors. To use the mats, you have to guide the robot onto the first mat, stop clicking your mouse button so it stays there, then go through the corridor, stand on the second mat, and click again to activate the teleportation mats.",100,400,600,600);
    if(level==0){
    button(3);
    }
    else{
      button(4);
    }
    if((mousePressed)&&((mouseX>300)&&(mouseX<450)&&(mouseY>100)&&(mouseY<150))){  
      screen=4;
     instructionsStage=0; 
    }
  }
}


void setup(){
  size(800,660); 
  background(255);
  //MAIN GAMEPLAY initializing array of mouse positions as all equalling 0
          for(int i=0;i<xpos.length;i++){
             xpos[i]=0;
             ypos[i]=0;
          }
  //TUTORIAL PT 1 initializing array of mouse positions
          for(int i=0;i<xpos1.length;i++){
             xpos1[i]=80;
             ypos1[i]=300;
          }
}

void draw(){
 if(screen==1){
 
 instructions();
 
 }
 if(screen==4){
   background(255);
   text("This is the first level. I'll make this at some point",200,200);
 }
}


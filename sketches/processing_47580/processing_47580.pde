
int numFrames = 12;  // The number of frames in the animation
int frame = 0;
float d; 
float d2;
PFont f;
int levelup;

//global variables for player
//float player_x;
//float player_y;

//int manX = 0;
//int manY = 0;
//int []mansX;
//int []mansY;

int bedX =0; 
int bedY = 0;  
int deskX = 0; 
int deskY = 0; 
int playerX = 0; 
int playerY = 0; 
int rugX=0;
int rugY = 0;
int lampX = 0;
int lampY = 0;
int dresserX = 0;
int dresserY = 0;
int tvX= 0;
int tvY = 0;
int couchX = 0;
int couchY =0;
int doorwayX = 0;
int doorwayY = 0;
int wallY = 0;
int wallX = 0;
int wallTopX = 0;
int wallTopY = 0;
int clothesOneX = 0;
int clothesOneY =0;
int deadX = 0;
int deadY = 0;
int knifeX;
int knifeY; 
int takeoutboxX;
int takeoutboxY;


//IMAGES FOR FRAMES 
PImage[] walk = new PImage[numFrames];
PImage[] walk_left = new PImage[numFrames];
PImage[] walk_right = new PImage[numFrames];

PImage player; 
PImage playerback;
PImage playerLeft;
PImage playerLeft_walk;
PImage playerRight_walk;
PImage playerRight;
PImage player_walk;
PImage bed;
PImage desk;
PImage rug;
PImage lamp;
PImage dresser; 
PImage tv;
PImage couch;
PImage doorway;
PImage wall;
PImage wallTop;
PImage clothesOne;
PImage bg; 
PImage dead;
PImage takeoutbox;
PImage knife; 

//BOOLEANS 
boolean walking = false; 
boolean playerImage = true;
boolean player_imageLeft = false;
boolean walking_right = false; 
boolean walking_left = false; 
boolean movement = true;
boolean clue = false; 
boolean tvClue = false;
boolean paperClue = false;
boolean defaulttext = false;
boolean levelone= false;
boolean leveltwo= false;
boolean levelthree= false;
boolean levelfour= false;
boolean levelfive= false;
boolean knifeClue = false; 
boolean bedClue = false; 
boolean button = false; 
boolean hatClue = false; 

float Xposition, Yposition;
float rotation = 0;
float scaleFactor = 1;
float[] offsets = { 
  100, 100, 300, 100 };
boolean[] keys = new boolean[9];


void setup(){
  frameRate(75);
  
  f = createFont("Arial",16,true); 
  //WALKING DOWN FACING SCREEN
 walk[0]  = loadImage("characterfrontwalkone.gif");
 walk[1] = loadImage("characterfrontwalkone.gif");
 walk[2] = loadImage("characterfrontwalkone.gif");
 walk[3]  = loadImage("characterfrontwalkone.gif");
 walk[4] = loadImage("characterfrontwalkone.gif");
 walk[5] = loadImage("characterfrontwalkone.gif"); 
 walk[6]  = loadImage("characterfrontwalktwo.gif"); 
 walk[7]  = loadImage("characterfrontwalktwo.gif"); 
 walk[8]  = loadImage("characterfrontwalktwo.gif"); 
 walk[9]  = loadImage("characterfrontwalktwo.gif"); 
 walk[10]  = loadImage("characterfrontwalktwo.gif"); 
 walk[11]  = loadImage("characterfrontwalktwo.gif"); 
 
 //WALKING LEFT ;
 
  walk_left[0]  = loadImage("characterleft.gif");
 walk_left[1] = loadImage("characterleft.gif");
 walk_left[2] = loadImage("characterleft.gif");
 walk_left[3]  = loadImage("characterleft.gif");
 walk_left[4] = loadImage("characterleft.gif");
 walk_left[5] = loadImage("characterleft.gif"); 
 walk_left[6]  = loadImage("characterleftwalk.gif"); 
 walk_left[7]  = loadImage("characterleftwalk.gif"); 
 walk_left[8]  = loadImage("characterleftwalk.gif"); 
 walk_left[9]  = loadImage("characterleftwalk.gif"); 
 walk_left[10]  = loadImage("characterleftwalk.gif"); 
 walk_left[11]  = loadImage("characterleftwalk.gif"); 
 //WALKING RIGHT
 
 walk_right[0]  = loadImage("characterright.gif");
 walk_right[1] = loadImage("characterright.gif");
 walk_right[2] = loadImage("characterright.gif");
 walk_right[3]  = loadImage("characterright.gif");
 walk_right[4] = loadImage("characterright.gif");
 walk_right[5] = loadImage("characterright.gif"); 
 walk_right[6]  = loadImage("characterrightwalk.gif"); 
 walk_right[7]  = loadImage("characterrightwalk.gif"); 
 walk_right[8]  = loadImage("characterrightwalk.gif"); 
 walk_right[9]  = loadImage("characterrightwalk.gif"); 
 walk_right[10]  = loadImage("characterrightwalk.gif"); 
 walk_right[11]  = loadImage("characterrightwalk.gif"); 

 
 
  
  size(508,400);
  
 // cx = width/2;
 // cy = height/2;
  
// manX = cx-5;
//manY = cy-5;
  noStroke();
  // LOADING IMAGES 
  player = loadImage("characterfront.gif");
  //player_walk = loadImage("walking.gif");
  playerLeft = loadImage("characterleft.gif");
  playerLeft_walk = loadImage("characterleftwalk.gif"); 
  playerRight = loadImage("characterright.gif");
  playerRight_walk = loadImage("characterrightwalk.gif"); 
  bed = loadImage("bed.gif"); 
  desk = loadImage("desk.gif"); 
  rug = loadImage("rug.png");
  lamp = loadImage("lamp.gif"); 
  dresser = loadImage("dresser.gif");
  tv = loadImage("tv.gif"); 
  couch = loadImage("couch.gif");
  doorway = loadImage("doorway.gif");
  wall = loadImage("wall.png");
  wallTop = loadImage("walltop.png");
  clothesOne =loadImage("clothes.gif");
  bg = loadImage("background.png");
  dead = loadImage("dead.gif");
 knife = loadImage("knife.gif");  
 takeoutbox = loadImage("box.gif"); 
}
void draw(){
  hit();
  simulate();
  render();
  player.loadPixels();
bed.loadPixels(); 
rug.loadPixels(); 
desk.loadPixels();
tv.loadPixels();
dresser.loadPixels();

 textFont(f);       
  fill(255);
  
//CLUES
if (hatClue == true){
  text("576629", width/1.7, 320);
  knifeClue = false;
  
}
if (levelone==false){
  text("Code: 123456",width/1.7,266);
  text("Press Spacebar",width/1.7,283);
  }
  if(bedClue == true){
    text("385739", width/1.7, 320);
    knifeClue = false; 
    
  }
  if ( button ==true){
    text("275846" , width/1.7 , 320); 
    knifeClue = false; 
    clue = false;
    defaulttext = false; 
  }

if( knifeClue == true){
  text("395726", width/1.7, 320);
  clue = false;
  defaulttext = false; 
  
}
defaulttext = true; 


if (clue == true){
  //textAlign(CENTER);
  text("'What happened here?'",width/1.7,300);
  defaulttext = false; 
  knifeClue = false; 
}
//if (clue == false){
 // defaulttext = true;
//}
  if(defaulttext == true){
    text("Better take a look around", width/1.7,300);
    if(defaulttext == false){
      paperClue = true;
    }
  
}
if (tvClue ==true){
  //textAlign(CENTER);
  text("The TV is off", width/1.7, 300);
}
if(paperClue == true){
  text("A paper:475869'", width/1.7, 320);
  defaulttext = false;
  clue = false; 
}

if (player.height<0 || player.height>550){
  keys[0] = false; 
}

if (player==bed || player.width>bed.width){
  keys[1] = false;
  
}
  //player_walk.loadPixels();
 //playerRight.loadPixels();
  //playerRight_walk.loadPixels(); 
  //pl

   
}

void simulate(){
  if(keys[0]){
    Yposition--;
  }
  if(keys[1]){
    Yposition++;
    //walking = true;
  }
  if(keys[2]){
    Xposition--;
  }
  if(keys[3]){
    Xposition++;

  }
  if( keys[4] ){
    rotation+=0.01;
  }
}
void render(){
  background(bg);
  
 // ITEMS
 
 //DESK
 fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-155,-90);
  rotate(rotation);
  image(desk, deskX, deskY, desk.width, desk.height);
  noStroke();
  popMatrix();
  
  
  
 
  //BED
  fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-275,-90);
  rotate(rotation);
  image(bed, bedX, bedY, bed.width, bed.height);
  noStroke();
  popMatrix();
  
    //WALL LEFT 
  fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-300, -110);
  rotate(rotation);
  image(wall, wallX, wallY, wall.width, wall.height);
  noStroke();
  popMatrix();
  
  //WALL RIGHT
  fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(195, -110);
  rotate(rotation);
  image(wall, wallX, wallY, wall.width, wall.height);
  noStroke();
  popMatrix();
  
    //COUCH
  fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-275, 70);
  rotate(rotation);
  image(couch, couchX, couchY, couch.width, couch.height);
  noStroke();
  popMatrix();
  
  //BOX
    fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-45, -50);
  rotate(rotation);
  image(takeoutbox, takeoutboxX, takeoutboxY, takeoutbox.width, takeoutbox.height);
  noStroke();
  popMatrix();
  
  //Doorway
    
  fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-300,285);
  rotate(rotation);
  image(doorway, doorwayX, doorwayY, doorway.width, doorway.height);
  noStroke();
  popMatrix();
  
   //Doorwaytop
    
  fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-300,-113);
  rotate(rotation);
  image(wallTop, wallTopX, wallTopY, wallTop.width, wallTop.height);
  noStroke();
  popMatrix();
  
  
  //RUG 
  
   fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-150,10);
  rotate(rotation);
  image(rug, rugX, rugY, rug.width, rug.height);
  noStroke();
  popMatrix();
  
  //Dead Body 
   fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-120,50);
  rotate(rotation);
  image(dead, deadX, deadY, dead.width, dead.height);
  noStroke();
  popMatrix();
 
    //KNIFE 
   fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(-60,50);
  rotate(rotation);
  image(knife, knifeX, knifeY, knife.width, knife.height);
  noStroke();
  popMatrix();
  
  
  //LAMP
   fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(0, -90);
  rotate(rotation);
  image(lamp, lampX, lampY, lamp.width, lamp.height);
  noStroke();
  popMatrix();
  
  //DRESSER 
   fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(50, -90);
  rotate(rotation);
  image(dresser, dresserX, dresserY, dresser.width, dresser.height);
  noStroke();
  popMatrix();
  
  //TV
   fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(110, -30);
  rotate(rotation);
  image(tv, tvX, tvY, tv.width, tv.height);
  noStroke();
  popMatrix();
 
 //Clothes
 
   fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
  scale(scaleFactor);
  translate(110, 100);
  rotate(rotation);
  image(clothesOne, clothesOneX, clothesOneY, clothesOne.width, clothesOne.height);
  noStroke();
  popMatrix();
  
  // set walking images 
  if(playerImage == true){
  fill(0,255,0);
  pushMatrix();
  translate(offsets[2],offsets[3]);  
 // scale(scaleFactor);
  translate(Xposition,Yposition);
  //rotate(rotation);
  image(player, playerX, playerY, player.width, player.height);
  noStroke();
  popMatrix();
  }
  
  //WALKING 
  
  if(walking ==true){
  //pushMatrix();
  translate(offsets[2], offsets[3]);
 // scale(scaleFactor);
  translate(Xposition, Yposition);
  //rotate(rotation);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(walk[frame], playerX, playerY);
   playerImage = false; 
  
  }
  //WALKING LEFT 
   if(walking_left ==true){
  //pushMatrix();
  translate(offsets[2], offsets[3]);
  //scale(scaleFactor);
  translate(Xposition, Yposition);
  //rotate(rotation);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(walk_left[frame], playerX, playerY);
   playerImage = false; 
  walking = false; 
   }
   
   //Walking Right 
   
   if(walking_right ==true){
  //pushMatrix();
  translate(offsets[2], offsets[3]);
  //scale(scaleFactor);
  translate(Xposition, Yposition);
  //rotate(rotation);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(walk_right[frame], playerX, playerY);
   playerImage = false; 
  walking = false; 
   } 
}

//COLLISION 

void hit(){
    
  
   // d=dist(playerX,playerY,bedX,bedY);
  
  //DESK COLLISION.
  
  if(Xposition>-165 &&
 Xposition < -165 +desk.width &&
 Yposition<-30 &&
 Yposition <deskY +desk.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = -20;
        paperClue = true;
        clue = false; 
        defaulttext = false; 
        knifeClue = false; 
        button = false; 
        //playerX = 600;
       //Xposition = 600;
        }
        
        
        
        
 if(Xposition<-165 &&
 Xposition > -165 +desk.width &&
 Yposition>-30 &&
 Yposition <deskY +desk.height){
paperClue = false; 
 }
        
        
        
  //DRESSER COLLISION.
  
  if(Xposition>50 &&
 Xposition < 50 +dresser.width &&
 Yposition<-90 &&
 Yposition <dresserY +dresser.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = 5;
        Yposition = -70;
        //playerX = 600;
       //Xposition = 600;
        }       
        
        
        
  //BED COLLISION 
   if(Xposition>-275 &&
 Xposition < -275 +bed.width &&
 Yposition<-110 &&
 Yposition <bedY +bed.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition+5;
       // bedClue = true; 
        hatClue = true;
        bedClue = true; 
        
 } 
    
       if(Xposition>-275 &&
 Xposition < -275 +bed.width &&
 Yposition< 10 &&
 Yposition <bedY +bed.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition+5;
        
 } 
 //COUCH COLLISION
    if(Xposition>-260 &&
 Xposition < -260 +couch.width &&
 Yposition< 130 &&
 Yposition <couchY +couch.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        button = true;
        knifeClue = false;
        clue = false; 
        paperClue = false; 
        Xposition = Xposition+5;
        
 }  
    
         if(Xposition>-275 &&
 Xposition < -260 +couch.width &&
 Yposition< 70 &&
 Yposition <couchY +couch.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition+5;
        
 }
 
 //KNIFE 
 
   if(Xposition> 50 &&
 Xposition < -50 +knife.width &&
 Yposition< 50 &&
 Yposition <knifeY +knife.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = -20;
        paperClue = false;
        clue = false; 
        defaulttext = false; 
        knifeClue = true; 
        button = false; 
        
        //playerX = 600;
       //Xposition = 600;
        }

    if(Xposition>-290 &&
 Xposition < -290 +couch.width &&
 Yposition< 120 &&
 Yposition <couchY +couch.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition+5;
        clue=false; 
        
 }  

//TV COLLISION 
    if(Xposition> 110 &&
 Xposition < 110 +tv.width &&
 Yposition< -30 &&
 Yposition <tvY +tv.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition-5;
        clue = false;
       tvClue = true;  
       paperClue = false;
       defaulttext = false; 
 } 

  if(Xposition> 110 &&
 Xposition < 110 +tv.width &&
 Yposition< 85 &&
 Yposition <tvY +tv.height){
   // keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition-5;
        clue= false; 
 }
 //clothes 
     if(Xposition> 110 &&
 Xposition < 100 +clothesOne.width &&
 Yposition< 110 &&
 Yposition <clothesOneY +clothesOne.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        hatClue = true; 
        clue = false;
        knifeClue = false; 
        button = true; 
        //Xposition = Xposition-5;
        
  } 
//Dead body 
   if(levelone==true){
    if(Xposition > -123 &&
 Xposition < -123 +dead.width &&
 Yposition< 50 &&
 Yposition <0 +dead.height){
   // keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition-5;
        clue = true;
        defaulttext = false;
        paperClue = false;
       knifeClue = true;  
       button = false; 
  text("Code: 134567",width/1.7,266);
  text("Press Spacebar",width/1.7,283);
        
 }
   }
         // else{
           // clue = false;
          //}
       // if(Xposition< -123 &&
        //Xposition >-123 +dead.width &&
        //Yposition >50 &&
       // Yposition>0 +dead.height){
         // clue= false; 
       
       // }
   
        
        //Left wall collision 
         
    if(Xposition> -300 &&
 Xposition < -300 +wall.width &&
 Yposition< -110 &&
 Yposition <wallY +wall.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition-5;
        
 } 
 
     if(Xposition> -300 &&
 Xposition < -300 +wall.width &&
 Yposition< -200 &&
 Yposition <wallY +wall.height){
    keys[0] = false;
         //walking_left = false; 
        playerImage = true; 
        Xposition = Xposition-5;
        
 } 
        

  // int checkX = (int)playerX;
   // int checkY = playerY;
   // int againstX =  bedX;
// int againstY = bedY; 
   d=dist(bedX,bedY,Xposition,Yposition);
   if (d<5){
     //keys[0] = false;
     walking_left = false; 
     
    }
    
    d2=dist(Xposition, Yposition, -275, -90);
    
   // if(Xposition >(desk.width - desk.height)) keys[0] = false; 
    //}

     
     //this ends the code dustin put in
     
        //on=false;
       
     // }
}








//PRESSING KEYS





void keyPressed(){
  if(key==CODED){
    if(keyCode==UP){ 
      keys[0] = true; 
      walking = true; 
       
    }
    if(keyCode==DOWN){ 
      keys[1] = true; 
      walking = true;
     playerImage=false;  
    }
    if(keyCode==LEFT){ 
      keys[2] = true; 
      walking_left = true; 
      
    }
    if(keyCode==RIGHT){ 
      keys[3] = true; 
    walking_right = true; 
    walking_left = false; 
       
    }
  } 
  else {
    if(key==' '){
      levelone = true;
    }
  }
}

//RELEASING KEYS 
void keyReleased(){
  if(key==CODED){
    if(keyCode==UP){ 
      keys[0] = false;
     playerImage = true; 
   walking = false;   
    }
    if(keyCode==DOWN){ 
      keys[1] = false;
     playerImage= true; 
    walking = false;  
    }
    if(keyCode==LEFT){ 
      keys[2] = false;
     walking_left = false; 
    playerImage= true; 
    
    }
    if(keyCode==RIGHT){ 
      keys[3] = false; 
      walking_right = false; 
      playerImage = true; 
      
      //playerImage = true; 
    }
  } 
  else {
    if(key==' '){
      keys[4] = false; 
    }
    if( key=='z'){
      scaleFactor-=.1;
    }
    if( key=='x'){
      scaleFactor+=.1;
    }
  }
}



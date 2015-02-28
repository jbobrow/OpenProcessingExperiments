
/*
CREDITS:
 -Title "Random House" belongs to the Random House book publishing company. I'm just building off of their branding image.
 -Enemy1 (jellyfish) in room1 is originally (although heavily modified) taken from http://www.superhero.nataliefreed.com/?p=148
 -Pool water texture in room1 is originally (although heavily modified) taken from http://www.apluspoolwater.com/
 */
player player;
player2 player2;
enemy1 enemy1;
player3 player3;

import gifAnimation.*;

//players
boolean moveup, movedown, moveright, moveleft;
int pct,pst,ptt;
int facing;
//player2
float xpos, ypos;
float xspeed;
//player3
boolean moveup2, movedown2, moveright2, moveleft2;
float xpos2, ypos2;
int facing2;

//images
PImage[] animation;
Gif title;
Gif jellyfish;
PImage bg1;
PImage room1;
PImage room1Water;
PImage room2;
PImage room3;

String gameState;

//enemies array
ArrayList enemies1;
int current_time, start_time, total_time;

//calculating dist between enemy1 and player2
float d1;

//calculating dist between player2 and doorway(rect) to room2
float d2;

void setup() {
  size(800,600);
  smooth();

  title = new Gif(this, "title.gif");
  title.loop();

  jellyfish = new Gif(this,"jellyfish.gif");
  jellyfish.loop();

  animation = Gif.getPImages(this, "title.gif");
  animation = Gif.getPImages(this, "jellyfish.gif");

  //player
  player=new player();
  player.init("p_");
  moveleft=moveright=false;
  pct=0;
  pst=0;
  ptt=250;
  //player2 (after house entry)
  player2=new player2();
  player2.init("p2_");
  moveleft=moveright=moveup=movedown=false;
  pct=0;
  pst=0;
  ptt=250;
  xspeed=3;
  xpos=width/5;
  ypos=height-45;
  moveup=true;
  facing=2;
  //player3 (room2)
  player3=new player3();
  player3.init("p3_");
  xpos2=width-160;
  ypos2=height-45;

  gameState = "PreGame";

  bg1 = loadImage("bg4.gif");
  room1 = loadImage("room1.png");
  room1Water = loadImage("room1_water.png");
  room2 = loadImage("room2.png");
  room3 = loadImage("room3.png");

  current_time=0;
  start_time=millis();
  total_time=1500;
  enemies1=new ArrayList();
}

void draw() {
  if (gameState.equals("PreGame")) {


    image(title,0,0);

    //door
    noStroke();
    fill(random(50));
    ellipseMode(CENTER);
    ellipse(523,350,52,52);
    fill(0,0,255);
    rect(498,355,52,10);
    fill(random(50));
    rect(498,365,52,200);

    if(mousePressed == true) {
      gameState = "inGame1";
    }//end PreGame
  } 
  if (gameState.equals("inGame1")) {

    noStroke();
    background(bg1);

    //ground
    fill(0);
    //house
    fill(0);
    //blue reflections
    strokeWeight(2);
    stroke(0,0,random(150));
    line(240,200,240,560);
    line(300,428,440,428);
    //door
    noStroke();
    fill(random(50));
    ellipseMode(CENTER);
    ellipse(523,350,52,52);
    fill(0,0,255);
    rect(498,355,52,10);
    fill(random(50));
    rect(498,365,52,200);


    if (moveright && !moveleft)
    {
      if ( !player.current_pose.equals("walk") || player.facing!=1) {
        player.facing=1;
        player.current_pose="walk";
        player.st=millis()-player.tt;
      }
    }

    if (moveleft && !moveright)
    {
      if ( !player.current_pose.equals("walk") || player.facing!=-1) {
        player.facing=-1;
        player.current_pose="walk";
        player.st=millis()-player.tt;
      }
    }

    if (!moveleft && !moveright)
    {
      if (player.current_pose.equals("walk")) {
        player.current_pose="stand";
      }
    }

    if(player.x <= 5 ) {
      player.x = 5;
    }

    /*  if(player.current_pose.equals("punch")){
     pct=millis();
     if(pct-pst>ptt){
     player.current_pose="stand";
     }
     
     }
     */
    player.update();
  }

  pushMatrix();
  fill(0,0,255);
  rect(550,365,50,200);
  popMatrix();


  if(player.x >= 575) {
    gameState = "inGame2";
  }//end InGame1

  if(gameState.equals("inGame2")) {
    background(0,0,255,10);
    imageMode(CORNER);
    image(room1,0,0);


    current_time=millis();

    //enemies
    if(current_time-start_time>total_time) {
      enemy1 ra=new enemy1();
      ra.init();
      enemies1.add(ra);
      start_time=current_time;
    }

    if(enemies1.size()>0) {
      for(int i=0; i<enemies1.size(); i++) {
        enemy1 da=(enemy1)(enemies1.get(i));
        da.update();
      }
    }

    //player2
    player2.update(xpos,ypos);

    if (keyPressed) {
      if (keyCode==38) {
        player2.current_pose="walk";
        ypos-=3.0;
        facing=1;
        if (ypos<85) {
          ypos=85;
        }
        moveup=true;
        movedown=false;
        moveright=false;
        moveleft=false;
      } 

      if (keyCode==40) {
        player2.current_pose="walk";
        ypos+=3.0;
        facing=2;
        if (ypos>height-85) {
          ypos=height-85;
        }
        movedown=true;
        moveup=false;
        moveright=false;
        moveleft=false;
      } 

      if (keyCode==37) {
        player2.current_pose="walk";
        xpos-=3.0;
        facing=3;
        if (xpos<85) {
          xpos=85;
        }
        moveleft=true;
        moveup=false;
        movedown=false;
        moveright=false;
      } 

      if (keyCode==39) {
        player2.current_pose="walk";
        xpos+=3.0;
        facing=4;
        if (xpos>width-85) {
          xpos=width-85;
        }
        moveright=true;
        moveup=false;
        movedown=false;
        moveleft=false;
      }
    }



    if(current_time-start_time > total_time) {
          player2.update(xpos,ypos);
      //     d1 = dist(player2.xpos,player2.ypos,enemy1.x,enemy1.y);
      PVector  v1 = new PVector(player2.xpos, player2.ypos);
      PVector  v2 = new PVector(enemy1.x, enemy1.y); 
      float d1 = PVector.dist(v1, v2);
      println(d1);  // Prints "78.10249"
      if(d1 <= 75) {
        gameState.equals("gameOver");
      }
    }

    //    fill(255,255,0);
    //    ellipse(660,25,100,100);
    //    d2 = dist(660,25,player2.xpos,player2.ypos);

    if(gameState.equals("inGame2")) { 
      if(xpos >= 650 && ypos <= 100) {
        gameState="inGame3";
        //      gameState != "inGame2";
      }
    }
  }//end inGame2

  if(gameState == "inGame3") {
    background(255,225,150);
    imageMode(CORNER);
    image(room2,0,0);

    //player3
    player3.update(xpos2,ypos2);

    if (keyPressed) {
      if (keyCode==38) { //up
        player3.current_pose="walk";
        ypos2-=3.0;
        facing2=1;
        if (ypos2<85) {
          ypos2=85;
        }
        moveup2=true;
        movedown2=false;
        moveright2=false;
        moveleft2=false;
      } 

      if (keyCode==40) { //down
        player3.current_pose="walk";
        ypos2+=3.0;
        facing2=2;
        if (ypos2>height-85) {
          ypos2=height-85;
        }
        movedown2=true;
        moveup2=false;
        moveright2=false;
        moveleft2=false;
      } 

      if (keyCode==37) { //left
        player3.current_pose="walk";
        xpos2-=3.0;
        facing2=3;
        if (xpos2<85) {
          xpos2=85;
        }
        moveleft2=true;
        moveup2=false;
        movedown2=false;
        moveright2=false;
      } 

      if (keyCode==39) { //right
        player3.current_pose="walk";
        xpos2+=3.0;
        facing2=4;
        if (xpos2>width-85) {
          xpos2=width-85;
        }
        moveright2=true;
        moveup2=false;
        movedown2=false;
        moveleft2=false;
      }
    }

    if(xpos2 >= 700 && ypos2 > 200 || xpos2 >= 700 && ypos2 < 400) {
      gameState.equals("inGame4");
    }
  }

  if(gameState.equals("inGame4")) {
    background(255,225,150);
    imageMode(CORNER);
    image(room3,0,0);
  }

  if(gameState.equals("gameOver")) {
    background(0);
  }
}//end draw








void keyPressed() {
  if(gameState.equals("inGame1")) {
    if (keyCode==37) {
      moveleft=true;
    }
    if (keyCode==39) {
      moveright=true;
    }
    if (keyCode==38) {
      moveup=true;
    }
    if (keyCode==40) {
      movedown=true;
    }
  }
  if(gameState.equals("inGame2")) {
    if (keyCode==37) {
      moveleft=true;
    }
    if (keyCode==39) {
      moveright=true;
    }
    if (keyCode==38) {
      moveup=true;
    }
    if (keyCode==40) {
      movedown=true;
    }
  }
  if(gameState.equals("inGame3")) {
    if (keyCode==37) {
      moveleft2=true;
      moveleft=false;
    }
    if (keyCode==39) {
      moveright2=true;
      moveright=false;
    }
    if (keyCode==38) {
      moveup2=true;
      moveup=false;
    }
    if (keyCode==40) {
      movedown2=true;
      movedown=false;
    }
  }
}

void keyReleased() {
  if(gameState.equals("inGame1")) {
    if (keyCode==37) {
      moveleft=false;
    }
    if (keyCode==39) {
      moveright=false;
    }
    if (keyCode==38) {
      moveup=false;
    }
    if (keyCode==40) {
      movedown=false;
    }
  }
  if(gameState.equals("inGame2")) {
    player2.current_pose="stand"; 
    if (keyCode==37) {
      moveleft=false;
    }
    if (keyCode==39) {
      moveright=false;
    }
    if (keyCode==38) {
      moveup=false;
    }
    if (keyCode==40) {
      movedown=false;
    }
  }
  if(gameState.equals("inGame3")) {
    player3.current_pose="stand"; 
    if (keyCode==37) {
      moveleft=false;
    }
    if (keyCode==39) {
      moveright=false;
    }
    if (keyCode==38) {
      moveup=false;
    }
    if (keyCode==40) {
      movedown=false;
    }
  }
}

class enemy1 {

  Float x,y;

  enemy1() {
  }

  void init() {

    x=1.0*width+100;
    y=random(90,height-90);

  }

  void update() {
    x-=4;
    
 //   fill(255,0,0);
 //   ellipse(x,y,75,75);
    imageMode(CENTER);
    image(jellyfish, x-jellyfish.width/3, y-jellyfish.height/3);
  }
}

class player {
  
  int facing;              //which way does the hero face (1=right, -1=left);
  int playhead;            //image currently showing
  float x, y, xspeed;
  
  PImage[] sprites;        //simple image array to store all the images
  String current_pose;     //remember what animation is playing
  int totalImage;          
  int walk_end, walk_start;
  
  int ct, st, tt;
  
  void init(String prefix) {
    
    totalImage=5;
    walk_start=1;
    walk_end=4;
    
    sprites=new PImage[totalImage];  //declare the size of PImage array

    for (int i=0;i<totalImage;i++) { //load images in
      sprites[i]=loadImage(prefix+i+".png");
    }
    
    //initiate values: 
    x=width/5;
    y=height-45;
    
    current_pose="stand";
    playhead=0;

    facing=1;
    xspeed=1.5;

    ct=0;
    st=0;
    tt=150;
  }
  
  void update() {
   if (current_pose.equals("stand")) {
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[0], -sprites[0].width/2, -sprites[0].height+10);
      popMatrix();
    }
    
    if (current_pose.equals("walk")) {
      x+=xspeed*facing;       //move hero in the direction he/she is facing
      
      ct=millis();            //update timer
      if (ct-st>tt) {         //if timer is up, advance playhead to the next image
        playhead+=1;
        if (playhead>walk_end) { //if it exceeds the last image, set playhead back
          playhead=walk_start;   //to the first image of this pose.
        }
        st=millis();
      }
      
      pushMatrix();
      translate(x, y);
      scale(facing, 1);
      image(sprites[playhead], -sprites[playhead].width/2, -sprites[playhead].height+10);
      popMatrix();
    }
    
  }
  
}
class player2 {

  PImage[] sprites;
  String current_pose;

  float xpos,ypos;
  void init(String prefix) {
    sprites=new PImage[16];
    for(int i=0;i<=15;i++) {
      sprites[i]=loadImage(prefix+i+".png");
    }

    //initiate values
    current_pose="stand";

    xpos=width/5;
    ypos=height-45;

  }

  void update(float x, float y) {
    
 //   fill(255,0,0);
 //   ellipse(x,y,75,75);

    if (current_pose.equals("stand")) {
      pushMatrix();
      translate(x, y);

      image(sprites[0], -sprites[0].width/2, -sprites[0].height/2);
      popMatrix();
    }
    if (current_pose.equals("walk")) {
      if(movedown) {



        image(sprites[8],x-sprites[8].width/2,y-sprites[8].height/2);


      }

      if(moveleft) {



        image(sprites[4],x-sprites[4].width/2,y-sprites[4].height/2);


      }

      if(moveright) {



        image(sprites[12],x-sprites[12].width/2,y-sprites[12].height/2);


      }

      if(moveup) {



        image(sprites[2],x-sprites[2].width/2,y-sprites[2].height/2);


      }
    }
  }
}

class player3 {

  PImage[] sprites2;
  String current_pose;

  float xpos2,ypos2;
  void init(String prefix) {
    sprites2=new PImage[16];
    for(int i=0;i<=15;i++) {
      sprites2[i]=loadImage(prefix+i+".png");
    }

    //initiate values
    current_pose="stand";

    xpos2=width-160;
    ypos2=height-45;

  }

  void update(float x, float y) {
    
 //   fill(255,0,0);
 //   ellipse(x,y,75,75);

    if (current_pose.equals("stand")) {
      pushMatrix();
      translate(x, y);

      image(sprites2[0], -sprites2[0].width/2, -sprites2[0].height/2);
      popMatrix();
    }
    if (current_pose.equals("walk")) {
      if(movedown2) {



        image(sprites2[8],x-sprites2[8].width/2,y-sprites2[8].height/2);


      }

      if(moveleft2) {



        image(sprites2[4],x-sprites2[4].width/2,y-sprites2[4].height/2);


      }

      if(moveright2) {



        image(sprites2[12],x-sprites2[12].width/2,y-sprites2[12].height/2);


      }

      if(moveup2) {



        image(sprites2[2],x-sprites2[2].width/2,y-sprites2[2].height/2);


      }
    }
  }
}





//IMPORT********************
import gifAnimation.*;

//IMAGE DECLARE*************
BufferedReader reader;
String loaded;

String eqWep = "tomahawk";

PImage loadScreen;

PImage monster_1;

PImage fence_1;
PImage reticleImg;
PImage tree_1;
PImage weaponBox;

PImage[] noMoreTomahawks_PImage;
PImage[] titleScreen_PImage;

/*********WEAPON PIMAGES*****/
PImage[] tomahawk_PImage;
PImage[] sword_PImage;
PImage[] hammer_PImage;
PImage[] harpoon_PImage;
PImage[] spear_PImage;
PImage[] axe_PImage;
PImage[] mace_PImage;
/****************************/
PImage[] healthBoost_PImage;
PImage[] flower_1PImage;
PImage[] cloud_1PImage;

PImage[] playerStopPImage;
PImage[] playerUpPImage;
PImage[] playerLeftPImage;
PImage[] playerDownPImage;
PImage[] playerRightPImage;

//LIGHT DECLARE*************
Light[] lights = new Light[10];

//GIF DECLARE*****
Gif playerStop;
Gif playerUp;
Gif playerLeft;
Gif playerDown;
Gif playerRight;

/********WEAPON GIFS*******/
Gif tomahawkGif;
Gif swordGif;
Gif hammerGif;
Gif harpoonGif;
Gif spearGif;
Gif axeGif;
Gif maceGif;
/**************************/

Gif cloud_1;
Gif flower_1;

Gif noMoreTomahawks;
Gif titleScreen;

Gif healthBoostGif;

//PLAYER DECLARE************
Player player;

Reticle reticle;

ArrayList bullets;

Monster[] monsters = new Monster[100];

Monster temp;

Lifebar playerLifebar;

Lifebar[] monsterLifebar = new Lifebar[monsters.length];

Tree[] trees = new Tree[500];

Flower[] flowers = new Flower[500];
FlowerShadow[] flowershadows = new FlowerShadow[flowers.length];

Wall[] walls = new Wall[600];

WeaponBox[] weaponBoxes = new WeaponBox[10];

Fence[] fences = new Fence[100];

Cloud[] clouds = new Cloud[100];
CloudShadow [] cloudshadows = new CloudShadow[clouds.length];

HealthBoost[] healthboosts = new HealthBoost[20];

Expbar playerXP;
Level playerLevel;

boolean gameRunning = false;
boolean playerAlive;

int playerMovement = 0;

Weapon tomahawk;
Weapon sword;
Weapon hammer;
Weapon harpoon;
Weapon spear;
Weapon axe;
Weapon mace;

// 0 = stopped
// 1 = up
// 2 = left
// 3 = down
// 4 = right

void setup(){
  size(600,600);
  //*************************PLAYER MOVE GIFS*******************
  //MOVESTOP
  playerStop = new Gif(this, "gfx/player/moveStop.gif");
  playerStop.loop();
  playerStopPImage = Gif.getPImages(this, "gfx/player/moveStop.gif");
  //END MOVESTOP
  
  
  //MOVEUP
  playerUp = new Gif(this, "gfx/player/moveUp.gif");
  playerUp.loop();
  playerUpPImage = Gif.getPImages(this, "gfx/player/moveUp.gif");
  //END MOVEUP  
  
  //MOVELEFT
  playerLeft = new Gif(this, "gfx/player/moveLeft.gif");
  playerLeft.loop();
  playerLeftPImage = Gif.getPImages(this, "gfx/player/moveLeft.gif");
  //END MOVELEFT
    
  //MOVEDOWN
  playerDown = new Gif(this, "gfx/player/moveDown.gif");
  playerDown.loop();
  playerDownPImage = Gif.getPImages(this, "gfx/player/moveDown.gif");
  //END MOVEDOWN
    
  //MOVERIGHT
  playerRight = new Gif(this, "gfx/player/moveRight.gif");
  playerRight.loop();
  playerRightPImage = Gif.getPImages(this, "gfx/player/moveRight.gif");
  //END MOVERIGHT
  
  //*************************END PLAYER MOVE GIFS*****************
  
  
  //***************************LOAD IMAGES**************************
  loadScreen = loadImage("gfx/textures/loadScreen.gif");
  
  monster_1 = loadImage("gfx/enemy/monster_1.gif");
  
  fence_1 = loadImage("gfx/textures/fence_1.gif");
  
  tree_1 = loadImage("gfx/textures/tree_1.gif");
  
  reticleImg = loadImage("gfx/textures/reticle.gif");
  
  weaponBox = loadImage("gfx/textures/weaponBox.gif");
  
  cloud_1 = new Gif(this, "gfx/textures/cloud_1.gif");
  cloud_1.loop();
  cloud_1PImage = Gif.getPImages(this, "gfx/textures/cloud_1.gif");
   
  flower_1 = new Gif(this, "gfx/textures/flower_1.gif");
  flower_1.loop();
  flower_1PImage = Gif.getPImages(this, "gfx/textures/flower_1.gif");
  
  
  /**************************WEAPON GIFS LOAD***********************/
  tomahawkGif = new Gif(this, "gfx/weapons/tomahawk.gif");
  tomahawkGif.loop();
  tomahawk_PImage = Gif.getPImages(this, "gfx/weapons/tomahawk.gif");
  
  swordGif = new Gif(this, "gfx/weapons/sword.gif");
  swordGif.loop();
  sword_PImage = Gif.getPImages(this, "gfx/weapons/sword.gif");
  
  hammerGif = new Gif(this, "gfx/weapons/hammer.gif");
  hammerGif.loop();
  hammer_PImage = Gif.getPImages(this, "gfx/weapons/hammer.gif");
  
  harpoonGif = new Gif(this, "gfx/weapons/harpoon.gif");
  harpoonGif.loop();
  harpoon_PImage = Gif.getPImages(this, "gfx/weapons/harpoon.gif");
  
  spearGif = new Gif(this, "gfx/weapons/spear.gif");
  spearGif.loop();
  spear_PImage = Gif.getPImages(this, "gfx/weapons/spear.gif");
  
  axeGif = new Gif(this, "gfx/weapons/axe.gif");
  axeGif.loop();
  axe_PImage = Gif.getPImages(this, "gfx/weapons/axe.gif");
  
  maceGif = new Gif(this, "gfx/weapons/mace.gif");
  maceGif.loop();
  mace_PImage = Gif.getPImages(this, "gfx/weapons/mace.gif");
  /*****************************************************************/
  
  
  noMoreTomahawks = new Gif(this, "gfx/textures/nomo.gif");
  noMoreTomahawks.loop();
  tomahawk_PImage = Gif.getPImages(this, "gfx/textures/nomo.gif");
  
  healthBoostGif = new Gif(this, "gfx/textures/HealthBoost.gif");
  healthBoostGif.loop();
  healthBoost_PImage = Gif.getPImages(this, "gfx/textures/HealthBoost.gif");

  titleScreen = new Gif(this, "gfx/textures/tomahawk_tosser_title.gif");
  
  
  //*****************************END LOAD IMAGES*********************
  
  frameRate(60);
  
  bullets = new ArrayList(0);
  
  player = new Player(300,300,2,30);
  playerLifebar = new Lifebar(player.xPos-50, player.yPos+250, player.xPos+50, player.yPos-250, 100,100);
  playerXP = new Expbar();
  playerLevel = new Level(1);
  /*********************WEAPON DECLARATION********************/
  tomahawk = new Weapon(10, 30, "tomahawkGif");
  sword = new Weapon(15, 25, "swordGif");
  hammer = new Weapon(18, 18, "hammerGif");
  harpoon = new Weapon(30,10, "harpoonGif");
  spear = new Weapon(5,50, "spearGif");
  axe = new Weapon(20, 15, "axeGif");
  mace = new Weapon(25, 10, "maceGif");
  /***********************************************************/
  for (int i = 0; i < healthboosts.length; i++){
    int rand1 = int(random(-5000,5000));
    int rand2 = int(random(-5000,5000));
    healthboosts[i] = new HealthBoost(rand1, rand2);
  }
    
  for (int i = 0; i < clouds.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    float rand3 = random(0,1);
    clouds[i] = new Cloud (rand1,rand2,rand3);
    cloudshadows[i] = new CloudShadow (rand1+50,rand2+100,rand3);
  }
  for (int i = 0; i < fences.length; i++){
    fences[i] = new Fence (0 + (i*32), 0);
    walls[i] = new Wall(fences[i].xPos, fences[i].yPos + 10, fences[i].xPos+32, fences[i].yPos + 20);
  }
  for (int i = 0; i < flowers.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    flowers[i] = new Flower (rand1, rand2);
    flowershadows[i] = new FlowerShadow (rand1+20, rand2+27);
  }
  for (int i = 0; i < trees.length; i++){
    int rand1 = int(random(-1000,1000));
    int rand2 = int(random(-1000,1000));
    trees[i] = new Tree (rand1, rand2);
    walls[i+100] = new Wall (trees[i].xPos+20, trees[i].yPos+90, trees[i].xPos+100, trees[i].yPos+100);
  }
  for (int i = 0; i < monsters.length; i++){
    int rand1 = int(random(-2000,2000));
    int rand2 = int(random(-2000,2000));
    monsters[i] = new Monster(0.5, 32, rand1, rand2);
  }//end for
  
  for (int i = 0; i < monsters.length; i++){
    monsterLifebar[i] = new Lifebar(monsters[i].xPos-10, monsters[i].yPos-10, monsters[i].xPos+10, monsters[i].yPos-5,50,50);
  }//end for
  
  for (int i = 0; i< lights.length; i++){
    lights[i] = new Light(0,0,200,200);
  }//end for
  for (int i = 0; i < weaponBoxes.length; i++){
    int rand1 = int(random(-2000,2000));
    int rand2 = int(random(-2000,2000));
    weaponBoxes[i] = new WeaponBox(rand1, rand2);
  }
}//end of setup
class Bullet {
  
  float xPos;
  float yPos;
  float speed;
  float xSpeed;
  float ySpeed;
  float ang;
  boolean hit;
  
  Bullet(float speed_) {
    
    xPos = player.xPos + player.size/2;
    yPos = player.yPos + player.size/2;
    speed = speed_;
    xSpeed = -(speed*(player.xPos - (mouseX-player.countX)))/dist(player.xPos,player.yPos,mouseX-player.countX,mouseY-player.countY);
    ySpeed = -(speed*(player.yPos - (mouseY-player.countY)))/dist(player.xPos,player.yPos,mouseX-player.countX,mouseY-player.countY);
    
  }//end of constructor
  
  void display() {
    fill (255);
    if(eqWep == "tomahawk"){
      image(tomahawkGif,xPos,yPos);
    }
    if(eqWep == "sword"){
      image(swordGif,xPos,yPos);
    }
    if(eqWep == "hammer"){
      image(hammerGif,xPos,yPos);
    }
    if(eqWep == "harpoon"){
      image(harpoonGif,xPos,yPos);
    }
    if(eqWep == "spear"){
      image(spearGif,xPos,yPos);
    }
    if(eqWep == "axe"){
      image(axeGif,xPos,yPos);
    }
    if(eqWep == "mace"){
      image(maceGif,xPos,yPos);
    }
  }//end of display
  
  void shoot() {
    
    xPos += xSpeed;
    yPos += ySpeed;
    
    //BEGIN BULLET/MONSTER HIT DETECTION
    for(int i = 0; i < monsters.length; i++){
      
      if(xPos <= monsters[i].xPos + 32 && xPos >= monsters[i].xPos && yPos <= monsters[i].yPos + 32 && yPos >= monsters[i].yPos ){
          if(eqWep == "tomahawk"){
            monsterLifebar[i].health -= tomahawk.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "sword"){
            monsterLifebar[i].health -= sword.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "hammer"){
            monsterLifebar[i].health -= hammer.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "harpoon"){
            monsterLifebar[i].health -= harpoon.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "spear"){
            monsterLifebar[i].health -= spear.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "axe"){
            monsterLifebar[i].health -= axe.damage;
            monsters[i].sighted = true;
            hit = true;
          }
          if(eqWep == "mace"){
            monsterLifebar[i].health -= mace.damage;
            monsters[i].sighted = true;
            hit = true;
          }
            
          
      }//end if
      
    }//end for
    
    //BEGIN BULLET/WALL HIT DETECT
    
    for (int i = 0; i < walls.length; i++){
      
      if (xPos <= walls[i].x2 && xPos >= walls[i].x1 && yPos <= walls[i].y2 && yPos >= walls[i].y1){
        
        hit = true;
        
      }
      
    }//end bullet/wall hit detect
    
  }//end shoot
  
}//end of bullet class
float xx = 0;

void draw(){

  //OPENING SCREEN CODE BEGINS HERE**********************************************
  if(gameRunning == false){
    background(40,170,40);
    
    for (int i = 0; i < flowers.length; i++){
        flowershadows[i].display();
        flowers[i].display();
      }
    for (int i = 0; i < trees.length; i++){
        
        trees[i].display();
      }
    for (int i = 0; i < fences.length; i++){
        
        fences[i].display();
      }
    for (int i = 0; i < clouds.length; i++){
        
        clouds[i].display();
        if(clouds[i].xPos <= 10000){
        clouds[i].xPos = clouds[i].xPos + clouds[i].speed;
        }
    else{
          clouds[i].xPos = -5000;
        }
      } 
    
    image(titleScreen, 0, 0);
    //music.play();
    
    textSize(30);
    textAlign(CENTER,CENTER);
    if(xx <= 601){
      if(eqWep == "tomahawk"){
      image(tomahawkGif, xx, 500);
      }
      if(eqWep == "sword"){
      image(swordGif, xx, 500);
      }
      xx+=1;
    }else{
      xx=0;
    }
    
    fill(0);
    textSize(10);
    text("© Alec Ray 2013", width-43, height-10);
    
    textSize(20);
    fill(255);
    text("Press Space to Play", (width/2)+2, 501);
    fill(0);
    text("Press Space to Play", width/2, 500);
    translate(10,0);      
  }//end gamestate
  
  //GAME SCREEN CODE BEGINS HERE**************************************************
  
  if(gameRunning == true){
    if(playerAlive == true){
      
      background(40,170,40);
      
      player.move();
      
      
      for (int i = 0; i < walls.length; i++){
        
        walls[i].hit();//initialize wall collision
        
      }
      player.follow();
      //MONSTER PATROL DISPLAY HIT & LIFEBAR DISPLAY
      for (int i = 0; i < monsters.length; i++){
        
        if (monsters[i].living == true){
          monsters[i].patrol(monsters[i].initxPos,monsters[i].inityPos,200,200);
          monsters[i].display();
          monsters[i].hit();
          monsterLifebar[i].display();    
          monsterLifebar[i].xPos1 = monsters[i].xPos - 10;
          monsterLifebar[i].yPos1 = monsters[i].yPos - 10;
          monsterLifebar[i].yPos2 = monsters[i].yPos - 5;
        }
      }

      //MONSTER DEATH
      for (int i = 0; i < monsters.length; i++){
        if (monsterLifebar[i].health <= 0){
          monsters[i].death(i);
        }//end if
      }//end for
      
      for (int i = 0; i < bullets.size(); i++){//constructs a dynamic list of bullets
        Bullet bullet = (Bullet) bullets.get(i); //casts the ArrayList slots to the type Bullet
       
        bullet.display();
        bullet.shoot();
        
        if (bullet.hit == true || bullet.xPos > player.xPos + width/2 || bullet.xPos < player.xPos - width/2 || bullet.yPos > player.yPos + height/2 || bullet.yPos < player.yPos - height/2){
        //removes bullets when they hit an object or leave the screen
          
          bullets.remove(i);
        }//end if
      }//end list constructor
      
      //BEGIN DISPLAY WALLS
      for (int i = 0; i < walls.length; i++){
        walls[i].display();//display walls
      }

      //BEGIN DISPLAY FLOWERS
      for (int i = 0; i < flowers.length; i++){
        flowershadows[i].display();
        flowers[i].display(); 
      }
      
      //BEGIN REFRESH PLAYER HP BAR
      playerLifebar.xPos1 = player.xPos-50;
      playerLifebar.yPos1 = player.yPos+250; 
      playerLifebar.yPos2 = player.yPos+255;

      //BEGIN LEVEL UP
      if(playerXP.XP >=100){
        playerXP.XP = playerXP.XP - 100;
        playerLevel.level = playerLevel.level + 1;
      }
      //END LEVEL UP      
      
      //DRAW PLAYER MOVEMENT
      //STOP
      if ( playerMovement == 0 && keyPressed == false){
      image(playerStop, player.xPos, player.yPos);
      }
      //UP
      if ( playerMovement == 1 && keyPressed == true){
       image(playerUp, player.xPos, player.yPos);
      }
      //LEFT
      if ( playerMovement == 2 && keyPressed == true){
         image(playerLeft, player.xPos, player.yPos);
      }
      //DOWN
      if ( playerMovement == 3 && keyPressed == true){
         image(playerDown, player.xPos, player.yPos);
      }
      //RIGHT
      if ( playerMovement == 4 && keyPressed == true){
         image(playerRight, player.xPos, player.yPos);
      }
      
      //END DRAW PLAYER MOVEMENT
            
      //BEGIN DEATH      
      if(playerLifebar.health <= 0){
        playerAlive = false;   
        player.ammo = 20;     
      }//end if playerLifebar
      
      player.display();
      
      //BEGIN DISPLAY LIGHTS
      /*for ( int i = 0; i < lights.length; i++){
        
        lights[i].on();
      }*/
      //END DISPLAY LIGHTS

     // if(playerLifebar.xPos1 !=
       
      //BEGIN DISPLAY FENCES
      for (int i = 0; i < fences.length; i++){
        
        fences[i].display();
      }
      //END DISPLAY FENCES
      //BEGIN DISPLAY WEAPON BOXES
      for (int i = 0; i < weaponBoxes.length; i++){
        
        weaponBoxes[i].display();
        weaponBoxes[i].pickUp();
      }
      //BEGIN DISPLAY CLOUD SHADOWS (separate from display clouds so the shadows go behind the trees when necessary)
      for (int i = 0; i < cloudshadows.length; i++){
        
        cloudshadows[i].display();
        if(clouds[i].xPos <= 10000){
        cloudshadows[i].xPos = cloudshadows[i].xPos + cloudshadows[i].speed;
        }
        else{
          cloudshadows[i].xPos = -5000;
        }
      }
      //END DISPLAY CLOUD SHADOWS
      
      //BEGIN DISPLAY TREES
      for (int i = 0; i < trees.length; i++){
        
        trees[i].display();
      }
      for (int i = 0; i < healthboosts.length; i++){
        healthboosts[i].display();
        healthboosts[i].pickUp();
      }
      //END DISPLAY TREES
      
      //BEGIN DISPLAY CLOUDS (separate from display cloud shadows so the shadows go behind the trees when necessary)
      for (int i = 0; i < clouds.length; i++){
        
        clouds[i].display();
        if(clouds[i].xPos <= 10000){
        clouds[i].xPos = clouds[i].xPos + clouds[i].speed;
        }
        else{
          clouds[i].xPos = -5000;
        }
      }
      //END DISPLAY CLOUDS
      
      
      //ALWAYS MAKE THIS DISPLAY LAST SO IT'S ON TOP OF EVERYTHING ELSE
      playerLevel.display(); //display player level
      playerXP.display(); //display player xp
      playerLifebar.display();//DISPLAY THE PLAYER LIFEBAR
      player.ammoDisplay();
      
      //reticle.display();
      
      if (player.ammo == 0) {
    image(noMoreTomahawks, player.xPos-300,player.yPos-300);    
    noMoreTomahawks.noLoop();
  }
  }//END IF PLAYERALIVE == TRUE
  
    if(playerAlive == false){
      background(0);
      textAlign(CENTER);
      fill(255);
      textSize(20);
      translate(-player.countX,-player.countY);
      text("GAME OVER", width/2, height/2);
      text ("PRESS R TO RESTART", width/2, height/2 + 18);
      noLoop();
    }//END IF PLAYERALIVE == FALSE
  }//END IF GAME RUNNING
}//END DRAW

class Expbar {
  
  float XP = 0;
  Expbar(){
    
  }
  
  void display(){
    //WHITE SECTION OF XP BAR, BACKGROUND
    stroke(1);
    fill(255);
    rectMode (CORNERS);
    rect(player.xPos-50, player.yPos+270, player.xPos+50, player.yPos+275);
    //from -10, -10, to +10, -7
    
    //PURPLE SECTION OF XP BAR, WHEN XP INCREASES
    fill (160,0,180);
    rect(player.xPos-50, player.yPos+270, player.xPos-50+XP, player.yPos+275);
    //from -10, -15 to -10+xp, -12
    
  }//end display
  
}//end Expbar
void keyPressed(){
  if (gameRunning == false && key == ' '){
    
      for (int i = 0; i < clouds.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      float rand3 = random(0,1);
      clouds[i] = new Cloud (rand1,rand2,rand3);
      cloudshadows[i] = new CloudShadow (rand1+50,rand2+100,rand3);
    }
    for (int i = 0; i < fences.length; i++){
      fences[i] = new Fence (0 + (i*32), 0);
      walls[i] = new Wall (fences[i].xPos, fences[i].yPos + 10, fences[i].xPos+32, fences[i].yPos + 20);
    }
    for (int i = 0; i < flowers.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      flowers[i] = new Flower (rand1, rand2);
      flowershadows[i] = new FlowerShadow (rand1+20, rand2+27);
    }
    for (int i = 0; i < trees.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      trees[i] = new Tree (rand1, rand2);
      walls[i+100] = new Wall (trees[i].xPos+20, trees[i].yPos+90, trees[i].xPos+100, trees[i].yPos+100);
    }
    for (int i = 0; i < monsters.length; i++){
      int rand1 = int(random(-5000,5000));
      int rand2 = int(random(-5000,5000));
      monsters[i] = new Monster(0.5,32, rand1, rand2);
    }//end for
    gameRunning = true;
    playerAlive = true;
    playerLifebar.health = playerLifebar.maxHP;
  }//end if
}//end keyTyped
void keyTyped() {

  if (key == 'w' || key == 'W') {
    up = true;
    playerMovement = 1;
  }
  if (key == 'a' || key == 'A') {
    left = true;
    playerMovement = 2;
  }
  if (key == 's' || key == 'S') {
    dn = true;
    playerMovement = 3;
  }
  if (key == 'd' || key == 'D') {
    right = true;
    playerMovement = 4;
  }
  if (key == 'k' || key == 'K'){
    for(int i=0; i<monsters.length; i++){
    monsters[i].living = false;
    }
  }
  if(playerAlive == false && (key == 'r' || key == 'R')){
    gameRunning = false;
    playerAlive = true;
    loop ();
  }
}//end of keyPressed

void keyReleased () {

  if (key == 'w' || key == 'W') {
    up = false;
    playerMovement = 0;
  }
  if (key == 'a' || key == 'A') {
    left = false;
    playerMovement = 0;
  }
  if (key == 's' || key == 'S') {
    dn = false;
    playerMovement = 0;
  }
  if (key == 'd' || key == 'D') {
    right = false;
    playerMovement = 0;
  }
  if(playerAlive == false && (key == 'r' || key == 'R')){
    gameRunning = false;
    loop ();
  }
  if(key == 'z' || key == 'Z'){
    String pxp = str(player.xPos);
    String pyp = str(player.yPos);
    String pll = str(playerLevel.level);
    String plh = str(playerLifebar.health);
    String pxx = str(playerXP.XP);
    String pa = str(player.ammo);
    String we = eqWep;
    String[] save = {pxp,pyp,pll,plh,pxx,pa,we};
    saveStrings("saves/save.txt", save);
  }
  /*if(key == 'x' || key == 'X' && playerAlive == false){
      reader = createReader("saves/save.txt");
      
      try {
      loaded = reader.readLine();
      } catch (IOException e) {
      e.printStackTrace();
      loaded = null;
      }
      if (loaded == null) {
        // Stop reading because of an error or file is empty
        noLoop();  
      } else {
        String[] pieces = split(loaded, TAB);
        float pxp = int(pieces[0]);
        float pyp = int(pieces[1]);
        int pll = int(pieces[2]);
        float plh = int(pieces[3]);
        float pxx = int(pieces[4]);
        int pa = int(pieces[5]);
        String we = (pieces[6]);
        player.xPos = pxp;
        player.yPos = pyp;
        playerLevel.level = pll;
        playerLifebar.health = plh;
        playerXP.XP = pxx;
        player.ammo = pa;
        eqWep = we;
      }
        
      }
 */
}//end of keyReleased

void mouseReleased () {

  if (player.ammo > 0) {
    bullets.add (new Bullet (10));
    player.ammo-=1;
  }
}//end mouseReleased

class Level {
  
  int level;
  
  Level(int level_){
    level=level_;
  }
  
  void display(){
    fill(0,0,0);
    textSize(18);
    text(level, player.xPos-200, player.yPos+250);
    
  }//end display
  
}//end Expbar
class Lifebar {
  
  float health;
  float xPos1;
  float yPos1;
  float yPos2;
  float maxHP;
  
  Lifebar(float xPos1_, float yPos1_, float xPos2_, float yPos2_, float health_, float maxHP_ ){
    
    xPos1 = xPos1_;
    yPos1 = yPos1_;
    yPos2 = yPos2_;
    health = health_;
    maxHP = maxHP_;
    
  }
  
  void display(){
    //RED SECTION OF HEALTH BAR, WHEN HEALTH DEPLETES
    stroke(0);
    fill(255,0,0);
    rectMode (CORNERS);
    rect(xPos1,yPos1,xPos1+maxHP,yPos2);
    
    //GREEN SECTION OF HEALTH BAR
    fill(0,255,0);
    rect(xPos1,yPos1,xPos1+health,yPos2);
    //text (health,width-50,height-30);
        
  }//end display
  
}//end lifebar
class Light{
  float xPos;
  float yPos;
  float size;//determines how much area the light lights up
  float c; //determines starting color
  //constructor
  
  Light(float xPos_, float yPos_, float size_, float c_ ){
    xPos=xPos_;
    yPos=yPos_;
    size=size_;
    c=c_;
  }
  
  void on(){
   for(float i = size; i>1; i=i-50){
   fill(255,255,255,1);
   noStroke();
   ellipse(xPos,yPos,i*2,i*2);
    }//end for
  }//end on
}//end light
class Monster
{
  float initxPos;
  float inityPos;
  float xPos;
  float yPos;
  float speed;
  float xSpeed;
  float ySpeed;
  float ang;
  float size;
  float xPatrolReg;
  float yPatrolReg;
  boolean sighted = false;
  boolean living = true;
  
  //inputs are monster speed, patrol box x, patrol box y, patrol box width, patrol box height, monster size
  Monster(float speed_, float size_, float xPos_, float yPos_ ) {
    
    speed = speed_;
    xSpeed = speed;
    ySpeed = 0;
    size = size_;
    xPos = xPos_;
    yPos = yPos_;
    initxPos = xPos_;
    inityPos = yPos_;
    

  }//end of constructor
  
  void display() {
    image(monster_1, xPos, yPos);
    
  }//end display
  
  void patrol(float pX, float pY, float pW, float pH) {//a patrol function. inputs are x,y,width,height
        
    if (sighted == false){ 
      
      if (xPos + size > pX + pW){        
        xSpeed = 0;
        ySpeed = speed; 
        xPos = (pX + pW) - size;
      }
      
      if (yPos + size > pY + pH){
       xSpeed = -speed;
       ySpeed = 0;
       yPos = (pY + pH) - size;
      } 
      
      if (xPos < pX){
        xSpeed = 0;
        ySpeed = -speed;
        xPos = pX;
      }
      
      if (yPos < pY){
        xSpeed = speed;
        ySpeed = 0;
        yPos = pY;
      }
      
    }//end if sighted == false
    
    else {
      speed = 3;
      ang = atan2 (player.yPos - yPos, player.xPos - xPos);
      xSpeed = speed*cos(ang);
      ySpeed = speed*sin(ang);
      
    }//end else
    
    if (dist (player.xPos,player.yPos,xPos,yPos) < 200){
      
      sighted = true;
            
    }//end sight detect
    
    
    
    xPos += xSpeed;
    yPos += ySpeed;
            
  }//end patrol
  
  void hit (){
    
    for (int i = 0; i < walls.length; i++){
    
      //BEGIN MONSTER/WALL HIT DETECT
      if (yPos < walls[i].y2 && yPos > walls[i].y2-speed-1 && xPos < walls[i].x2 && xPos+size > walls[i].x1){
        yPos = walls[i].y2;
      }//end bottom edge
      
      if (yPos+size > walls[i].y1 && yPos+size < walls[i].y1+speed+1 && xPos < walls[i].x2 && xPos + size > walls[i].x1){
        yPos = walls[i].y1 - size;
      }//end top edge
      
      if (xPos < walls[i].x2 && xPos > walls[i].x2-speed-1 && yPos < walls[i].y2 && yPos+size > walls[i].y1){
        xPos = walls[i].x2;
      }//end right edge
      
      if (xPos+size > walls[i].x1 && xPos+size < walls[i].x1+speed+1 && yPos < walls[i].y2 && yPos + size > walls[i].y1){
        xPos = walls[i].x1 - size;
      }//end left edge
      //END MONSTER/WALL HIT
    }
      //BEGIN PLAYER/MONSTER HIT DETECT
      if (player.yPos < yPos+size && player.yPos > yPos+size-player.speed-1 && player.xPos < xPos+size && player.xPos+player.size > xPos){
        player.yPos += speed*5;
        playerLifebar.health -= 10; 
        player.countY -= speed*5;
      }//end bottom edge
      
      if (player.yPos+player.size > yPos && player.yPos+player.size < yPos+player.speed+1 && player.xPos < xPos+size && player.xPos + player.size > xPos){
        player.yPos -= speed*5;
        playerLifebar.health -= 10;
        player.countY += speed*5;
      }//end top edge
      
      if (player.xPos < xPos+size && player.xPos > xPos+size-player.speed-1 && player.yPos < yPos+size && player.yPos+player.size > yPos){
        player.xPos += speed*5;
        playerLifebar.health -= 10;
        player.countX -= speed*5;
      }//end right edge
      
      if (player.xPos+player.size > xPos && player.xPos+player.size < xPos+player.speed+1 && player.yPos < yPos+size && player.yPos + player.size > yPos){
        player.xPos -= speed*5;
        playerLifebar.health -= 10;
        player.countX += speed*5;
      }//end left edge
      //END PLAYER/MONSTER HIT
      
      
    //end for loop
    
  }
  
  void death (int i){
    
    if (living == true){
      
      playerXP.XP +=15;
      
    }
    
    living = false;
    monsters[i] = monsters[monsters.length-1];
    shorten(monsters);
        
  }
  
}//end monsterOne class

boolean up;
boolean right;
boolean dn;
boolean left;

class Player {
  
  float xPos;
  float yPos;
  float speed;
  float size = 32;
  int ammo;
  float countX;
  float countY;
  float tempX;
  float tempY;
  
  Player(float xPos_, float yPos_, float speed_, int ammo_) {
    
    xPos = xPos_;
    yPos = yPos_;
    speed = speed_;
    ammo = ammo_;
}//end of constructor
  
  void display() {
    
    rectMode(CORNER);
    noStroke();
    fill(0,255,255,0);
    rect(xPos,yPos,size,size);//player size is 32x32
    
  }//end display
  
  void move() {
   
    tempX = xPos;
    tempY = yPos;
    
    if(up == true /* && yPos > 0*/){
      yPos -= speed;  
    }
    if(left == true /* && xPos > 0*/){
      xPos -= speed;
    }        
    if(dn == true /* &&  yPos  < height - size*/){
      yPos += speed;
    }
    if(right == true /* && xPos < width - size*/){
      xPos += speed;
    }
    
              
  }//end of move function
  
  void follow() {//function for the "camera" to follow the player
    
    countX += tempX - xPos;
    countY += tempY - yPos;
    translate (countX, countY);
    
  }
  
  void ammoDisplay (){
    
    fill(0);
    text(ammo,xPos+250,yPos+250);
    
  }
  
}//end of player class


class Wall {
  
  float x1;
  float y1;
  float x2;
  float y2;
  
  Wall (float x1_, float y1_, float x2_, float y2_){
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
  }
  
  void display(){
    
    rectMode (CORNERS);
    noStroke();
    fill (0,0,0,0);
    rect (x1, y1, x2, y2);
    
  }
  
  void hit() {
    
    //BEGIN PLAYER HIT DETECT
        //BEGIN PLAYER HIT DETECT
    
    //when you hit the bottom of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && up == true){
      player.yPos = y2;
      
    }//end bottom edge
    
    //when you hit the top of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && dn == true){
      player.yPos = y1 - player.size;
    }//end top edge
    
    //when you hit the right side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && left == true){
      player.xPos = x2;
    }//end right edge
    
    //when you hit the left side of the wall
    if (player.yPos < y2 && player.yPos + player.size > y1 && player.xPos < x2 && player.xPos+player.size > x1 && right == true){
      player.xPos = x1 - player.size;

    }//end left edge

  }//end hit
  
}
class Weapon{
  int damage;
  int ammo;
  String shootGraphic;
  
  Weapon(int damage_, int ammo_, String shootGraphic_){
    damage = damage_;
    ammo = ammo_;
    shootGraphic = shootGraphic_; 
  }
}
    
  
  
class Tree{
  float xPos;
  float yPos;
  
  Tree(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end tree constructor
  
  void display(){
    image(tree_1, xPos, yPos);
  }//end display
}//end tree

class Flower{
  float xPos;
  float yPos;
  
  Flower(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end flower constructor
  
  void display(){
    image(flower_1, xPos, yPos);
  }//end display
}//end Flower

class Fence{
  float xPos;
  float yPos;
  
  Fence(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }//end fence constructor
  
  void display(){
    image(fence_1, xPos, yPos);
  }//end display
}//end Fence

class Cloud{
  float xPos;
  float yPos;
  float speed;
  
  Cloud(float xPos_, float yPos_, float speed_){
    xPos = xPos_;
    yPos = yPos_;
    speed=speed_;
  }
  
  void display(){
    tint(255,255,255,150);
    image(cloud_1, xPos, yPos);
    noTint();
  }//end display
}//end Cloud

class CloudShadow{
  float xPos;
  float yPos;
  float speed;
  
   CloudShadow(float xPos_, float yPos_, float speed_){
    xPos = xPos_;
    yPos = yPos_;
    speed=speed_;
   }
   
   void display(){
     fill(0,0,0,50);
     ellipse(xPos,yPos, 90,20);
   }
}//end CloudShadow
  
class Reticle{
  float xPos;
  float yPos;
  
  Reticle(){
    xPos = mouseX +16;
    yPos = mouseY +16;
  }
  
  void display(){
    image(reticleImg, xPos, yPos);
  }
}//end Reticle
  
class FlowerShadow{
  float xPos;
  float yPos;
  
  FlowerShadow(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }
  void display(){
    fill(0,0,0,50);
    noStroke();
    ellipse(xPos, yPos, 20, 10);
  }//end flowerdisplay
}//end flowershadow

class WeaponBox{
  boolean pickedUp = false;
  float xPos;
  float yPos;
  
  WeaponBox(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }  
  
  void display(){
    if(pickedUp == false){
    image(weaponBox, xPos, yPos);
    }
  }//end display
  boolean d = false;
  void pickUp(){ 
    if(player.xPos+16 >= xPos && player.xPos+16 <= xPos + 32 && player.yPos+16 >= yPos && player.yPos+16 <= yPos+32 && d == false){
      d = true;
      pickedUp = true;
      int which = int(random(1370));
      if(which <= 500){
        eqWep = "tomahawk";
        player.ammo = tomahawk.ammo;
      }
      if(which >=501 && which <=600){
        eqWep = "sword";
        player.ammo = sword.ammo;
      }
      if(which >=601 && which <=750){
        eqWep = "hammer";
        player.ammo = hammer.ammo;
      }
      if(which >= 751 && which <= 800){
        eqWep = "harpoon";
        player.ammo = harpoon.ammo;
      }
      if(which >=801 && which < 1000){
        eqWep = "spear";
        player.ammo = spear.ammo;
      }
      if(which >=1001 && which < 1170){
        eqWep = "axe";
        player.ammo = axe.ammo;
      }
      if(which >= 1171 && which < 1370){
        eqWep = "mace";
        player.ammo = mace.ammo;
      }
    }
  }//end pickUp
}//end WeaponBox

class HealthBoost{
  boolean pickedUp = false;
  float xPos;
  float yPos;
  
  HealthBoost(float xPos_, float yPos_){
    xPos = xPos_;
    yPos = yPos_;
  }
  
  void display(){
    if(pickedUp == false){
    image(healthBoostGif, xPos,yPos);
    }
  }//end display
  
  boolean d = false;
  void pickUp(){ 
    if(player.xPos+16 >= xPos && player.xPos+16 <= xPos + 32 && player.yPos+16 >= yPos && player.yPos+16 <= yPos+32 && d == false){
      d = true;
      pickedUp = true;
      playerLifebar.health = playerLifebar.maxHP;
    }//end if
  }//end pickup
}//end healthboost
  
  
  
  



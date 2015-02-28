
//PICS SETTINGS
String directory = "C:/Users/DavidI/Documents/Processing/Processing/project1_2/img/monsters";
java.io.File dir = new java.io.File(directory);
String[] children = dir.list();

///////
ArrayList joints;
ArrayList monsters;
ArrayList candies;
Pacman pacman;
Monster myMonster;
Hud myHud;
PImage img, bg;
int velocidad=20;
int score;
int numOfCandies;
int numOfMonsters = 4;
int numOfJoints;
void setup() {
  rectMode(CENTER);
  ellipseMode(CENTER);
  size(480, 480);
  bg = loadImage( "C:/Users/DavidI/Documents/Processing/Processing/project/img/rect4.png");
  img = loadImage( "C:/Users/DavidI/Documents/Processing/Processing/project/img/rect2.png");
  joints = new ArrayList();
  candies = new ArrayList();
  monsters = new ArrayList();
  myHud = new Hud();
  Joint tempJoint = new Joint(0, 0, ".");
  
  int left, right, up, down, temp, tempX, tempY;
  int nLOc;
  int[] locArray = new int[4];
  String[] directions = { "LEFT", "RIGHT", "DOWN", "UP" };
  int i;
  tempX = tempY =0;
  //CREATE TEMPORARY OBJECT
  loadPixels();
  // We must also call loadPixels() on the PImage since we are going to read its pixels.  img.loadPixels(); 
  for (int x = 0; x < img.width; x++ ) {
    for (int y = 0; y < img.height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red (img.pixels[loc]);
      float g = green (img.pixels[loc]);
      float b = blue (img.pixels[loc]);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.

      if ((r == 255) && (g == 0) && (b == 0) && (x%20 == 0) && (y%20 == 0)) {
        candies.add( new Candy(x, y, 255));        
      }

      if ((r == 0) && (g == 0) && (b == 0)) {
        candies.add( new Candy(x, y, 255));
        //SET THE X AND Y FOR THIS SPECIAL POINT
        Joint myInter = new Joint(x, y, ".");
        tempX = myInter.myX;
        tempY = myInter.myY;

        //////ln("point: " + tempX + ", " + tempY);

        locArray[0] = (loc - 1);        //LEFT
        locArray[1] = (loc + 1);        //RIGHT
        locArray[2] = (loc) + img.width;//DOWN
        locArray[3] = (loc) - img.width;//UP        
        //FIND PATHS 
        for (i = 0; i < 4; i++) {
          temp = locArray[i];
          // Get the R,G,B values from image
          r = red (img.pixels[temp]);
          g = green (img.pixels[temp]);
          b = blue (img.pixels[temp]);

          if ((r == 255) && (g == 0) && (b == 0)) {
            myInter.directionsArray.add( directions[i] );
          }
        }

        joints.add(myInter);  // Start by adding one element
      } 
      // Set the display pixel to the image pixel
      pixels[loc] = color(r, g, b);
    }
  }

  updatePixels();

  numOfJoints = joints.size();

  
  
  for(int a = 0; a < numOfMonsters; a++){
    monsters.add(new Monster(tempX, tempY, directory  + "/" + children[a]));    
  }
  ///SKETCH PACMAN TAKING THE COORDS FROM THE FIRST INTER FOUND
  tempJoint = (Joint) joints.get(0);
  pacman = new Pacman(tempJoint.myX, tempJoint.myY);
}
//////////////////////////////////
////////////////////////
///////////////*

void draw() {
  background(255);
  image(bg, 0, 0, 480, 480);
  int numOfCandies;
  Candy myCandy = new Candy(0, 0, 255);
  Joint tempJoint = new Joint(0,0,".");
  numOfCandies = candies.size();

  //image(img,0,0,480,480);
  
  pacman.sketch();
  for (int m = 0; m < numOfCandies; m++) {
    myCandy = (Candy) candies.get(m);
    myCandy.sketchEllipse();
    myCandy.seekCollision(pacman);
  }/*
  for (int m = 0; m < numOfJoints; m++) {
    tempJoint = (Joint) joints.get(m);
    tempJoint.sketch();
    tempJoint.seekCollision(pacman);
  }*/
 for (int m = 0; m < numOfMonsters; m++){
  myMonster = (Monster) monsters.get(m); 
  myMonster.deploy();
  myMonster.seekCollision(pacman, myHud);
 } 
  if(score >= numOfCandies){    
    myHud.sketch(score);
    myHud.win();
  } 
  
  myHud.sketch(score);
}

////////////////
/// /CONTROLS ///
////////////////

 
void keyPressed()
{
  if((keyCode==RIGHT) && (pacman.goRight == true))
  {
    pacman.goRight = pacman.goLeft = pacman.goUp = pacman.goDown = false;
    pacman.goLeft = true;
    pacman.goRight = true;
    pacman.x=pacman.x+velocidad;
    pacman.rot=0;
  }
  if((keyCode==LEFT) && (pacman.goLeft == true))
  {    
    pacman.goRight = pacman.goLeft = pacman.goUp = pacman.goDown = false;
    pacman.goRight = true;
    pacman.goLeft = true;
    pacman.x=pacman.x-velocidad;
    pacman.rot=PI;
  }
  if((keyCode==UP) && (pacman.goUp == true))
  {
    pacman.goRight = pacman.goLeft = pacman.goUp = pacman.goDown = false;
    pacman.goDown = true;
    pacman.goUp = true;
    pacman.y=pacman.y-velocidad;
    pacman.rot=-HALF_PI;
  }
  if((keyCode==DOWN) && (pacman.goDown == true))
  {
    pacman.goRight = pacman.goLeft = pacman.goUp = pacman.goDown = false;
    pacman.goUp = true;
    pacman.goDown = true;
    pacman.y=pacman.y+velocidad;
    pacman.rot=HALF_PI;
  }
}
  //////////////
  //    /HUD  ///
  //////////////
  
  class Hud{
    int scoreX = 80;
    int scoreY = 30;
    
    Hud(){
      textAlign(CENTER);
    }
    
    void sketch(int myScore){
      setScore(myScore);
    }
    
    void setScore(int myScore){
      
      textSize(30);
      fill(255, 255, 0);
      text("Score: " + myScore, scoreX, scoreY); 
      return;
    }
    
    void win(){
      
      textSize(60);
      fill(255, 255, 0);      
      text("You Win!", width /2 , height / 2);
      noLoop();
      return;
    }
    void lose(){
      textSize(60);
      fill(255, 255, 0);      
      text("You Lose!", width /2 , height / 2);
      noLoop();
      return;
    }
  }
  
  ////////////////
  //   /PACMAN  ///
  ////////////////
  class Pacman{
    int x=0;
    int y=0;
    int z=0;
    float rot=0;        
    boolean goRight, goLeft, goUp, goDown;
    Joint tempInter;
    ArrayList dirs;
    
     
    Pacman(int _x, int _y){
      x = _x;
      y = _y;
      goRight = goLeft = goUp = goDown = false;
      tempInter = new Joint(0, 0, ".");
      sketch();
    }
    
    
    
    void findInter(){
      int numOfInters = joints.size();
      for(int i = 0; i < numOfInters; i++){
          tempInter = (Joint) joints.get(i);
         if((x ==  tempInter.myX ) && (y == tempInter.myY)){
             //ln("my coors " + x + ", " + y);
             goRight = goLeft = goUp = goDown = false;
             int numOfDirs = tempInter.directionsArray.size();
             for(int m = 0; m < numOfDirs ; m++)
               if(tempInter.directionsArray.get(m) == "RIGHT"){
                       goRight = true;

               }else if(tempInter.directionsArray.get(m) == "LEFT"){
                       goLeft = true;

               }else if(tempInter.directionsArray.get(m) == "UP"){
                       goUp = true;
               }else if(tempInter.directionsArray.get(m) == "DOWN"){
                       goDown = true;
               }
             
         }
         
      }  
      
       return;
    }
    
    void sketch(){
      findInter();
      fill(255,255,0);
      if(z==0)
      {
        z=1;
        arc(x,y,20,20,QUARTER_PI+rot,TWO_PI-QUARTER_PI+rot);
      }
      else
      {
        z=0;
        arc(x,y,20,20,0+rot,TWO_PI+rot);
      }
    }
    
  }
///////////////////////////////////////////
////////////////////
//  /CANDY  ////
////////////////
class Candy {
  int  myY, myX;
  int size = 10;
  int r, g, b, a;
  boolean off;

  Candy(int _myX, int _myY, int _r) {
    r = _r;
    g = 0;
    b = 0;
    a = 255;
    myX = _myX;
    myY = _myY;
    off = false;
    //
  }

  void sketchEllipse() {
    noStroke();
    fill(r, g, b ,a);
    ellipse(myX, myY, size, size);
  }
  
  void sketchRect() {
    noStroke();
    fill(r, g, b);
    rect(myX, myY, size, size);
  }
  
  void seekCollision(Pacman myPacman){
    int collisionX;
    int collisionY;
    collisionX = abs(myX - myPacman.x);
    collisionY = abs(myY - myPacman.y); 
    if((collisionX <= 6) && (collisionY <= 6) && (off == false)){
      score = score + 1;
      off = true;
      a = 0;
      sketchEllipse();      
    }
    return;
  }
}
/////////////
//  /JOINT///
/////////////

class Joint {
  int  myY, myX;
  int size = 40;
  int r, g, b, a;
  boolean off;
  String src;
  PImage img;
  ArrayList directionsArray;


  Joint(int _myX, int _myY ,String _src) {
    
    r = g = b = 255;
    a = 255;
    src = _src;
    myX = _myX;
    myY = _myY;
    off = false;
    directionsArray = new ArrayList();
    //img = loadImage(src);   
    //
  }
  
  void sketch(){
    //image(img,myX,myY,20,20);//
    fill(r, g, b, a);
    ellipse(myX, myY, 10,10);
  }
  
  void seekCollision(Pacman myPacman ){
    
    int collisionX;
    int collisionY;
    //collisionX = abs(myX - myPacman.x);
    //println("myX" + myX);
    //println("pacmanX" + myPacman.x);
    //collisionY = abs(myY - myPacman.y); 
    if((myPacman.x == myX) && (myPacman.y == myY) && (off == false)){
      println("here");
      score = score + 1;
      a = 0;
      off = true;
      sketch();
    }
    return;
  }
   
}
//////////////////////////////////
///  /MONSTER   //////////////
//////////////////

class Monster {
  int myX, myY, dirX, dirY, advanceX, advanceY, race, destX, destY, offset;
  int speed;
  String dir, src;  
  Joint tempInter;
  PImage img;
  boolean off;

  Monster(int _myX, int _myY, String _src) {

    myX = _myX;
    myY = _myY;
    speed = 1;
    offset = 0;
    race = 0;
    src = _src;
    img = loadImage(src);
    tempInter = new Joint(0, 0, ".");
    off = false;
    starting();
  }

  void starting() {
    calculateRun();
  }
  
  void sketch() {
    //fill(0, 255, 0);
    //noStroke();
    //ellipse(myX, myY, 20, 20);
    image(img,myX - 10, myY -10 , 20, 20);
    return;
  }
  
  void seekCollision(Pacman myPacman, Hud aHud ){
    int collisionX;
    int collisionY;
    collisionX = abs(myX - myPacman.x);
    collisionY = abs(myY - myPacman.y); 
    if((collisionX <= 6) && (collisionY <= 6) && (off == false)){
      
      sketch();
      aHud.lose();
    }
    return;
  }

  int comparePosToInter() {

    int numOfInters = 0;
    numOfInters = joints.size();
    if (numOfInters > 0) {
      for (int i = 0; i < numOfInters; i++) {
        tempInter = (Joint) joints.get(i);
        if ((tempInter.myX == myX) && (tempInter.myY == myY)) {
          return i;
        }
      }
    }
    return -1;
  }


  void chooseDir() {

    int index = comparePosToInter();
    float ran;
    int posibles;

    if (index > -1) {
      tempInter = (Joint) joints.get(index);
      posibles = tempInter.directionsArray.size();
      ran = random(0, posibles);
      index = int(ran);

      dir = (String) tempInter.directionsArray.get(index);
      if (dir == "RIGHT") {
        dirX = 1;
        dirY = 0;
      }
      else if (dir == "LEFT") {                  
        dirX = -1;
        dirY = 0;
      }  
      else if (dir == "DOWN") {
        dirX = 0;
        dirY = 1;
      }  
      else if (dir == "UP") {
        dirX = 0;
        dirY = -1;
      }
      return;
    }
    else {      
      dirX = 0;
      dirY = 0;                  
      return;
    }
  }

  void calculateRun() {
    chooseDir();
    advanceX = dirX * speed;
    advanceY = dirY * speed;

    int numOfInters = 0;
    numOfInters = joints.size();
    if (numOfInters > 0) {
      for (int i = 0; i < numOfInters; i++) {
        tempInter = (Joint) joints.get(i);
        if (dir == "RIGHT") {
          if ((tempInter.myX > myX) && (tempInter.myY == myY)) {
            race = abs(tempInter.myX - myX);
            destX = tempInter.myX;
            destY = tempInter.myY;
          }
        }
        else if (dir =="LEFT") {
          if ((tempInter.myX < myX) && (tempInter.myY == myY)) { 
            race = abs(myX - tempInter.myX);                
            destX = tempInter.myX;
            destY = tempInter.myY;
          }
        }
        else if (dir =="DOWN") {
          if ((tempInter.myY > myY) && (tempInter.myX == myX)) {
            race = abs(tempInter.myY - myY);
            destX = tempInter.myX;
            destY = tempInter.myY;
          }
        }
        else if (dir == "UP") {
          if ((tempInter.myY < myY) && (tempInter.myX == myX)) {
            race = abs(myY - tempInter.myY);
            destX = tempInter.myX;
            destY = tempInter.myY;
          }
        }
      }
    }
    else {
      race = 0;
      destX = 0;
      destY = 0;
    }
    return;
  }
  
  void deploy() {
    if ((myX == destX) && (myY == destY) || (offset >= race)) {      
      myX = destX;
      myY = destY;
      ////ln("inDeploy :" + destX + ", " + destY);
      offset = 0;
      calculateRun();
      sketch();
    }
    else {
      myX = myX + advanceX;
      myY = myY + advanceY;
      offset = offset + speed;
      sketch();
    }
    return;
  }
    
}




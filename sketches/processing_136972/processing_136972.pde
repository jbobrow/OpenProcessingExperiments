
PImage back; //Background Blocks
PImage platform; //Platform
PImage latter; //Main Latter
PImage latterr; //Missing Latter Piece
PImage latterrr;
PImage latterrrr;
PImage virus; //Virus
PImage character; //Main Character (Right)
PImage characterleft; //Main Character (Left)
PImage finish;
PFont f; //Initiates Font
float platformX, platformY;
float latterX, latterY;
float latterrrrX, latterrrrY;
float latterrX, latterrY;
float arrowX, arrowY;
float characterX, characterY;
float characterleftX, characterleftY;
float virusX, virusY;
float virussX, virussY;
float backX, backY;
float finishX, finishY;
float latterrrX, latterrrY;
int pos = 2;
int move = 2;
int mooves = 0;
int mooove = 2;
int push = 1;
int latterOn = 1;
int moves = 0;
int scene;
int climb = 1;

void setup() { 
  size(1000, 600);
  backX = 0;
  backY = 0;
  latterX = 300;
  latterY = 500;
  latterrX = 600;
  latterrY = 500;
  latterrrX = 300;
  latterrrY = 300;
  latterrrrX = 600;
  latterrrrY = 300;
  platformX = 350;
  platformY = 300;
  characterX = 100;
  finishX = 945;
  finishY = 250;
  characterY = 500;
  virusX = 900;
  virusY = 500;
  virussX = 900;
  virussY = 500;
  back = loadImage("back.png");
  latter = loadImage("latter.png");
  latterr = loadImage("latterr.png");
  latterrr = loadImage("latterrr.png");
  platform = loadImage("platform.png");
  character = loadImage("character.png");
  virus = loadImage("virus.png");
  finish = loadImage("finish.png");
  latterrrr = loadImage("latterrrr.png");
  f = createFont("Arial", 10, true);
  textFont(f, 24);
  scene = 0;
}

void draw() {
  switch (scene) {
  case 0:
    background(54); 
    text("A virus is destroying the internet!", 300, 100);
    text("Rebuild the paths in cyber space to get back home", 200, 150);
    text("and avoid the virus before it gets you too!", 255, 200);
    text("[Click To Begin]", 400, 400);
    image(character, characterX, characterY);
    characterX = characterX + 5;

    if (mousePressed) {
      scene = 1;
      characterX = 100;
      virusX = 900;
    }
    break;
  case 1:
    background(0);
    println(characterY);
    image(back, backX, backY);
    image(latterr, latterrX, latterrY); 
    image(latter, latterX, latterY-50);
    image(latter, latterX, latterY-100);
    image(latter, latterX, latterY-150);
    image(latter, latterX, latterY-200);
    image(platform, platformX, platformY);
    image(platform, platformX+300, platformY);
    image(character, characterX, characterY);
    image(finish, finishX, finishY);
    image(virus, virusX, virusY);
    text("Moves:" + " " +(31-mooves), 100, 100);
    if (characterY <=49) { //Top Boundary
      characterY = 50;
    }
    if (characterX >=900 && characterY <= 249) { //Right Boundary
      characterX = 901;
    }
    if (characterX >=900 && characterY >= 251) { //Right Boundary
      characterX = 901;
    }
    if (characterX <=49) { //Left Boundary
      characterX = 50;
    }
    if (characterX == 600 && characterY >= 500) { //Character Moves Up On Box 
      characterX = 600;
      characterY = 450;
    }
    if (characterX == 550 && characterY == 450) { //Character Falls Off Box To Left 
      characterX = 550;
      characterY = 500;
    }
    if (characterY ==450 && characterX == 650) { //Character Fals Off Box To Right
      characterY = 500;
    }
    if (virusX <=650) { //Sends Virus Right
      move = 1;
    }
    if (move == 1) { //Sends Virus Right
      virusX=virusX+5;
    }
    if (virusX >=900) { //Sends Virus Left
      move = 2;
    }
    if (move == 2) { //Sends Virus Left
      virusX=virusX-5;
    }
    if (characterX == virusX-50 && characterY == 500) { //Left Virus Collision 
      scene = 4;
    }
    if (characterX == virusX+50 && characterY == 500) { //Right Virus Collision
      characterX = 100;
      scene = 4;
    }
    if (characterX >= 601) { //Turns Box Pushing On
      latterOn = 2;
    }
    if (latterOn == 2) { //Box Pushing On
      latterrX = characterX - 50;
    }
    if (latterrX <= 300) { //Stops Latter Piece At Latter
      latterrX = 300;
      latterOn  = 1;
    }
    if (latterOn == 1) { //Stops Latter Piece At Latter
      latterrX = latterrX;
    }
    if (characterY == 250) { //Holds Latter Once Character Starts Moving On Platform
      latterrX = 300;
    }
    if (characterX == 300 && latterrX == 300) { //Sends Character Up The Latter
      characterY = characterY - 5;
    }
    if (characterY <= 250) { //Character Stops At The Top Of The Latter
      characterY = 250;
    }
    if (characterX >= 300 && characterY <= 250) { 
      characterY = 250;
    }
    if (characterY == 450 && latterrX == characterX - 50) { //Character Won't Move Up On Old Latter Position
      characterY = 500;
    }
    if (moves >=32) { //Resets Level If Moves Run Out
      scene = 4;
    }
    if (characterX == 250 && characterY >= 250) { //Character Falls Off Full Latter To The Left
      characterY = characterY + 5;
    }
    if (characterX == 350 && characterY >= 251) { //Character Falls Off Full Latter To The Right
      characterY = characterY + 5;
    }
    if (characterY >= 500) { //Ground Detection
      characterY = 500;
    }
    if (characterY == 250 && characterX >= 900) { //End Level
      scene = 2;
      characterX = 100;
      characterY = 500;
      mooves = 0;
    }
    break;
  case 2:
  println(characterX);
    background(255);
    image(back, backX, backY);
    image(platform, platformX+100, platformY+50);
    image(platform, platformX-250, platformY+50);
    image(latter, latterX+100, latterY-50);
    image(latter, latterX+100, latterY-100);
    image(latter, latterX+100, latterY-150);
    image(latter, latterX+100, latterY);
    image(latterrrr, latterrrrX, latterrrrY);
    image(latter, latterX+450, latterY-100); //Base Latter
    image(latter, latterX+500, latterY-100); //Base Latter
    image(latter, latterX+550, latterY-100); //Base Latter
    image(latter, latterX-250, latterY-150); //Base Latter
    image(latter, latterX+450, latterY-150); //Base Latter
    image(latter, latterX+600, latterY-100); //Base Latter
    //image(latter, latterX-150, latterY-150); //Base Latter
    image(latterrr, latterrrX, latterrrY);//THIS IS THE FIRST MOVE BLOCK
    image(virus, virusX-350, virusY-200);
    image(finish, finishX, finishY+50);
    image(character, characterX, characterY);
    text("Moves:" + " " +(26-mooves), 100, 100);
 
 
     if (mooves >=26) { //Resets Level If Moves Run Out
     scene = 4;
  }

    if (virusX <= latterrrX + 400) { //Sends Virus Right
      move = 1;
    }
    if (move == 1) { //Sends Virus Right
      virusX=virusX+5;
    }
    if (virusX == latterrrrX+300) { //Sends Virus Left
      move = 2;
    }
    if (move == 2) { //Sends Virus Left
      virusX=virusX-5;
    }
    if (characterY <=49) { //Top Boundary
      characterY = 50;
    }
    if (characterX >=900 && characterY <= 299) { //Right Boundary
      characterX = 901;
    }
    if (characterX >=900 && characterY >= 301) { //Right Boundary
      characterX = 901;
    }
    if (characterX <=49) { //Left Boundary
      characterX = 50;
    }
    if (characterY <= 300) { //Stops At Top Of Latter
      characterY = 300;
    }
    if (characterX <= 250 && characterY == 300) { //Turns Push On
      push = 2;
    }
    if (push == 2) { //Pushes Latter
      latterrrX = characterX + 50;
    }
    if (characterX >= 800 && characterY <=350) { //Character falls to right of platforms on latters
      characterY = 350;
    }
    if (latterrrX >= 550) { 
      latterrrrX = latterrrX +100;
    } 
    if (characterX == 750 && latterrrX == 800) { //Pushed Objects Fall
      virusX = 1200;
      virusY = 550;
      latterrrrX = 900;
      latterrrrY = 350;
      latterrrX = 800;
      latterrrY = 350;
    }
    if (virusX >= 1200) {
      virusX = 1200;
    }
    if (latterrrrX >= 900) {
      latterrrrX = 900;
    }
    if (latterrrX >= 800) {
      latterrrX = 800;
      characterY = 300;
    }
    if (latterrrX == 300 && characterX >= 550 && characterY == 300) {
      latterrrrX  = characterX + 50;
    }
    if (characterX == 750 && characterY == 300 && latterrrX == 300) {
      latterrrrY = 350;
    }
    if (latterrrrY >= 350) {
      latterrrrY = 350;
    }
    if (latterrrrX <= 800 && latterrrrY == 350) {
      latterrrrX = 800;
    }
    if (characterY <= 400 && characterY >= 301 && characterX >= 400) {
      characterX = 400;
    }
    if (characterY <= 400 && characterY >= 301 && characterX <= 400) {
      characterX = 400;
    }
    if (characterY >= 351 && characterX <= 399) {
      characterY = characterY + 5;
    }
    if (characterY >= 351 && characterX >= 401) {
      characterY = characterY + 5;
    }
    if (characterY >= 500) {
      characterY = 500;
    }
    if (characterX == 400 && characterY>= 300) { //Sends Up Latter
       characterY = characterY - 5;
    }
   if (mooves >= 26) {
      scene = 4;
   }
    if (characterX == 950 && characterY == 300) {
      characterX = 100;
      characterY = 500;
      scene = 3;
        backX = 0;
  backY = 0;
  latterX = 300;
  latterY = 500;
  latterrX = 600;
  latterrY = 500;
  latterrrX = 300;
  latterrrY = 300;
  latterrrrX = 600;
  latterrrrY = 300;
  platformX = 350;
  platformY = 300;
  characterX = 100;
  finishX = 945;
  finishY = 250;
  characterY = 500;
  virusX = 900;
  virusY = 500;
  virussX = 900;
  virussY = 500;
    }
    break;
  case 3:
  println(virusY);
    background(255);
    image(back, backX, backY);
    image(latter, latterX+150, latterY-50);
    image(latter, latterX+150, latterY-100);
    image(latter, latterX+150, latterY-150);
    image(latter, latterX+150, latterY);
    image(latter, latterX+150, latterY-200);
    image(latter, latterX+150, latterY-250); 
    image(latter, latterX+150, latterY-300);
    image(latter, latterX+150, latterY-350);
    image(latter, latterX+150, latterY-400);
    image(latter, latterX+150, latterY-450);
    image(finish, latterX+150, latterY-500);
    image(virus, virusX-650, virusY-150);
    image(virus, virussX-250, virussY-300);
    image(virus, virusX-650, virusY-450);
    image(character, characterX, characterY);
    image(platform, platformX-200, platformY+100);
    image(platform, platformX+150, platformY+100);
    image(platform, platformX-200, platformY-50);
    image(platform, platformX+150, platformY-50);
    image(platform, platformX-200, platformY-200);
    image(platform, platformX+150, platformY-200);
       println(characterX);
    if(virusX <= 900){
      mooove = 2;
   }
    if(mooove == 2){
      virusX = virusX + 5;
      virussX = virussX - 5;
    }
    if(virusX >= 1300){
      mooove = 1;
    }
      
    if(mooove == 1){
      virusX = virusX - 5;
      virussX = virussX + 5;
    }
    if(characterX == 450){
      characterY = characterY -5;
    }
    if(characterY <= 0){ //End Game WIN
      scene = 5;
    }

      
    break;
  case 4:
    background(54);
    text("Mission Failed. Refresh Page To Start Over", 300, 100);
    break;
    case 5:
    background(54);
    text("You made it back to the real world and saved the internet! Congrats!", 100, 100);
    
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    characterX = characterX + 50;
    character = loadImage("character.png"); //Loads Right Character
    moves = moves+1; //Adds 1 Move
    mooves = mooves + 1;
  }
  if (keyCode == LEFT) {
    characterX = characterX - 50;
    character = loadImage("characterleft.png"); //Loads Left Character
    moves = moves+ 1; //Adds 1 Move
    mooves = mooves + 1;
  }
}




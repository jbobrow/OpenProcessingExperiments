
 //Exercise 5 
// Its a game
// about the darkness
// by natalie siderius


int story = 1;
int caveCount = 0;

float X1 = 100;
float Y1 = 445;
float girlX = 400; // establishing initial location for girl
float girlY = 280;
float armX;
float armY;
float flashlightX = girlX + 100; //establishing the light shape location
float flashlightY = girlY + 81; // in reference to girl
float x, y;
int fallCount = 0;
float torchX = 850;
float keyX = 120;
float keyY = 197;
int gH = 138;
int gW = 62;
  int daisycounter = 0;
import ddf.minim.*;  //import minim library
Minim minim;
AudioInput input;
AudioPlayer caveSong;
AudioPlayer endSong;
PImage girl;
PImage girl2;
PImage arm;
PImage arm2;
PImage flashLight;
PImage darkFall;
PImage eyes;
PImage torch;
PImage door;
PImage thekey;
PImage atTheDoor;
PImage keygirl;
PImage halo;
PImage whereisthekey;
PImage necklace;
PImage girlNothing;
PImage onec;
PImage twoc;
PImage garden;
PImage hole;
PImage daisy;
PImage heart;
PImage endgirl;
PImage end; 
PImage daisyfall;


int jumpCounter = 0;
float frameY;

boolean keyup = false;
boolean keyright = false;
boolean keyleft = false;
boolean keydown = false;
boolean down = true;
boolean edge = false;

boolean flashlight = false;

boolean locked = true;
boolean keyAppear = false;
boolean hasKey = false;
boolean atDoor = false;
boolean daisyT = false;



void setup() {

  size (900, 600); // draw canvas
  //background(20, 20, 40); old color blue
  background(40, 40, 40);
  frameRate(100);
  minim = new Minim( this );  //get a new minim object
  input = minim.getLineIn();
  caveSong = minim.loadFile("cavesongloop.mp3");
  endSong = minim.loadFile("lucky.mp3");
  girl = loadImage("girl.png");
  girl2 = loadImage("girl2.png");
  arm = loadImage("arm.png");
  arm2 = loadImage("arm.png");
  flashLight = loadImage("flashlight.png");
  darkFall = loadImage("fall.png");
  eyes = loadImage("girlEyes.png");
  torch = loadImage("torch.png");
  door = loadImage("door.png");
  thekey = loadImage("key.png");
  atTheDoor = loadImage("atdoor.png");
  keygirl = loadImage("keygirl.png");
  halo = loadImage("halo.png");
  whereisthekey = loadImage("key?.png");
  necklace = loadImage("necklace.png");
  girlNothing = loadImage("nothing.png");
  onec =loadImage("1c.png");
  twoc = loadImage("2c.png");
  garden = loadImage("garden.png");
  hole = loadImage("hole.png");
  daisy = loadImage("daisy.png");
  heart = loadImage("heart.png");
  endgirl = loadImage("endgirl.png");
  end = loadImage("end.png");
    daisyfall = loadImage("daisyfall.png");
}



void draw() {


  // P.S. girl is 60px wide(x) & 140px tall(y)
  println("girlx " + girlX + " girly " + girlY);
  println("x " + mouseX + "y " + mouseY);

  // CALL BACKGROUND
  background(40, 40, 40); 


  if (story == 1) {
    Begin();
  }

  if (story == 2) {
    theFall();
  } 

  if (story == 3) {
    theCave();
  }
  
  if (story == 4) {
   End(); 
  }
}


// IF A KEY IS PRESSED & HELD DOWN
void keyPressed() {

  if (keyCode == UP) { 
    keyup = true;
  }
  if (keyCode == LEFT) { 
    keyleft = true;
  }
  if (keyCode == RIGHT) { 
    keyright = true;
  }
  if (keyCode == DOWN) { 
    keydown = true;
  }
}


// WHEN KEY IS NOT BEING HELD DOWN
void keyReleased() {

  if (keyCode == UP) {
    keyup = false;
  }

  if (keyCode == LEFT) { 
    keyleft = false;
  }
  if (keyCode == RIGHT) { 
    keyright = false;
  }

  if (keyCode == DOWN) {
    keydown = false;
  }
}

void Begin () {
  
  
  
  if (Y1 > 600) {
    story =2;
  }
  image(garden, 0, 0);
  image(girlNothing, X1, Y1);
  
    if (daisyT == false) {
  image(daisy, 200, 560);
  } if (daisyT == true) {
    image(daisy, X1, Y1);
  }
  
  if (X1 > 400) {
  image(hole, 0, 0);
  }

  if (X1 > 130 && X1 < 250 && Y1 < 460) {
    if (keydown == true) {
      daisyT = true;
      image(heart, X1, Y1);
    }
  }

  if ((Y1 < 20)){
    down = false;
  }  if (X1 < 399 && Y1 > 430 && Y1 < 460){
  down = false;
}
  else {
    down = true;
  }
  

  if (X1 < 60) {
    X1 = X1 +5;
  }

  if (down == false) { // when she hits a block she doesnt move down
    Y1 = Y1;
  }

  if (down == true) { // basically, she will fall until
    Y1 = Y1+5; // she hits a block
  } 


  // NAVIGATE WITH KEYSTROKES
  if (keyright == true) {
    X1 = X1 +4;
  }

  if (keyleft == true) {
    X1 = X1 -4;
  }
  if (keyup == true) {
        Y1 = Y1 - 20;
  }
}

void End() {


  daisycounter++;
    println("daisys" + daisycounter);

  endSong.play();
  image(end, 0, 0);
  image(endgirl, X1, Y1);
  if (daisycounter < 330) { 
image(daisyfall, 0, ((-330) + daisycounter));
  } if (daisycounter > 330) {
    daisycounter =0;
  }
  
  if (X1 > 350 && X1 < 600) {
  image(hole, 0, 0);
  Y1  = Y1 - 50;
 X1 = X1 - 5;
  }

  if (X1 > 170 && X1 < 250 && Y1 < 460) {
    if (keydown == true) {
      daisyT = true;
    }
  }

  if ((Y1 < 20)){
    down = false;
  }  if (X1 < 399 && Y1 > 430 && Y1 < 460){
  down = false;
}
  else {
    down = true;
  }
  

  if (X1 < 60) {
    X1 = X1 +5;
  }

  if (down == false) { // when she hits a block she doesnt move down
    Y1 = Y1;
  }

  if (down == true) { // basically, she will fall until
    Y1 = Y1+10; // she hits a block
  } 


  // NAVIGATE WITH KEYSTROKES
  if (keyright == true) {
    X1 = X1 +4;
  }

  if (keyleft == true) {
    X1 = X1 -4;
  }
  if (keyup == true) {
        Y1 = Y1 - 20;
  }
  
}
void theCave() {


  /* FRAME FOLLOW
   frameY = 800-girlY; //distance from top of girl to bottom
   if (frameY < 250) {
   translate(0, -250);
   }
   */

  // cave size is (900, 600);


  fill(15, 15, 20);
  noStroke();

println(caveCount);

  if (caveCount == -1) {
    Cave0d();
  } 
  if (caveCount == 0) {
    Cave0c();
  } 
  if (caveCount == 1) {
    Cave0b();
  } 
  if (caveCount == 2) {
    Cave0a();
  } 

  if (caveCount == 6) {
    TopCave();
  }

  if (atDoor == true) {
    atDoor();
  } 
  else {
    Torch();

    if (keyAppear == true) {
      image(thekey, keyX, keyY);
    }
    if (hasKey == true) {
      keyAppear = false;
    }
  }

  println(hasKey);

  // P.S. girl is 60px wide(x) & 140px tall(y)





  // FALLING RATES
  if (down == false) { // when she hits a block she doesnt move down
    girlY = girlY;
  }

  if (down == true) { // basically, she will fall until
    girlY = girlY+5; // she hits a block
  } 


  // NAVIGATE WITH KEYSTROKES
  if (keyright == true) {
    girlX = girlX +4;
  }

  if (keyleft == true) {
    girlX = girlX -4;
  }

  //if (keyup == true) {
  //  if (jumpCounter <600 && jumpCounter > 0) {
  // girlY = girlY - 7;
  // jumpCounter = jumpCounter - 1;
  // } 

  // } 
  // else {
  //   girlY = girlY;
  // }





  if (keyup == true) {
    //   if (jumpCounter == 600) {
    //girlY = girlY - 7;
    girlY = girlY - 20;
    //jumpCounter= jumpCounter - 1;
    //} else {
    // keyup = false;
    // }
  }


  // jumpCounter++;}
  //   else {
  //jumpCounter = 0;
  //keyup = false; 
  //}
}

void TopCave() {
  image(door, 0, 0);

  if (girlY > 599) {
   
    caveCount = 0;
    girlY = 5;
   
  } 


  noStroke();
  fill(0,0,0);
  rect(85, 230, 100, 10);
  if ((girlX >347 && girlX < 522 && girlY > (334-gH) && girlY < (368 -gH))|
  (girlX > 578 && girlX < 810 && girlY > (390) && girlY < (398)) |
    (girlX > 85 && girlX < 185 && girlY > 90 && girlY <110)) {
    down = false; // then girl will stop falling
    jumpCounter = 600;
  } 
  else { // otherwise the girl will keep falling
    down = true;
  }

   if (girlX > 85 && girlX < 185 && girlY > 90 && girlY <110) {
    atDoor = true; 
   }
  
  
}



void atDoor(){
  image(atTheDoor,0,0);
  fill(0,0,0);
  noStroke();
  rect(85, 230, 100, 10);

  if (hasKey == true) {
   image(halo, -250, -300);
  image(keygirl, girlX,92);
  if (keydown == true) {
   story = 4; 
   X1 = 410;
   Y1 = 600;
   caveSong.pause();
  }
  } else {
   image(halo, -250, -300);
   image(girlNothing, girlX, 92);
   if(keydown == true) {
  image(whereisthekey, girlX,92);
   }
  }
  if (girlX > 180 || girlX < 20) {
   atDoor = false; 
   girlY = 92;
  }
  
  
}
void Torch() {

  if (flashlight == true) {
      drawGirl();
    if (keydown == true) {
      torchX = girlX;
      flashlight = false;
    } 
  }
  
  
if (flashlight == false) {
    drawEyes();
    if(caveCount == -1) {
    image(torch, torchX, 498);
    }
    if ((girlX + 70) >= torchX) {
      if (keydown == true) {
        flashlight = true;
      }
    }
  }
  


}

void Cave0c() {
  noStroke();
  rect(0, 500, 900, 100); //floor of cave

  if (girlX < 0) {
    caveCount = 1;
    girlX = 840;
  }

  if (girlX > 850) {
    caveCount = -1;  
    girlX = 1;
  } 
  rect(0, 500, 900, 100); //floor of cave
  rect(-10, 518, 300, 20, 10);
  rect(380, 400, 80, 20, 10);
  rect(540, 350, 80, 20, 10);
  rect(720, 200, 185, 20, 10);
  rect(578, 100, 91, 20, 10);
  if ((girlY > 362)  |
    // BLOCK1 rect(-10, 518, 300, 20, 10);
  (girlX < 268 && girlY > 380 && girlY < 390) | //OR
  //BLOCK2 rect(380, 400, 80, 20, 10);
  (girlX > 330 && girlX < 430 && girlY > 262 && girlY < 272) | //OR
  //BLOCK3 rect(540, 350, 80, 20, 10);
  (girlX > 490 && girlX < 590 && girlY > 212 && girlY <222) | //OR
  //BLOCK4 rect(720, 200, 185, 20, 10); 
  (girlX > 670 && girlY > 60 && girlY <70)|
    //block5 (540, 200, 40, 20, 10)
  (girlX > 560 && girlX < 620 && girlY > (100-gH) && girlY < (120-gH))) {
    down = false; // then girl will stop falling
    jumpCounter = 600;
  }
  else { // otherwise the girl will keep falling
    down = true;
  }
  
  if (girlX > 550 && girlX < 620 && girlY > -36 && girlY < -30) {
    caveCount =6; 
    girlY = 397;
  }
}

void Cave0b() {

  noStroke();
  rect(0, 500, 900, 100);
      rect(100, 200, 50, 20);
  if ((girlY > 362) |
 (girlX > 100 && girlX < 180 && girlY > 60 && girlY < 65)) {
    down = false; // then girl will stop falling
    jumpCounter = 600;
  } 
  else { // otherwise the girl will keep falling
    down = true;
  }

  if (girlX > 850) {
    caveCount = 0;  
    girlX = 1;
  }
  if (girlX < 0) {
    caveCount = 2;
    girlX = 840;
  }
  
  
  
if (girlX > (keyX-80) && girlX < (keyX+25)) {
    if (keydown == true) {
      hasKey = true;
    }
  }

    if (hasKey ==false ) {
        if (mouseX > keyX && mouseX < (keyX+30) && mouseY > (keyY-10) && mouseY < (keyY + 20)) {
    keyAppear = true;
  } 
      image(thekey, keyX, keyY);
    }
  
  
  
}
void Cave0d () {

  noStroke();
  rect(0, 500, 900, 100); //floor of cave

  if (girlY > 362) {
    down = false; // then girl will stop falling
    jumpCounter = 600;
  } 
  else { // otherwise the girl will keep falling
    down = true;
  }

  if (girlX < 0) {
    caveCount = 0;
    girlX = 840;
  }

  fill(0, 0, 0);
  rect(870, 0, 30, 600);
  if (girlX > 840) {
    girlX = girlX -5;
  }
}


void Cave0a () {
  noStroke();
  rect(0, 500, 900, 100);
  if (girlY > 362) {
    down = false; // then girl will stop falling
    jumpCounter = 600;
  } 
  else { // otherwise the girl will keep falling
    down = true;
  }

  if (girlX > 850) {
    caveCount = 1;  
    girlX = 1;
  }
  fill(0, 0, 0);
  rect(0, 0, 30, 600);
  if (girlX < 60) {
    girlX = girlX +5;
  }
  

}

void drawGirl() {

  // DRAW GIRL
  armX = girlX + 45; //these values establish position of shoulder 
  armY = girlY + 64; // in relation to girl PNG
  float dy = mouseY- armY; // distance between mouse & shoulder
  float dx = mouseX - armX; 
  float angle1 = atan2(dy, dx); // finds the angle of rotation for arm 

  // FACE FORWARD
  if (dx > 0) { // if the mouse is right of the girls position, 

      flashlightForward(armX, armY, angle1); //flashlight & arm is called
    image(girl, girlX, girlY); // and appropriate jpeg is generated
    if (hasKey == true) {
      image(necklace, girlX, girlY);
    }
  } 

  // FACE BACKWARDS
  else { // if the mouse is left of the girls position

      armX = girlX +16;
      armY = girlY +65; // adjust for new shoulder position
      flashlightBackward(armX, armY, angle1);
   

    image(girl2, girlX, girlY);
    if (hasKey == true) {
    image(necklace, girlX-10, girlY); 
      
    }
  }
}

void drawEyes() {
  background(0,0,0);
  image(eyes, girlX, girlY);
}
 
 // IF SHE'S POINTING FLASHLIGHT TO RIGHT
void flashlightForward(float x, float y, float a) {

  pushMatrix();
  translate(x, y);
  rotate(a);
  //make some light
  flashlightX =50;
  flashlightY = 22;
  stroke(0, 0, 0);
  strokeWeight(4);

  // make it dark
  beginShape();
  //fill(20, 20, 40); old blue color
  fill(0,0,0);
  vertex( flashlightX +2000, flashlightY -200);
  vertex(flashlightX, flashlightY);
  vertex(flashlightX, flashlightY + 3);
  vertex(flashlightX + 2000, flashlightY + 190);
  vertex(2000, 2000);
  vertex(-2000, 2000);
  vertex(-2000, -2000);
  vertex(2000, -2000);
  vertex( flashlightX +2000, flashlightY -200);
  endShape(CLOSE);


  //make some light
  fill (255, 255, 255, 80);
  noStroke();
  /* old flashlight
  beginShape();
  vertex(flashlightX, flashlightY);
  vertex(flashlightX, flashlightY + 3);
  vertex(flashlightX + 2000, flashlightY + 400);
  vertex( flashlightX +2000, flashlightY -400);
  endShape(CLOSE);
  */

  image(flashLight, 0,-72);
  image(arm, 0, 0);
  popMatrix();
}
  
  
  
  
  
  
  
  
  
  
  // IF SHE'S POINTING FLASHLIGHT TO LEFT
void flashlightBackward(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  flashlightX =50;
  flashlightY = -25;
  
    // make it dark
  beginShape();
  fill(0, 0, 0);
  vertex( flashlightX +2000, flashlightY -200);
  vertex(flashlightX, flashlightY);
  vertex(flashlightX, flashlightY + 3);
  vertex(flashlightX + 2000, flashlightY + 190);
  vertex(2000, 2000);
  vertex(-2000, 2000);
  vertex(-2000, -2000);
  vertex(2000, -2000);
  vertex( flashlightX +2000, flashlightY -200);
  endShape(CLOSE);


  scale(1.0, -1.0);
  image(flashLight, 0,-72);
  image(arm, 0, 0);
  popMatrix();
}
 
void theFall() {
    caveSong.play();
  if (fallCount <2500) {
    image(girlNothing, 400, 280);
    image(darkFall, 0, -fallCount);
    image(eyes, 400, 280);
    fallCount = fallCount + 20;
  } 
  else {
    story = 3;
  }
}




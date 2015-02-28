
//import ddf.minim.*;

//Minim minim;
//AudioSample laserSound;
//AudioSample startSound;
//AudioSample explodeSound;

//add gorilla1 and 2 image and puppys images

//for sizing
float gorillaSizeX = 500;
int sizeSpeed = 10;
float rotation;

float gorillaSizeY = 300;

float gorillaY;
float gorillaX;
PImage gorilla;
PImage gorilla1;
PImage gorilla2;
PImage gorillaHead;
PImage gorillaBelly;
PImage gorillaRightPec;
PImage gorillaLeftPec;
PImage gorillaRightLeg;
PImage gorillaLeftLeg;
PImage gorillaLeftShoulder;
PImage gorillaLeftHip;
PImage gorillaRightArm;
PImage gorillaLeftArm;
PImage[] gorillaParts = new PImage[10];

PImage puppy;
PImage title1;
PImage title2;
int velocityGY;
int velocityGX;
int level;
int counter;
int puppyCounter;

//int score 0;
float puppyX;
float puppyY;
//puppy size parameters
int puppyWidth = 203;
int puppyHeight = 241;
int puppySpeed = 5;
float partY = 0;
float partX = 0;
float[] partsX = new float [10];
float partSpeedY = -6;
float partYFriction = 0;
float gravity = 0.02;
float[] partsSpeedX = new float [10];

int gorillaHit = 0;
boolean gorillaHit1 = false;

boolean puppyUP = false;
boolean puppyDOWN = false;
boolean puppyLEFT =   false;
boolean puppyRIGHT = false;
boolean secondGorilla = false;
boolean secondPuppy = false;
boolean title2show = false;
boolean gorillaRotating = false;
boolean explosionPlayed = false;

void setup() {
  smooth();

  //minim = new Minim(this);

  //laserSound = minim.loadSample("laser.wav");
  //startSound = minim.loadSample("start.wav");
  //explodeSound = minim.loadSample("fanfare.wav");

  gorilla1 = loadImage("GORILLA_RAWR.png");
  gorilla2 = loadImage("GORILLA_RAWR2.png");
  gorilla = gorilla1;

  gorillaHead = loadImage("gorillaHead.png");
  gorillaBelly = loadImage("GORILLA_belly.png");
  gorillaRightPec = loadImage("GORILLA_RightPex.png");
  gorillaLeftPec = loadImage("GORILLA_LeftPex.png");
  gorillaRightLeg = loadImage("GORILLA_RightLeg.png");
  gorillaLeftLeg = loadImage("GORILLA_LeftLeg.png");
  gorillaLeftShoulder = loadImage("GORILLA_LeftShoulder.png");
  gorillaLeftHip = loadImage("GORILLA_LeftHip.png");
  gorillaRightArm = loadImage("GORILLA_ArmRight.png");
  gorillaLeftArm = loadImage("GORILLA_LeftArm.png");  

  gorillaParts[0] = gorillaHead;
  gorillaParts[1] = gorillaBelly;
  gorillaParts[2] = gorillaRightPec;
  gorillaParts[3] = gorillaLeftPec;
  gorillaParts[4] = gorillaRightLeg;
  gorillaParts[5] = gorillaLeftLeg;
  gorillaParts[6] = gorillaLeftShoulder;
  gorillaParts[7] = gorillaLeftHip;
  gorillaParts[8] = gorillaRightArm;
  gorillaParts[9] = gorillaLeftArm;


  for (int i=0; i<=9; i++) {
    partsSpeedX[i] = random(-0.5, 4);
    //println("Index: "+i+" is "+partsSpeedX[i]);
  }

  //Make sure Gorilla head goes in positive X direction
  partsSpeedX[0] = abs(partsSpeedX[0]);

  for (int i=0; i<=9; i++) {
    partsX[i] = 0;
  }


  puppy = loadImage("puppy.png");
  title1 = loadImage("GAME_TITLE1.png");
  title2 = loadImage("GAME_TITLE2.png");
  size(800, 600);
  velocityGY = 5;
  velocityGX = 7;
  puppyX = width-puppyWidth-10;
  puppyY = height/2-puppyHeight/2;
  counter = 0;
  puppyCounter = 0;
  frameRate(60);
  rotation = 0;
}


void draw() {
  background(0);

  //not animating!!! argh
  if (level==0) {
    /*background(0);
     textSize(40);
     text("Click to start", width/2-160, height/2+200);
     text("Puppy V.S. Gorilla!", width/2-200, height/2);*/
    image(title1, 0, 0, width, height);  



    if (mousePressed && mouseX >= 360 && mouseX<= 520 && mouseY >= 460 && mouseY <= 510) {
      image(title2, 0, 0, width, height);
      //startSound.trigger();
      //level=1; //Here we change the value of the level variable,
      //cueing the Draw function to move on to the next section, below.
    }
  }

  if (level==1) { //Now we draw the actual gameplay.
    //adding 1 to counter
    counter++;
    puppyCounter++;
    image(puppy, puppyX-100, puppyY, puppyWidth, puppyHeight);

    if ( gorillaY>= height-500 || gorillaY<0-75 ) {
      velocityGY=(velocityGY*-1);
    }
    //why isnt this working!!! argh! trying to get the gorilla to move on the x axis as well...
    if ( gorillaX>= width || gorillaX<0+75 ) {
      velocityGX=(velocityGX*-1);
    }

    if (!gorillaRotating) {
      gorillaY= gorillaY+velocityGY;
    }

    if (gorillaHit == 2) {
      gorillaX= gorillaX+velocityGX;
    }
    drawGorilla();
    /*to find the positions of characters
     ellipse(gorillaX+200, gorillaY+200, 10, 10);
     ellipse(puppyX, puppyY, 10, 10);*/
  }
  if (puppyUP==true) {
    puppyY -= puppySpeed;
  }
  if (puppyDOWN==true) {
    puppyY += puppySpeed;
  }
  if (puppyLEFT==true) {
    puppyX -= puppySpeed;
  }
  if (puppyRIGHT==true) {
    puppyX += puppySpeed;
  }
}



void drawGorilla() {
  //disco gorilla!!
  if (gorillaHit == 0) {
    noTint();
    image(gorilla, gorillaX, gorillaY, 500, 500);
  }
  else if (gorillaHit == 1) {
    //tint(0, 153, 204);
    float r=random(0, 255);
    float g=random(0, 255);
    float b=random(0, 255);
    //float t=random(0, 255);
    float strokeColor=random(0, 255);
    tint(r, g, b, 255);
    image(gorilla, gorillaX, gorillaY, 500, 500);
    noTint();
  }
  else if (gorillaHit == 2) {
    //tint(0, 153, 204);
    float r=random(0, 255);
    float g=random(0, 255);
    float b=random(0, 255);
    //float t=random(0, 255);
    float strokeColor=random(0, 255);
    tint(r, g, b, 255);
    image(gorilla, gorillaX, gorillaY, 500, 500);
    noTint();
  }

  else if (gorillaHit == 3) {
    //CANT REMEMMBER WHY TINT IS OFF AND WHAT THAT MEANS??!
    //tint(0, 153, 204);
    float r=random(0, 255);
    float g=random(0, 255);
    float b=random(0, 255);
    //float t=random(0, 255);
    float strokeColor=random(0, 255);
    tint(r, g, b, 255);
    image(gorilla, gorillaX, gorillaY, gorillaSizeX, gorillaSizeX);
    noTint();
    if (gorillaSizeX >= 800 ||gorillaSizeX <= 100) {
      //sizeSpeed *= -1;
    }
    //gorillaSizeX += sizeSpeed;
  }
  else if (gorillaHit == 4) {
    gorillaRotating = true;
    //tint(0, 153, 204);

    pushMatrix();
    translate(gorillaX+200, gorillaY+300);
    rotate(rotation);
    translate(-gorilla.width/2+180, -gorilla.height/2-150);
    float r=random(0, 255);
    float g=random(0, 255);
    float b=random(0, 255);
    float strokeColor=random(0, 255);
    tint(r, g, b, 255);  
    image(gorilla, gorillaX, gorillaY, gorillaSizeX, gorillaSizeX);
    noTint();

    if (gorillaSizeX >= 600 ||gorillaSizeX <= 100) {
      sizeSpeed *= -1;
    }
    gorillaSizeX += sizeSpeed;
    gorillaSizeY += sizeSpeed;
    //println("gorillaX: "+gorillaX+" gorillaY: "+gorillaY);
    rotation += 0.05;

    partX = gorillaX;
    partY = gorillaY;  
    popMatrix();


    //popMatrix();
  }

  //explode!
  else if (gorillaHit >= 5) {

    textSize(64);
    text("YOU WIN!", width/2-140, 120);
    fill(225);

    if (explosionPlayed == false) { 
      //explodeSound.trigger();
      explosionPlayed = true;
    }

    if (partY < height-100) {
      partY += partSpeedY;
      partYFriction += partSpeedY * gravity;  
      partY -= partYFriction;
    }
    else {
      //partSpeedY *= -1;
      //partY += partSpeedY;
      //partYFriction += partSpeedY * gravity;  
      //partY -= partYFriction;
    }
    for (int i=0; i < 10; i++) {
      //partY = i == 0 ? partY : partY;
      partX = partY < height-100 ? partsX[i]+=partsSpeedX[i] : partsX[i];
      image(gorillaParts[i], partX, partY, gorillaParts[i].width, gorillaParts[i].height);
    }
  }


  if (counter>=30) {
    secondGorilla=!secondGorilla;

    if (secondGorilla == true) {
      gorilla = gorilla2;
    }
    else {
      gorilla = gorilla1;
    }
    counter=0;
  }

  if (puppyCounter>=5) {
    secondPuppy=!secondPuppy;

    if (secondPuppy == true) {
      puppy = loadImage("puppy2.png");
    }
    else {
      puppy = loadImage("puppy.png");
    }
    puppyCounter=0;
  }
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      puppyUP = true;
    }
    if (keyCode==DOWN) {
      puppyDOWN = true;
    }
  }
  if (key==' ') {
    stroke(255);
    line(0, puppyY+100, puppyX-50, puppyY+100);
    shoot(puppyY+100);
    //laserSound.trigger();
  }
}

void keyReleased() {

  if (keyCode==UP) {
    puppyUP = false;
  }
  if (keyCode==DOWN) {
    puppyDOWN = false;
  }
  if (keyCode==RIGHT) {
    puppyRIGHT = false;
  }
  if (keyCode==LEFT) {
    puppyLEFT = false;
  }
}

void shoot (float shot) {
  //line(0, shot, puppyX-50, shot);
  if ((shot >= gorillaY+175) && (shot <= gorillaY+200)) {
    gorillaHit++;
  }
}

void mouseReleased() {

  if (level==0 && mouseX >= 360 && mouseX<= 520 && mouseY >= 460 && mouseY <= 510) {
    level = 1;
  }
}


//to do: animate characters- make arms move on gorilla, figure out somehting for dog, make tinting colors go all disco crazy, figure out how to make it even harder with lives, points, time etc....levels....mkae gorilla EXPLODE!!




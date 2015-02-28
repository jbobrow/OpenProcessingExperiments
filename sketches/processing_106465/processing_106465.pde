
float gorillaY;
float gorillaX;
PImage gorilla;
PImage puppy;
int velocityGY;
int velocityGX;
int level;

//int score 0;
float puppyX;
float puppyY;
//puppy size parameters
int puppyWidth = 203;
int puppyHeight = 241;
int puppySpeed = 5;

boolean puppyUP = false;
boolean puppyDOWN = false;
boolean puppyLEFT =   false;
boolean puppyRIGHT = false;
boolean gorillaHit = false;

void setup() {
  smooth();
  gorilla = loadImage("GORILLA_RAWR.png");
  puppy = loadImage("puppy.png");
  size(800, 600);
  velocityGY = 5;
  velocityGX = 7;
  puppyX = width-puppyWidth-10;
  puppyY = height/2-puppyHeight/2;
}

void draw() {

  if (level==0) {
    background(0);
    textSize(40);
    text("Click to start", width/2-160, height/2+200);
    text("Puppy V.S. Gorilla!", width/2-200, height/2);
    if (mousePressed) level=1; //Here we change the value of the level variable,
    //cueing the Draw function to move on to the next section, below.
  }

  if (level==1) { //Now we draw the actual gameplay.


    background(0);
    image(puppy, puppyX-100, puppyY, puppyWidth, puppyHeight);

    if (gorillaY>= height-500 || gorillaY<0-75) {
      velocityGY=(velocityGY*-1);
    }
    //why isnt this working!!! argh! trying to get the gorilla to move on the x axis as well...
    if (gorillaX>= width || gorillaX<0+75){
    velocityGX=(velocityGX*-1);
    }

    gorillaY= gorillaY+velocityGY;
    gorillaX= gorillaX+velocityGX;
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
void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      puppyUP = true;
    }
    if (keyCode==DOWN) {
      puppyDOWN = true;
    }
    if (keyCode==LEFT) {
      puppyLEFT = true;
    }  
    if (keyCode==RIGHT) {
      puppyRIGHT = true;
    }
  }
  if (key==' ') {
    stroke(255);
    line(0, puppyY+100, puppyX-50, puppyY+100);
    println ("im hitting space");
    shoot(puppyY+100);
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
  line(0, shot, puppyX-50, shot);
  if ((shot >= gorillaY+175) && (shot <= gorillaY+200)) {
  gorillaHit= true;
  }
}

void drawGorilla() {
  if (gorillaHit == true) {
    tint(0, 153, 204);
    image(gorilla, 0, gorillaY, 500, 500);
    noTint();
  }
  else {
    noTint();
    image(gorilla, 0, gorillaY, 500, 500);
  }
}

//to do: animate characters- make arms move on gorilla, figure out somehting for dog, make tinting colors go all disco crazy, figure out how to make it even harder with lives, points, time etc....levels....mkae gorilla EXPLODE!!



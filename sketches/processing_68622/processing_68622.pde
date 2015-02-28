
//font and text
PFont font1;

//background
PImage sad;
PImage happy;
PImage balloon;

//ammount of rain

int numrain = 250;

//arrays for rain
float[] rainX = new float [numrain];
float[] rainY = new float [numrain];
float[] rainYvel = new float [numrain];
float rainXvel;


//balloon
int balloonX;
int balloonY;
int balloonXvel;
int balloonYvel;

//0 = main screen, 1 = sad penguin, 2 = happy penguin
int gameState;

//minim
import ddf.minim.*;

Minim minim;
AudioPlayer song;

void setup() {
  size(500, 500);
  smooth();
  font1=loadFont("Algerian-48.vlw");
  textFont(font1, 32);

  //rain
  // going insane trying to figure out how to put this all in the draw loop
  //look into this
  for (int i = 0; i< numrain; i++) {
    rainX[i] = random (5, 495);
    rainY[i] = random (40, 50);
    rainXvel = 0;
    rainYvel[i] = random (1, 1.8);
  }
  //balloon
  //for some reason it's getting the X and Y coordinates, but not responsive to 
  //to velocity. Hmm...
  balloonX = 50;
  balloonY = 200;
  balloonXvel =3;
  balloonYvel =1;
  //
  gameState = 0;
  if (gameState == 0) {
    minim = new Minim(this);
    song = minim.loadFile("happy.mp3");
    song.play();
  }
}
void draw() {
  if (gameState==0) {
    imageMode(CENTER);
    sad = loadImage("backgroundsadfinal.png");
    image(sad, 250, 250);
    //text
    fill(0);
    textFont(font1, 32);
    text("tom, the penguin is sad", 30, 100);
    textFont(font1, 24);
    text("press 'c' to cheer him up", 110, 300);
    //rain falling rate and instructions to start again
    //when they have reached the bottom
    for (int i = 0; i < numrain; i++) {
      rainY[i] = rainY[i] + rainYvel[i];
      fill(0, 0, 220);
      rect(rainX[i], rainY[i], 5, 5);
      if (rainY[i] >=395) {
        rainY[i] = random (40, 50);
      }
    }
    if (keyPressed && key =='c') {
      gameState = 1;
    }
    
    // happy penguin
    if (gameState ==1) {
      imageMode(CENTER);
      //background image
      happy = loadImage("backgroundhappyfinal.png");
      image(happy, 250, 250);

      //balloon with movement

      balloon = loadImage("balloon.png");
      image (balloon, balloonX, balloonY);
      balloonX = balloonX+balloonXvel;
      balloonY = balloonY+balloonYvel;
        //text
      fill(0);
      text ("yay", 300, 320); 
      textFont(font1, 16);
      text("press 's' to make him sad", 280,480);
    }
  }
  if (keyPressed && key =='s') {
      gameState = 0;
  }
}
void stop()
{
  song.close();
  minim.stop();

  super.stop();
}



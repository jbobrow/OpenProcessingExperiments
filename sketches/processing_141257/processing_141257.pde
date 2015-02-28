
/*IaaC 2014
Processing Seminar
Carmen Aguilar-Wedge 
Apostolos Mouzakopoulos 
Dimitrios Aidonis
Efilena Baseta
Ece Tankal
*/


ArrayList meteors; 
ArrayList aliens;
Timer timer;
Timer timer_aliens;
Sound_stuff sound;

Ufo_Player ufo;
boolean start = false;
boolean ChooseCharacter = false;

int level = 1, lives = 5;
int score;
int x;
int y;
int s;
float ySpeed;

PImage galaxy;
PImage stars;
PFont font;




void setup() {
  font = loadFont("256Bytes-50.vlw");
  textFont(font, 20);
  size (800, 596, P2D);
  smooth();
  score = 0;
  //initializes ufo from the Ufo_player class, calling a new object.  
  ufo = new Ufo_Player();
  //initializes sound, as a new object from the Soune_stuff class
  sound = new Sound_stuff(); //calls the sound_stuff class


  timer_aliens = new Timer(8000);  //set frequency from the AlienTimer class
  timer_aliens.run();  
  aliens = new ArrayList();


  timer = new Timer(2000);  //set frequency
  timer.run();  
  meteors = new ArrayList();




  galaxy = loadImage("far_far_away.png");
  stars = loadImage("stars.png");
}
void draw() {

  if (GameOver() == true) {
    if (keyPressed) {
      if (key == ' ') {
        start = true;
        setup();
        fill(124, 124, 124);
        textSize(100);
        textAlign(CENTER);
        text("GAME OVER", width/2, height/2);
        textSize(50);
        text("press 'spacebar' to restart game", width/2, height/2+30);
        score = 0;
        lives = 5;
      }
    }
  }
  image (galaxy, x, 0);
  x--;
  if (x < -2*2400/3) {
    x = 0;
  }

  image(stars, s, 0);
  s-=2;
  if (s < -2*2400/3)
    s=0;


  //character 
  if (keyPressed) {
    if (key == ' ') {
      if (start == false) {

        ChooseCharacter = true;
      }
    }
  }

  if (ChooseCharacter == true) {

    Choose();
  }

  //start game
  if (start == true) {
    startGame();
    ChooseCharacter = false;
  }

  //splash screen
  else if (ChooseCharacter == false && start == false) {
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(50);
    text("Rescue the Aliens", width/2, height/2-90);
    textSize(70);
    text("NEW GAME", width/2, height/2);
    textSize(50);
    text("press 'spacebar' to start", width/2, height/2+70);
  }

  //println(" timer " + timer.getTime());
  //println(" alien " + timer_aliens.getTime());

  // A new Particle object is added to the ArrayList every cycle through draw().

  if (start == true) {
    timer.run();
    timer_aliens.run();
    if (timer.isFinished()) {
      meteors.add(new Meteor());
      timer.start();
    }


    if (timer_aliens.isFinished()) {
      aliens.add(new Aliens()); 
      timer_aliens.start();
    }

    // Iterate through our ArrayList and get each Particle
    // The ArrayList keeps track of the total number of particles.
    for (int i = 0; i < meteors.size(); i++ ) { 
      Meteor p = (Meteor) meteors.get(i);
      p.display();
      p.run();

      p.itCollides(ufo.getPos());
      if (p.touch) meteors.remove(i);
      if (p.touch) lives = lives - 1;
    }
    // The ArrayList keeps track of the total number of particles.
    for (int i = 0; i < aliens.size(); i++ ) { 
      Aliens a = (Aliens) aliens.get(i);
      a.display();
      a.run();

      a.itCollides(ufo.getPos());
      if (a.touch) {
        aliens.remove(i);
        score = score + 500;
        println(score);
      }
      if ((a.touch) && lives <5) lives = lives +1;
    }
    // If the ArrayList has more than 12 elements in it, we delete the first element, using remove().
    if (meteors.size() > 12) {
      score = score + 100;
      println(score);
      meteors.remove(0);
    }

    // If the ArrayList has more than 15 elements in it, we delete the first element, using remove().
    if (aliens.size() > 15) {

      aliens.remove(0);
    }


    UI();
    sound.speak();
  }
}

PImage hearts;
int size = 160;

void UI() {
  fill(0, 0, 0, 50);
  rectMode(CORNER);
  rect(0, height-40, width, 40); 
  textSize(20);
  fill(255);
  textAlign(RIGHT);
  //Score
  text("SCORE: " + score, 2*width/3, height-15);
  textAlign(LEFT);

  //Lives
  text("Lives:", 10, height-15);

  hearts = loadImage("hearts.png");

  if (lives == 1) {
    image(hearts, 50, height-95, size, size);
  }
  if (lives == 2) {

    image(hearts, 50, height-95, size, size);
    image(hearts, 75, height-95, size, size);
  }
  if (lives == 3) {

    image(hearts, 50, height-95, size, size);
    image(hearts, 75, height-95, size, size);
    image(hearts, 100, height-95, size, size);
  }
  if (lives == 4) {

    image(hearts, 50, height-95, size, size);
    image(hearts, 75, height-95, size, size);
    image(hearts, 100, height-95, size, size);
    image(hearts, 125, height-95, size, size);
  }
  if (lives == 5) {
    image(hearts, 50, height-95, size, size);
    image(hearts, 75, height-95, size, size);
    image(hearts, 100, height-95, size, size);
    image(hearts, 125, height-95, size, size);
    image(hearts, 150, height-95, size, size);
  }
}

//Start Game
void startGame() {
  GameOver();
  ufo.go();
  ufo.display();
}


//Game Over
boolean GameOver() {
  boolean GameOver = false;
  if (lives <= 0) {
    start = false;
    lives = 0;

    fill(124, 124, 124);
    textSize(100);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    textSize(50);
    text("press 'spacebar' to restart game", width/2, height/2+30);
    GameOver = true;
  } 
  return GameOver;
}

// Simple meteor system with ArrayList

// A simple Particle class
class Meteor {
  PImage object;
  float size;
  float x;
  float y;
  float xspeed;
  float yspeed;
  float r;
  boolean touch = false;


  Meteor() {
    x = width;
    y = random(100, height-150);
    xspeed = random(-1.5, -.75);

    object = loadImage("meteora.png");
    size = random(100, 200);
  }

  void run() {
    x = x + xspeed;
  }


  void display() {
    stroke(0);
    for (int i = 0; i < 1; i++) {
      image(object, x, y, size, size);
    }
  }

  void itCollides( PVector in) {
    PVector pos = new PVector(x, y);
    float d = pos.dist(in);
    if (d < 60) {
      touch = true;
      println("touch");
      //d = 100;
    } 
    else touch = false;
    //    lives = lives-1;
  }
}

import ddf.minim.analysis.*;
import ddf.minim.*;



class Sound_stuff { //class


  //variables
  Minim minim;     //
  AudioInput in;  //calls 'in' within the AudioInput class

  /* An FFT object is used to convert an audio signal into its frequency domain representation. This representation
   * lets you see how much of each frequency is contained in an audio signal. Sometimes you might not want to 
   * work with the entire spectrum, so it's possible to have the FFT object calculate average frequency bands by 
   * simply averaging the values of adjacent frequency bands in the full spectrum. There are two different ways 
   * these can be calculated: <b>Linearly</b>, by grouping equal numbers of adjacent frequency bands, or 
   * <b>Logarithmically</b>, by grouping frequency bands by <i>octave</i>, which is more akin to how humans hear sound.
   * <br/>
   */

  FFT fftLin;
  FFT fftLog;

  float spectrumScale = 4;
  float theFreq;
  float easing = 0.02;
  float current;
  int w;

  //constructor
  Sound_stuff() {

    minim = new Minim(this);
    in = minim.getLineIn();
    fftLin = new FFT( in.bufferSize(), in.sampleRate() );
    fftLin.linAverages( 30 );
    fftLog = new FFT( in.bufferSize(), in.sampleRate() );
    fftLog.logAverages( 22, 3 );
  }
  //methods

  void speak() {

    float centerFrequency = 0;
    // perform a forward FFT on the frequencies of our voices
    fftLin.forward( in.mix );
    fftLog.forward( in.mix );
    {
      noFill();
      for (int i = 0; i < fftLin.specSize(); i++)
      {
        if (fftLin.getBand(i)*spectrumScale > 100.) { 

          current = fftLin.indexToFreq(i);
        }
      }
      //println( "value "+ (theFreq += ( current - theFreq)*easing)); 
      theFreq += ( current - theFreq)*easing;
      float t = map(theFreq, 200, 600, height-150, 0);
      if (t <= 75) {
        t=75;
      }
      if (t >=450) {
        t=height-150;
      }

      ufo.moveUfo(t);
    }
  }
}

int number = 0;
int ufoSize = 100;
int ship1=200;
int ship2 = 150;
int ship3 = 150;
int ship4 = 150;

boolean SelectUfo = true;

PImage Ufo_1;
PImage Ufo_2;
PImage Ufo_3;
PImage Ufo_4;

void Choose() {
  Ufo_1 = loadImage("Ufo_1.png");
  Ufo_2 = loadImage("Ufo_2.png");
  Ufo_3 = loadImage("Ufo_3.png");
  Ufo_4 = loadImage("Ufo_4.png");

  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("choose spaceship!", width/2, height/4);
  textSize(30);
  text("Use arrow keys to choose", width/2, height/2+120);
  text("Press Spacebar to select", width/2, height/2+150);
  select();
  rectMode(CENTER); 
  fill(0);

  Ufo_1.resize(ship1, ship1);
  image(Ufo_1, width/6, height/3);
  fill(255, 0, 0);
  Ufo_2.resize(ship2, ship2);
  image(Ufo_2, 2*width/6, height/3);
  fill(0, 255, 0);
  Ufo_3.resize(ship3, ship3);
  image(Ufo_3, 3*width/6, height/3);
  fill(0, 0, 255);
  Ufo_4.resize(ship4, ship4);
  image(Ufo_4, 4*width/6, height/3);
}

//Decides which character it is on
void keyPressed() {
  if (SelectUfo == true) {
    if (keyCode == RIGHT) {
      if (number == 0) {
        number = 2;
      } 
      else if (number == 1) {
        number = 2;
      } 
      else if (number == 2) {
        number = 3;
      } 
      else if (number == 3) {
        number = 4;
      } 
      else if (number == 4) {
        number = 1;
      }
    }
    if (keyCode == LEFT) {
      if (number == 0) {
        number = 4;
      } 
      else if (number == 4) {
        number = 3;
      } 
      else if (number == 3) {
        number = 2;
      } 
      else if (number == 2) {
        number = 1;
      } 
      else if (number == 1) {
        number = 4;
      }
    }
  }

  //Start the Game with your Character
  if (key == ' ') {
    if (number > 0) {
      SelectUfo = false;
    }
    if (number == 1) {
      start = true;
    } 
    if (number == 2) {
      start = true;
    } 
    if (number == 3) {
      start = true;
    } 
    if (number == 4) {
      start = true;
    }
  }
}

//Changing size of images for Characters
void select() {
  if (number == 0) {

    ship1 = 200;
    ship2 = 150;
    ship3 = 150;
    ship4 = 150;
  }
  if (number == 1) {
    ship1 = 200;
    ship2 = 150;
    ship3 = 150;
    ship4 = 150;
  } 
  else if (number == 2) {
    ship1 = 150;
    ship2 = 200;
    ship3 = 150;
    ship4 = 150;
  } 
  else if (number == 3) {
    ship1 = 150;
    ship2 = 150;
    ship3 = 200;
    ship4 = 150;
  } 
  else if (number == 4) {
    ship1 = 150;
    ship2 = 150;
    ship3 = 150;
    ship4 = 200;
  }
}

PImage UFO;

class Ufo_Player {
  int Down = 0;
  int Up = 2;
  int direction = 1;
  float Ufo_x = 50;
  float Ufo_y = height/2;
  

  int playerSize = 100;
  boolean up = true;

  Ufo_Player() {
  }

  void display() {
    rectMode(CENTER);
    textAlign(CENTER);
    textSize(30);
    fill(255);
    if (score <= 100) {
      text("HMMMM TO SAVE THE ALIENS", width/2, height/4);
      text("REMEMBER! DON'T HIT THE METEORS", width/2, height/4+50);
    }


    //which ufo image do you want to use for your character?

    //figures out which image to use for character
    if (direction == Down && number == 1) {//
      UFO = loadImage("Ufo_1.png");
    }//
    else if (direction == Up && number ==1) {//
      UFO = loadImage("Ufo_1.png");
    }//
    if (direction == Down && number == 2) {
      UFO = loadImage("Ufo_2.png");
    }
    else if (direction == Up && number == 2) {
      UFO = loadImage("Ufo_2.png");
    }
    if (direction == Down && number == 3) {
      UFO = loadImage("Ufo_3.png");
    }
    else if (direction == Up && number ==3) {
      UFO = loadImage("Ufo_3.png");
    }
    if (direction == Down && number == 4) {
      UFO = loadImage("Ufo_4.png");
    }
    else if (direction == Up && number == 4) {
      UFO = loadImage("Ufo_4.png");
    } 

    //ufo selected
    image(UFO, Ufo_x, Ufo_y,playerSize,playerSize);
  }
  void go() {
    //this will keep the Ufo_Y within the boundry of the game
    if (Ufo_y <=50) {
      Ufo_y = 50;
    }
    if (Ufo_y >=500) {
      Ufo_y = 500;
    }

    // if game is playing move the character using audio
    if (lives>0) {
      Ufo_y = Ufo_y + ySpeed;
      direction = Down;
    }
  }
  void moveUfo(float iny) {
    Ufo_y = iny;
  }
  
  void checkCollision(){
  }
  
  PVector getPos(){
  return new PVector(Ufo_x,Ufo_y);
  }
}



// A simple Particle class
class Aliens {
  PImage alien;
  float x;
  float y;
  float xspeed;
  float yspeed;
  boolean touch = false;

  Aliens() {
    x = width;
    y = random(100, height-150);
    xspeed = random(-2, -1);
    yspeed = 0;
    alien = loadImage("alien.png");
  }

  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }

  void gravity() {
    yspeed += 0.0;
  }

  void display() {
    stroke(0);

    for (int i = 0; i < 1; i++) {

      image(alien, x, y, 150, 100);
    }
  }
  void itCollides( PVector in) {
    PVector pos = new PVector(x, y);
    float d = pos.dist(in);
    if (d < 40) {
      touch = true;
      d = 100;
    } 
    else touch = false;
  }
}

class Timer {

  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  int currentTime;

  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }

  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
  }

  void run() {
    currentTime = millis();
  }

  int getTime() {
    return currentTime;
  }

  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = currentTime - savedTime;
    //println(passedTime + " passedTime " + totalTime + " total ");
    if (passedTime > totalTime) {

      //println("done");
      return true;
    } 
    else {
      return false;
    }
  }
}




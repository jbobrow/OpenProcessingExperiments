
/**
Try to avoid the car.<br/>
For sound, use Chrome.<br/>
Based on code from http://natureofcode.com/<br/>
**/

// constants
int WIDTH = 640;
int HEIGHT = 400;
float EXPLOSION_FRAME_INC = 1/3;
int SCREEN_TRANSITION_TIME = 8000; // in ms. toggle title screen/highscore screen
// thresholds for ole bonus
float OLE_SPEED_TH = 3.5;
float OLE_ANGLE_TH = PI/4;
float OLE_DISTANCE_TH = 40;
// points awarded for ole
int OLE_POINTS = 20000;
// counter to maintain ole signal open for x frames
int OLE_MAX_COUNTER = 2;

// states
int TITLE = 0;
int SHOW_SCORE = 1;
int ENTER_SCORE = 2;
int PLAYING = 3;

// object variables
Vehicle v;
ParticleSystem[] accelPs = new ParticleSystem[2];
ParticleSystem[] brakePs = new ParticleSystem[2];
PVector target; // this is the mouse
Animation explosion;
Highscore highscore;

// image variables
PImage bg;
PImage helmet;

// font variables
PFont titleFont;
PFont subtitleFont;

// state variables
int lives;
int state;
boolean firstTime;
boolean secondTime;
int titleFade;
int score;
Timer screenTransition = new Timer(SCREEN_TRANSITION_TIME);
boolean olePreGiven;

// sound variables
Maxim maxim;
AudioPlayer accelPlayer;
AudioPlayer brakePlayer;
AudioPlayer explosionPlayer;
AudioPlayer olePlayer;


//functions

void setup()
{
  size(640, 400);
  background(0);
  
  firstTime = true;
  secondTime = false;  
}

// separate loading function so that we can call it from draw and display a loading screen. otherwise this does not seem possible. essentially replaces setup()
void load() {    
  // load images
  bg = loadImage("grunge-danger-background-1280x2000.jpg");
  PImage sprite = loadImage("Ford40GT.png"); // sprite by mattalien
  spritesheet = loadImage("explosion.png");
  helmet = loadImage("blue_helmet_small.png");
  
  // load fonts
  titleFont = createFont("Andalusian");
  subtitleFont = createFont("Andalus");
  
  // load sounds
  maxim = new Maxim(this);
  accelPlayer = maxim.loadFile("engineloop.wav");
  brakePlayer = maxim.loadFile("car-brake-01.wav");
  explosionPlayer = maxim.loadFile("boom.wav");
  olePlayer = maxim.loadFile("ole2.wav");
  
  // create objects
  v = new Vehicle(0, 0, sprite, accelPs, brakePs);
  target = new PVector(0, 0);
  accelPs[0] = new ParticleSystem(3, 255, -12);
  accelPs[1] = new ParticleSystem(3, 255, -12);
  brakePs[0] = new ParticleSystem(1, 15, -1.5);
  brakePs[1] = new ParticleSystem(1, 15, -1.5);
  explosion = new Animation(spritesheet, 84, 74, 7, EXPLOSION_FRAME_INC, 0, 0);
  highscore = new Highscore(subtitleFont);

  // configure objects
  brakePlayer.setLooping(false);
  brakePlayer.volume(0.25);
  explosionPlayer.setLooping(false);
  explosionPlayer.volume(0.3);
  olePlayer.setLooping(false);
  olePlayer.volume(0.4);

  // update state
  state = TITLE;
  titleFade = 0;
  score = -1; // no score yet

  // start screen transition timer
  screenTransition.start();
  
  // turn off the cursor
  noCursor();
}

void draw()
{
  // we want to display a loading screen (only possible from draw)
  if (firstTime) {
    textAlign(CENTER, CENTER);
    text("Loading...", WIDTH / 2, HEIGHT / 2);
    firstTime = false;
    secondTime = true;
    return;
  }
  // and then load everything
  if (secondTime) {
    load();
    secondTime = false;
  }
  
  // draw the background to clear screen
  imageMode(CORNER);
  image(bg, 0, 0);
  
  // update game
  switch (state) {
    case TITLE:
      titleScreen();
      checkTimer(); // switch between title and highscore screens
      break;
    case SHOW_SCORE:
      highscore.displayScores();
      checkTimer(); // switch between title and highscore screens
      break;
    case ENTER_SCORE:
      highscore.queryPlayerName();
      // check if we are done enetring the name, and transition to showing the score, if so
      if (!highscore.isActive()) {
        state = SHOW_SCORE;
        screenTransition.start();
      }
      break;
    case PLAYING:
      gameLoop();
      break;
  }
  
  // draw stuff
  
  // draw particles. let them fade even if the player is dead
  brakePs[0].run();
  brakePs[1].run();
  if (state == PLAYING) {
    v.display();
  }
  accelPs[0].run();
  accelPs[1].run();
  
  // draw explosions. let explosion finish even when the player is dead
  if (explosion.playing()) {
    explosion.play();
  }
  
  // display lives
  for (int i = 0; i < lives; i++) {
    image(helmet, i * 30 + 20, 20);
  }
  
  // display score only if it has been set. a score of < 0 means that no score has been set yet
  if (score > -1) {
    displayScore();
  }
  
  // draw the cape, but disable it for the title fade in
  if (titleFade >= 255) {
    drawCape();
  }
  
  // ole. important to first check ole and then preconditions, as an ole depends on the current state and previous state
  checkOle();
  checkOlePre();
}

// check if the timer has finished and toggle state accordingly
void checkTimer() {
  if (screenTransition.isFinished()) {
    switch (state) {
      case TITLE:
        state = SHOW_SCORE;
        break;
      case SHOW_SCORE:
        state = TITLE;
        titleFade = 0;
        break;
    }
    // restart timer
    screenTransition.start();
  }
}

void titleScreen() {
  // show screen
  // let the title fade in
  fill(0, 0, 0, titleFade);
  if (titleFade < 255) {
    titleFade += 2;
  }
  textFont(titleFont, 64);
  textAlign(CENTER, CENTER);
  text("Motorero", WIDTH / 2, HEIGHT / 2);
  // display click to start only after title has faded in
  if (titleFade >= 255) {
    fill(0, 210);
    textFont(subtitleFont, 18);
    textAlign(CENTER, CENTER);
    text("Click mouse button to play", WIDTH / 2, HEIGHT / 2 + 44);
  }
}

void gameLoop() {
  // the car will chase our mouse
  target.x = mouseX;
  target.y = mouseY;
  
  // update the car
  v.seek(target);
  v.update();
    
  // check for collision
  if (!explosion.playing()) {
    float distance = PVector.sub(v.location, target);
    if (distance.mag() <= 25) {
      // place explosion at edge of cape
      distance.normalize();
      distance.mult(15);
      distance.add(target);
      explosion.move(distance);
      // reset and then play explosion animation and sound      
      explosion.reset();
      explosion.play();
      explosionPlayer.stop();
      explosionPlayer.play();
      // player loses a life
      loseLife();
    }
  }
  else {
    explosion.play();
  }
  
  // update score
  updateScore();
  
  // sound
  // the engine sound depends on the car's speed
  accelPlayer.speed(v.velocity.mag()/6 + 1);
  
  // engine sound. it takes a while to load, so try making it play until it does
  if (!accelPlayer.isPlaying()) {
    accelPlayer.play();
  }
  
  // start and stop braking sound
  if (!v.isBraking() && brakePlayer.isPlaying()) {
    brakePlayer.stop();
  }
  else if (v.isBraking() && !brakePlayer.isPlaying()) {
    brakePlayer.play();
  }
}

void displayScore() {
  fill(36, 85, 160);
  textFont(subtitleFont, 24);
  textAlign(RIGHT, CENTER);
  text(score, WIDTH - 10, 20);
}

void drawCape() {
  stroke(255, 0, 0, 255);
  fill(255, 0, 0, 100);
  ellipse(mouseX, mouseY, 30, 30);
}

void mouseClicked()
{
  if (state == TITLE || state == SHOW_SCORE) {
    newGame();
  }
}

void newGame() {
  state = PLAYING;
  lives = 3;
  score = 0;
  accelPlayer.cue(0);
  accelPlayer.setLooping(true); // because of a problem with looping sounds, this line needs to go here instead of setup
  v.setLocation(0, 0); // reset car
  titleFade = 255; // make sure we draw the cape (mouse cursor)
  screenTransition.stop(); // stop the timer
  olePreGiven = OLE_MAX_COUNTER; // at the start of the game, no ole preconditions are given
}

void loseLife() {
  lives--;
  if (lives <= 0) {
    die();
  }
}

void die() {
  // stop all running sounds
  // a bug seems to prevent looping sounds from stopping the sound correctly in js. so instead, we set the acceleration to non-looping, stop it and then set it to looping again when a new game starts
  accelPlayer.setLooping(false);
  accelPlayer.stop();
  brakePlayer.stop();
  
  // ask the highscore module if our score is a new highscore
  if (highscore.isNewHighscore(score)) {
    state = ENTER_SCORE;
  }
  else {
    // go to highscore screen
    state = SHOW_SCORE;
    // restart timer
    screenTransition.start();
  }
}

void updateScore() {
  // make sure that we are not dead already
  if (!(state == PLAYING)) {
    return;
  }
  
  // we score when we are in front of the car and close. the score is higher when:
  // - the angle is smaller
  // - the distance to the car is smaller
  // - the car's speed is higher
  int points = 0;
  float angle = abs(v.orientation.angle(PVector.sub(target, v.location))); 
  if (angle < PI/4) {
    points += (int) ((PI/4 - angle) * 10);
    int distance = (int) PVector.sub(target, v.location).mag();
    if (distance < 120) {
      points += (120 - distance);
      float speed = v.velocity.mag(); 
      if (speed > 1.5) {
        points += (int) ((120 - distance) * speed);
        score += points;
      }
    }
  }
}

// check if the conditions for a possible ole are given
void checkOlePre() {
  if (v.velocity.mag() > OLE_SPEED_TH) {
    float angle = abs(v.orientation.angle(PVector.sub(target, v.location)));
    if (angle < OLE_ANGLE_TH) {
      int distance = (int) PVector.sub(target, v.location).mag();
      if (distance < OLE_DISTANCE_TH) {
        olePreGiven = OLE_MAX_COUNTER;
        return;
      }
    }
  }
  if (olePreGiven > 0) {
    olePreGiven--;
  }
}

// check if an ole has been triggered
void checkOle() {
  if (state == PLAYING && olePreGiven > 0 && v.isBraking() && !explosion.playing()) {
    // play sound
    olePlayer.stop();
    olePlayer.play();
    // add score
    score += OLE_POINTS;
  }
}
class Animation {
  
  PImage spritesheet;
  float w;
  float h;
  int frames;
  float frameInc;
  float x;
  float y;
  float current_frame = 0;
  
  Animation(PImage spritesheet_, float w_, float h_, int frames_, float frameInc_, float x_, float y_) {
    w = w_;
    h = h_;
    frames = frames_;
    frameInc = frameInc_;
    x = x_;
    y = y_;
    spritesheet = spritesheet_;
  }
  
  void reset() {
    current_frame = 0;
  }
  
  void move(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void move(PVector v) {
    x = v.x;
    y = v.y;
  }
  
  boolean playing() {
    if (current_frame == 0 || current_frame >= frames) {
      return false;
    }
    else {
      return true;
    }
  }
  
  void play() {
    if (current_frame < frames) {
      imageMode(CENTER);
      image(spritesheet.get((int)current_frame * w, 0, w, h), x, y);
      current_frame += frameInc;
    }
  }
}
class Highscore {
  // constants
  final String FILE = "scores.xml";
  final int MAX_SCORE_LENGTH = 32;
  final String BASE_URL = "http://motorero.frogcp.com/highscore.php";
  
  // small class to bundle score + player 
  class Score implements Comparable {
    String player;
    int score;
    
    // constructor
    Score(String player_, int score_) {
      player = player_;
      score = score_;
    }
    
    // compare to be able to sort by score. sort is descending
    int compareTo(Object o) {
      Score other = (Score) o;
      if (score < other.score) {
        return 1;
      }
      else if (score == other.score) {
        return 0;
      }
      else {
        return -1;
      }
    }
  }
  
  // keep the scores here
  Scores[] scores;
  // flag to see if the module is prompting the player for her name
  boolean active;
  // font we will use for display
  PFont font;
  // input field in which the player enters her name
  InputField inputField = new InputField();
  // the new highscore a player has achieved and which will be uploaded after she enters her name
  int scoreToUpload;
 
  // constructor
  Highscore(PFont font_) {
    loadFromStorage();
    active = false;
    font = font_;
  }
  
  void loadFromStorage() {
    // access server to get scores
    String url = BASE_URL + "?method=get&number=10";
    String[] scoreLines = loadStrings(url);
    scores = new Scores[scoreLines.length];

    // read scores from file into array
    for (int i = 0;  i < scoreLines.length; i++) {
      // player and score are separated by comma
      String[] elements = split(scoreLines[i], ",");
      // the player name could have commas, so rejoin all elements except the last, which is the score
      String[] temp = shorten(elements);
      String player = join(temp, ",");
      // score is the last value
      int score = (int) elements[elements.length - 1];
      // create the new score object entry 
      scores[i] = new Score(player, score);
    }
    // sort descending
    scores = sort(scores);
  }
  
  boolean isActive() {
    return active;
  }  
  
  // see if we have a new highscore. if so, the module will become active to ask the player for her name
  boolean isNewHighscore(int newScore) {
    // first, update the high score list
    loadFromStorage();
    // if there is no high score list, we cannot enter any points into it
    if (scores.length > 0 && newScore > scores[scores.length - 1].score) {
      // a new score. become active
      active = true;
      // update the new score to enter the highscore list
      scoreToUpload = newScore;
      return true;
    }
    else {
      return false;
    }
  }
  
  // save new high score on server
  void saveToStorage(String player, int score) {
    String url = BASE_URL + "?method=post&player=" + player + "&score=" + score;
    Strings[] response = loadStrings(url);
  }
  
  void displayScores() {
    // font properties
    fill(36, 85, 160);
    textFont(font, 32);
    textAlign(CENTER, CENTER);
    
    // divide the screen height into equal pieces, where each score counts as 1 and the title counts as 2
    int h = HEIGHT / (scores.length + 2);
    int offset = h / 2;
    
    // draw title
    text("Highscores", WIDTH / 2, h);
    
    // draw scores
    textSize(24);
    for (int i = 0; i < scores.length; i++) {
      textAlign(LEFT, CENTER);
      text(scores[i].player, WIDTH / 4, (i + 2) * h + offset);
      textAlign(RIGHT, CENTER);
      text(scores[i].score, WIDTH * 3 / 4, (i + 2) * h + offset);
    }
  }
  
  // manage state of html/js player name input
  void queryPlayerName() {
    if (inputField.isHidden()) {
      inputField.show(scoreToUpload);
    }
    if (inputField.isScoreSubmitted()) {
      submitScore();
    }
  }
  
  // send score to server and deactivate name input
  void submitScore() {
    // get the player name
    String player = inputField.getPlayer();
    // upload the score
    saveToStorage(player, scoreToUpload);
    // load updated scoreboard
    loadFromStorage();
    // deactivate the input
    active = false;
    // hide inputField
    inputField.hide();
  }
}
class PVector {
 
  float x;
  float y;
 
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  PVector(PVector v) {
    x = v.x;
    y = v.y;
  }
  
  void add(PVector v) {
    y = y + v.y;
    x = x + v.x;
  }
 
  void sub(PVector v) {
    x = x - v.x;
    y = y - v.y;
  }
  
  static PVector sub(PVector v1, PVector v2) {
    float new_x = v1.x - v2.x;
    float new_y = v1.y - v2.y;
    PVector res = new PVector(new_x, new_y);
    return res;
  }
  
  void mult(float n) {
    x = x * n;
    y = y * n;
  }
  
  void div(float n) {
    x = x / n;
    y = y / n;
  }
  
  float mag() {
    return sqrt(x*x + y*y);
  }
  
  void normalize() {
    float m = mag();
    div(m);
  }
  
  void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
    }
  }
  
  float heading() {
    return atan2(y,x);
  }
  
  float rotate(float angle) {
    float cs = cos(angle);
    float sn = sin(angle);
    float px = x;
    float py = y;
    x = px * cs - py * sn;
    y = px * sn + py * cs;
  }
  
  void set(float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void copy(PVector v) {
    x = v.x;
    y = v.y;
  }
  
  void angle(PVector v) {
    float angle = v.heading() - heading();
    // return value between -PI and PI
    while (angle < -PI) {
      angle += TWO_PI;
    }
    while (angle > PI) {
      angle -= TWO_PI;
    }
    return angle;
  }
  
  PVector normal() {
    return new PVector(-y, x);  
  }
}
class Particle {
  float INITIAL_LIFE = 255;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float colour;
  float lifeDelta;
 
  Particle(PVector loc, PVector acc, float colour_, float lifeDelta_) {
    location = new PVector(loc);
    acceleration = new PVector(acc);
    velocity = new PVector(0, 0);
    lifespan = INITIAL_LIFE;
    lifeDelta = lifeDelta_;
    colour = colour_;
  }
 
  void run() {
    update();
    display();
  }
 
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan += lifeDelta;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
 
  void display() {
    noStroke();
    fill(colour, lifespan);
    rect((int) location.x, (int) location.y, 2, 2);
  }
}

class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  float spread;
  float colour;
  float lifeDelta;

  ParticleSystem(float spread_, float colour_, float lifeDelta_) {
    particles = new ArrayList<Particle>();
    origin = new PVector(0, 0);
    spread = spread_;
    colour = colour_;
    lifeDelta = lifeDelta_;
  }
  
  void setOrigin(float x, float y) {
    origin.x = x;
    origin.y = y;
  }
  
  void setOrigin(PVector o) {
    origin.x = o.x;
    origin.y = o.y;
  }

  void addParticle(Particle p) {
    particles.add(p);
  }
  
  void addParticles(int nb) {
    PVector acc = new PVector(0, 0);
    PVector loc = new PVector(0, 0);
    for (int i = 0; i < nb; i++) {
      loc.x = origin.x + random(-spread, spread);
      loc.y = origin.y + random(-spread, spread);
      Particle p = new Particle(loc, acc, colour, lifeDelta);
      addParticle(p);
    }
  }

  void run() {
    Iterator<Particle> it =
        particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        particles.remove(p);
      }
    }
  }
}
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 10-5: Object-oriented timer

class Timer {
 
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  boolean active; // is the timer enabled
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
    active = false;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis();
    active = true; 
  }
  
  // stop the timer
  void stop() {
    active = false;
  }
  
  // The function isFinished() returns true if 5,000 ms have passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() {
    if (!active) {
      return false;
    } 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
class Vehicle {
 
  float MAXSPEED = 5;
  float MINSPEED = 1;
  float MAXSTEER = PI/32;
  float ACCEL_FORCE = 0.06;
  float BRAKE_FORCE = -0.15;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector orientation;
  PImage sprite;
  ParticleSystem[] accelPs;
  ParticleSystem[] brakePs;
  float mina = 10000;
  float maxa = -10000;
  
  boolean braking;
 
  Vehicle(float x, float y, PImage sprite_, ParticleSystem[] accelPs_, ParticleSystem[] brakePs_) {
    orientation = new PVector(1, 0);
    acceleration = new PVector(0,0);
    velocity = new PVector(0, 0);
    location = new PVector(x,y);
    sprite = sprite_;
    accelPs = accelPs_;
    brakePs = brakePs_;
    braking = false;
  }
  
  void setLocation(float x, float y) {
    location.set(x, y);
  }
 
  void update() {
    velocity.add(acceleration);
    velocity.limit(MAXSPEED);
    location.add(velocity);
    acceleration.mult(0);
    if (velocity.mag() != 0) {
      orientation.copy(velocity);
      orientation.normalize();
    }
  }
 
  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);
    float angle = orientation.angle(desired);
    
    braking = false;
    
    // steer in the direction of the target
    steer(angle);
        
    // accelerate if the target is in front of us
    if (angle >= 0 && angle < PI/4 || angle < 0 && angle > -PI/4) {
      accelerate();
    }
    // brake if it is behind us and we are not below minimum velocity
    else if (abs(angle) > PI/2) {
      if (velocity.mag() > MINSPEED) {
        brake();
      }
    }
    
    if (!braking && velocity.mag() + ACCEL_FORCE < MINSPEED) {
      accelerate();
    }
  }
  
  void accelerate() {
    acceleration.copy(orientation);
    acceleration.mult(ACCEL_FORCE);
    
    if (velocity.mag() < MAXSPEED) {
      // first wheel smoke
      float originx = location.x - 16 * orientation.x - 5.5 * orientation.y;
      float originy = location.y - 16 * orientation.y + 5.5 * orientation.x;
      accelPs[0].setOrigin(originx, originy);
      accelPs[0].addParticles(3);
      // second wheel smoke
      originx = location.x - 16 * orientation.x + 5.5 * orientation.y;
      originy = location.y - 16 * orientation.y - 5.5 * orientation.x;
      accelPs[1].setOrigin(originx, originy);
      accelPs[1].addParticles(3);
    }
  }
  
  void brake() {
    acceleration.copy(orientation);
    if (-velocity.mag() < BRAKE_FORCE) { 
      acceleration.mult(BRAKE_FORCE);
    }
    
    // first wheel skid
    float originx = location.x - 16 * orientation.x - 5.5 * orientation.y;
    float originy = location.y - 16 * orientation.y + 5.5 * orientation.x;
    brakePs[0].setOrigin(originx, originy);
    brakePs[0].addParticles(6);
    // second wheel skid
    originx = location.x - 16 * orientation.x + 5.5 * orientation.y;
    originy = location.y - 16 * orientation.y - 5.5 * orientation.x;
    brakePs[1].setOrigin(originx, originy);
    brakePs[1].addParticles(6);
    braking = true;
  }
  
  void steer(float angle) {
    if (angle > MAXSTEER) {
      angle = MAXSTEER;
    }
    else if (angle < -MAXSTEER) {
      angle = -MAXSTEER;
    }
    velocity.rotate(angle/2);
  }
 
  void display() {
    float theta = velocity.heading() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    imageMode(CENTER);
    image(sprite, 0, 0, 19, 32);
    popMatrix();
  }
  
  boolean isBraking() {
    return braking;
  }
}



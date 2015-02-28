
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// Buttons
// Homescreen Buttons
Button[] hsButtons;
// Gameover Buttons
Button[] goButtons;

// Extras
int gridGlow = 0;

// Game Time
int startTime;
boolean countdown = false;

// Game Position
String game = "homescreen";
// Winner
String winner = "";
// Scoring
int score;

// Minim (Audio)
Minim minim;
AudioPlayer player1;
AudioSample snippet1, snippet2, startGame;

// Homescreen Images
PImage homescreen = new PImage();

// Ember Arrays
ArrayList embers = new ArrayList();
ArrayList deadEmbers = new ArrayList();

// Bat Embers
ArrayList batEmbers = new ArrayList();
ArrayList deadBatEmbers = new ArrayList();

// Fire Effects
ArrayList FireBalls = new ArrayList();
float fbRand = 3;

ArrayList Flames = new ArrayList();
ArrayList deadFlames = new ArrayList();

// Embers Properties
float Speed = 3;
float RandomSpeed = 0.8;
float Gravity = 0.1;

// Camera Values
float camX;
float camVel = 0;
float camSpeed = 5;
float maxSpeed = 15;
float camWidth;

// Oponent Values
float enemyX;
float enemySpeed = 15;

// Ball Values
PVector ballPos;
PVector ballVel;
float ballRad = 20;
PVector[] trail;

// Scores
int score1 = 0;
int score2 = 0;

// Fonts
PFont courierBold24, courierBold48;

void setup() {
  size(720, 405, P3D);
  
  // Initialize Buttons
  hsButtons = new Button[0];
  goButtons = new Button[0];
  // Initialize Homescreen Buttons
  for(int b=0; b<4; b++){
    PVector pos = new PVector(width/2, height/2 - 30 + b*60);
    PVector siz = new PVector(200, 50);
    String str = "";
    if(b==0){
      str = "Start";
    } else if(b==1){
      str = "Multiplayer";
    } else if(b==2){
      str = "High Scores";
    } else {
      str = "Settings";
    }
    hsButtons = (Button[]) append(hsButtons, new Button( pos, siz, str ));
  }
  // Initialize Gameover Buttons
  for(int b=0; b<4; b++){
    PVector pos = new PVector(width/2, height/2 - 30 + b*60);
    PVector siz = new PVector(200, 50);
    String str = "";
    if(b==0){
      str = "Restart";
    } else if(b==1){
      str = "High Scores";
    } else if(b==2){
      str = "Submit Score";
    } else {
      str = "Home Screen";
    }
    goButtons = (Button[]) append(goButtons, new Button( pos, siz, str ));
  }
  
  // Load Sounds
  minim = new Minim(this);
  player1 = minim.loadFile("menu-1.wav");
  //player1.play();
  player1.loop();

  snippet1 = minim.loadSample("pong-1.wav");
  snippet2 = minim.loadSample("pong-2.wav");
  startGame = minim.loadSample("start-1.wav");

  // Load Images
  homescreen = loadImage("homescreen-2.jpg");

  // Get Font
  courierBold24 = loadFont("CourierNewPS-BoldMT-24.vlw");
  courierBold48 = loadFont("CourierNewPS-BoldMT-48.vlw");

  loadGame();
}

void loadGame() {
  // Reset Ball's Trail
  trail = new PVector[0];
  
  // Reset Score
  score = 0;
  
  // Initialize Camera's X Position
  camX = width/2;
  // Reset Camera's Velocity
  camVel = 0;
  // Camera / Bat's Width
  camWidth = width/5;
  // Initialize Opponent's Position
  enemyX = width/2;

  // Initialize Ball Position
  ballPos = new PVector(width/2, width/2, -40);
  // Initialize Ball Velocity
  ballVel = new PVector(0, 0);

  for (int f=0; f<20; f++) {
    FireBalls.add(new FireBall());
  }
}

void draw() {
  background(0);

  if (game == "homescreen") {
    homeScreen();
  } 
  else if (game == "game") {
    playGame();
  } 
  else if (game == "gameover") {
    gameOver();
  }
}

void homeScreen() {
  camera();
  image(homescreen, 0, 0);
  drawEmbers();
  
  rectMode(CORNER);
  noFill();
  stroke(255);
  strokeWeight(2);
  rect(24, height/2-55, 210, 230);
  
  textFont(courierBold24);
  textSize(24);
  textAlign(CENTER);
  noStroke();
  fill(255);
  rectMode(CENTER);
  
  text("High Scores\n\n...will go\nhere.", 24+105, height/2 - 24);
  
  // Draw Homescreen Buttons
  for(int b=0; b<hsButtons.length; b++){
    hsButtons[b].display();
  }
}

void gameOver() {
  camera();
  
  textFont(courierBold48);
  textSize(48);
  textAlign(CENTER);
  noStroke();
  //noFill();
  
  fill(255);
  text("Game Over!\n", width/2, 48);
  text(winner, width/2, 92);

  textFont(courierBold24);
  textSize(24);
  text("Score: " + score, width/2, 128);
  
  noFill();
  stroke(255);
  rectMode(CENTER);
  
  // Draw Gameover Buttons
  for(int b=0; b<goButtons.length; b++){
    goButtons[b].display();
  }
  
  drawEmbers();
}

void playGame() {
  // Calculate score
  if (game == "game") {
    score = (millis() - startTime)/10;
  }

  // Add Velocity to Ball Position
  ballPos.add(ballVel);
  
  // Countdown and Audio
  beginGame();

  // Move Opponent's Bat
  if (ballPos.y > width/2 && ballPos.y < width) {

    if (ballPos.x > enemyX+20) {
      enemyX += enemySpeed;
    } 
    else if (ballPos.x < enemyX-20) {
      enemyX -= maxSpeed;
    } 
    else {
      enemyX += (ballPos.x - enemyX)*0.2;
    }

    // Impossible to beat
    //enemyX += (ballPos.x - enemyX)*0.5;
  }

  // Check if keys are pressed
  if (keyPressed && game == "game") {
    // Left or A
    if (keyCode == LEFT/*37*/ || keyCode == 65) {
      camVel -= camSpeed;
    } 
    else
      // Right or D
      if (keyCode == RIGHT/*39*/ || keyCode == 68) {
        camVel += camSpeed;
      }
  }

  // Constrain Velocity
  camVel = constrain(camVel, -maxSpeed, maxSpeed);
  // Add elocity to Camera X
  camX += camVel;
  // Constrain Camera X
  camX = constrain(camX, 0+width/10, width-width/10);
  // Dampen Velocity
  camVel *= 0.8;

  // Draw Camera
  camera(camX, -68, -50, camX, width/2, 0, 0, -1, 0);

  drawEmbers();
  drawGrid();
  drawTrail();

  // Rebound Right
  if (ballPos.x > width-ballRad && ballPos.y < width) {
    ballPos.x = width-ballRad;
    ballVel.x *= -1;
  }
  // Rebound Left
  if (ballPos.x < 0+ballRad && ballPos.y < width) {
    ballPos.x = 0+ballRad;
    ballVel.x *= -1;
  }
  // Rebound Far Side
  if (ballPos.y > width-ballRad && ballPos.y < width && ballPos.x > enemyX-camWidth/2 && ballPos.x < enemyX+camWidth/2) {
    ballPos.y = width-ballRad;
    ballVel.y *= -1;
    // Bounce Sound
    snippet1.trigger();
    // Make Grid Glow
    gridGlow = 255;
    
    batExplosion();
  }
  else if (ballPos.y > width) {
    // Winning Bonus
    if(game == "game"){
      score *= 2;
      // Play Winning Song
      player1.close();
      player1 = minim.loadFile("win-1.wav");
      player1.play();
    }
    winner = "You Win!";
    game = "gameover";
  }
  // Rebound Camera
  if (ballPos.y < 0+ballRad && ballPos.y > 0-ballRad && ballPos.x > camX-camWidth/2 && ballPos.x < camX+camWidth/2) {
    ballPos.y = 0+ballRad;
    ballVel.y *= -1.1;
    ballVel.x += constrain(ballPos.x - camX, -5, 5);
    // Bounce Sound
    snippet2.trigger();
    // Make Grid Glow
    gridGlow = 255;
  } 
  else if (ballPos.y < 0-ballRad) {
    // Loosing Penalty
    if(game == "game"){
      score /= 2;
      // Play Loosing Song
      player1.close();
      player1 = minim.loadFile("loose-1.wav");
      player1.play();
    }
    winner = "You Loose!";
    game = "gameover";
  }

  noStroke();
  //lights();

  // Save Canvas
  pushMatrix();
  // Draw opposing Bat
  translate(enemyX, width, -40);
  fill(255, 255-gridGlow/2, 255-gridGlow);
  box(camWidth, 10, 40);
  // Restore Canvas
  popMatrix();

  // Save Canvas
  pushMatrix();
  // Ball Position
  translate(ballPos.x, ballPos.y, ballPos.z);
  fill(200, 50, 0);
  sphere(ballRad);
  // Restore Canvas
  popMatrix();

  drawFireBalls();
  drawBatEmbers();
}

void beginGame(){
  // Begin Game
  if (millis() >= startTime + 4000 && ballVel.y == 0) {
    ballVel = new PVector(random(-10, 10), 5);
  }
  // Countdown Sounds
  if (millis() >= startTime + 1000 && countdown == false) {
    countdown = true;
    startGame.trigger();
  }

  camera();
  textFont(courierBold48);
  textSize(48);
  textAlign(CENTER);
  noStroke();
  //noFill();
  fill(255);

  // Countdown Text
  if (millis() >= startTime + 1000 && millis() <= startTime + 2000 && ballVel.y == 0) {
    text("3", width/2, height/2 + 12);
  } 
  else if (millis() >= startTime + 2000 && millis() <= startTime + 3000 && ballVel.y == 0) {
    text("2", width/2, height/2 + 12);
  } 
  else if (millis() >= startTime + 3000 && millis() <= startTime + 4000 && ballVel.y == 0) {
    text("1", width/2, height/2 + 12);
  } 
  else if (millis() >= startTime + 4000 && millis() <= startTime + 5000) {
    text("GO!", width/2, height/2 + 12);
  }
}

void drawGrid(){
  gridGlow = constrain(gridGlow, 0, 255);
  
  rectMode(CORNER);
  noFill();
  // Grid Color / Glow
  stroke(255, 255-gridGlow/2, 255-gridGlow);
  
  strokeWeight(1);
  strokeCap(ROUND);
  // Draw Grid
  for (int x=0; x<width; x+=width/10) {
    for (int y=0; y<width; y+=width/10) {
      rect(x, y, width/10, width/10);
    }
  }
  
  gridGlow -= 10;
}

void keyPressed() {
  // Uncomment to print the keyCode of the currently pressed key
  //println(keyCode);
}

// Stop Audio
void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  player1.close();
  snippet1.close();
  snippet2.close();
  startGame.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();

  // this calls the stop method that
  // you are overriding by defining your own
  // it must be called so that your application
  // can do all the cleanup it would normally do
  super.stop();
}

class Button{
  PVector bSiz;
  PVector bPos;
  String bText;
  
  Button(PVector pos, PVector siz, String btext){
    bPos = pos;
    bSiz = siz;
    bText = btext;
  }
  
  void display(){
    rectMode(CENTER);
    textAlign(CENTER);
    noFill();
    strokeWeight(2);
    textFont(courierBold24);
    textSize(24);
    
    if(mouseX < bPos.x+bSiz.x/2 &&
      mouseX > bPos.x-bSiz.x/2 &&
      mouseY < bPos.y+bSiz.y/2 &&
      mouseY > bPos.y-bSiz.y/2){
      stroke(255, 150, 0);
    } else {
      stroke(255);
    }
    
    rect(bPos.x, bPos.y, bSiz.x, bSiz.y);
    
    fill(255);
    text(bText, bPos.x, bPos.y + 8);
  }
  
}
void drawFireBalls() {
  for (int i=0; i<FireBalls.size(); i++) {
    FireBall f = (FireBall)FireBalls.get(i);
    f.display();
  }
}

void drawEmbers() {
  if (embers.size() < 200) {
    if (deadEmbers.size() > 0) {
      Ember dp = (Ember)deadEmbers.get(0);
      if(game == "homescreen" || game == "gameover"){
        dp.pPos = new PVector(width/2, height, 200);
      } else {
        dp.pPos = new PVector(ballPos.x, ballPos.y, ballPos.z);
      }
      dp.pVel = new PVector(random(-Speed, Speed), random(-Speed, Speed), random(-Speed, Speed));
      dp.pSiz = 10;
      dp.enabled = true;
      embers.add(dp);
      deadEmbers.remove(0);
    } 
    else {
      if(game == "homescreen" || game == "gameover"){
        embers.add(new Ember(new PVector(width/2, height, 200)));
      } else {
        embers.add(new Ember(new PVector(ballPos.x, ballPos.y, ballPos.z)));
      }
    }
  }

  for (int i=0; i<embers.size(); i++) {
    Ember p = (Ember) embers.get(i);

    if (!p.enabled) {
      deadEmbers.add(p);
      embers.remove(i);
    }

    p.move();
    p.display();
  }
}

void batExplosion(){
  
  for(int e=0; e<camWidth; e++){
    if(deadBatEmbers.size() > 0){
      
      Ember em = (Ember) deadBatEmbers.get(0);
      em.pPos = new PVector(enemyX - camWidth/2 + e, width, -60);
      em.pVel = new PVector(random(-Speed, Speed), random(-Speed, Speed), random(-Speed, Speed));
      em.pSiz = 10;
      em.enabled = true;
      batEmbers.add(em);
      deadBatEmbers.remove(0);
      
    } else {
      batEmbers.add(new Ember(new PVector(enemyX - camWidth/2 + e, width, -60)));
    }
  }
  
}

void drawBatEmbers(){
  
  for(int e=0; e<batEmbers.size(); e++){
    Ember em = (Ember) batEmbers.get(e);
    
    if(em.enabled == false){
      deadBatEmbers.add(em);
      batEmbers.remove(e);
    }
    
    em.move();
    em.display();
  }
  
}

void drawTrail(){
  trail = (PVector[]) append(trail, new PVector(ballPos.x, ballPos.y));
  
  // Add Previous Ball Positions
  if(trail.length > 50){
    trail = (PVector[]) subset(trail, 1);
  }
  
  // 
  for(int i=0; i<trail.length; i++){ 
    noStroke();
    fill(255, 150, 0, i*2);
    ellipse(trail[i].x, trail[i].y, i, i);
  }
}
class Ember{
  PVector pVel;
  PVector pPos;
  float pSiz;
  boolean enabled;
  
  Ember(PVector pos){
    enabled = true;
    pSiz = 10;
    pVel = new PVector(random(-Speed, Speed), random(-Speed, Speed), random(-Speed, Speed));
    pPos = pos;
  }
  
  void move(){
    // Add Random Movement
    pVel.add(new PVector(random(-RandomSpeed, RandomSpeed), random(-RandomSpeed, RandomSpeed), random(-RandomSpeed, RandomSpeed)));
    // Implement Gravity
    pVel.z -= Gravity;
    // Implement Velocity
    pPos.add(pVel);
    
    // Dampen Velocity
    pVel.mult(0.99);
    
    // Decrease Size
    pSiz -= 0.1;
    
    if(pSiz <= 0){
      enabled = false;
    }
  }
  
  void display(){
    if(enabled){
      strokeWeight(pSiz/5);
      stroke(255, pSiz*25.5/2, 0);
      strokeCap(ROUND);
      fill(255, pSiz*25.5, 0);
      line(pPos.x, pPos.y, pPos.z, pPos.x - pVel.x*2, pPos.y - pVel.y*2, pPos.z - pVel.z);
    }
  }
  
}
class FireBall{
  color c;
  PVector fbPos;
  float fbRad;
  
  FireBall(){
    PVector rand = new PVector(random(-fbRand, fbRand), random(-fbRand, fbRand), random(-fbRand, fbRand));
    fbPos = new PVector(ballPos.x, ballPos.y, ballPos.z);
    fbPos.add(rand);
    fbRad = random(ballRad-20, ballRad);
  }
  
  void display(){
    // Save Canvas State
    pushMatrix();
    
    PVector rand = new PVector(random(-fbRand, fbRand), random(-fbRand, fbRand), random(-fbRand, fbRand));
    fbPos = new PVector(ballPos.x, ballPos.y, ballPos.z);
    fbPos.add(rand);
    
    noStroke();
    //blendMode(ADD);
    fill(255, 150, 0, 50);
    translate(fbPos.x, fbPos.y, fbPos.z);
    sphere(20 + gridGlow*0.05);
    blendMode(NORMAL);
    
    // Restore Canvas State
    popMatrix();
  }
  
}
class Flame{
  float speed;
  float gravity;
  float pRad;
  int life;
  
  PVector pPos;
  PVector pVel;
  
  Flame(){
    speed = 0.1;
    gravity = 0.1;
    pRad = 10;
    life = 100;
    
    pPos = new PVector(mouseX, mouseY);
    pVel = new PVector(random(-speed, speed), random(-speed, speed));
  }
  
  void move(){
    // Distance from Mouse
    float d = dist(mouseX, mouseY, pPos.x, pPos.y);
    float r = constrain(life*0.1, 0, 10);
    
    // Radius - Distance From Mouse
    pRad = r;
    
    pVel.y -= gravity;
    pPos.x += (mouseX - pPos.x)*0.01;
    
    pPos.add(pVel);
    
    if(r <= 0){
      pPos = new PVector(mouseX, mouseY);
      pVel = new PVector(random(-speed, speed), random(-speed, speed));
      life = 100;
    }
    
    life -= 2;
  }
  
  void display(){
    noStroke();
    colorMode(HSB);
    fill(pRad*5 - 20, 650 - pRad*50, pRad*30);
    ellipse(pPos.x, pPos.y, pRad, pRad);
  }
  
}
void mousePressed() {
  // Start Button Pressed
  if(game == "homescreen" &&
      mouseX < hsButtons[0].bPos.x+hsButtons[0].bSiz.x/2 &&
      mouseX > hsButtons[0].bPos.x-hsButtons[0].bSiz.x/2 &&
      mouseY < hsButtons[0].bPos.y+hsButtons[0].bSiz.y/2 &&
      mouseY > hsButtons[0].bPos.y-hsButtons[0].bSiz.y/2){
    countdown = false;
    player1.close();
    player1 = minim.loadFile("game-1.wav");
    player1.loop();
    game = "game";
    startTime = millis();
  // Restart Button Pressed
  } else if(game == "gameover" &&
      mouseX < goButtons[0].bPos.x+goButtons[0].bSiz.x/2 &&
      mouseX > goButtons[0].bPos.x-goButtons[0].bSiz.x/2 &&
      mouseY < goButtons[0].bPos.y+goButtons[0].bSiz.y/2 &&
      mouseY > goButtons[0].bPos.y-goButtons[0].bSiz.y/2){
    loadGame();
    countdown = false;
    player1.close();
    player1 = minim.loadFile("game-1.wav");
    player1.loop();
    game = "game";
    startTime = millis();
  } else if(game == "gameover" &&
      mouseX < goButtons[3].bPos.x+goButtons[3].bSiz.x/2 &&
      mouseX > goButtons[3].bPos.x-goButtons[3].bSiz.x/2 &&
      mouseY < goButtons[3].bPos.y+goButtons[3].bSiz.y/2 &&
      mouseY > goButtons[3].bPos.y-goButtons[3].bSiz.y/2){
    loadGame();
    countdown = false;
    player1.close();
    player1 = minim.loadFile("menu-1.wav");
    player1.loop();
    game = "homescreen";
    startTime = millis();
  }
}



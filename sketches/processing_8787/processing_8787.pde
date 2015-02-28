
/**
 * AVOIDANCE
 * by Jonathan Rioux
 * inspired from SimpleParticuleSystem exemple
 * 
 * Avoid the particules with your mouse.
 */

final int level1 = 500;

final int linePos = 30; // The position of the line from where the particule will be thrown
final int timeBetween = 2; // Time between the trowing of two particules

ParticleSystem ps;
int timer = timeBetween;
PFont alertFont, levelFont, scoreFont;
int currentLevel;
int toNextLevel;

// Restart button coordonnates
int x1, x2, y1, y2;

void setup() {
  alertFont = loadFont("Ziggurat-HTF-Black-32.vlw");
  levelFont = loadFont("LucidaCalligraphy-Italic-48.vlw");
  scoreFont = loadFont("CourierNew36.vlw");

  currentLevel = 1;
  toNextLevel = level1;

  // Restart button coordonates
  x1 = 10;
  x2 = 80;
  y1 = height-30;
  y2 = height-50;

  size(640, 480);
  colorMode(RGB, 255, 255, 255, 100);
  ps = new ParticleSystem(1, new PVector(width/2,height/2,0));
  smooth();
}

void draw() {
  if(toNextLevel > 0){
    background(0);
    ps.run();

    showRestartButton();
    showScore();

    if(ps.godMode()){
      textFont(alertFont, 30);
      fill(color(255,80,20));
      textAlign(CENTER);
      text("YOU'V BEEN TOUCHED!", width/2, height / 2 - 50);
      textFont(alertFont, 20);
      text("+50 particules :(", width/2, height / 2 - 20);
    }

    if(timer <= 0){
      ps.addParticle(linePos);
      timer = timeBetween;
    }
    else{
      timer--;
    }
  }
  else{
    background(0);
    showRestartButton();
    showScore();
    textFont(levelFont, 40);
    fill(color(20,200,50));
    textAlign(CENTER);
    text("LEVEL COMPLETED!", width/2, height / 2 - 50);
    textFont(levelFont, 20);
    text("There is actually only one level... sorry :(", width/2, height / 2 - 20);
    ps.noGravity();
  }
}

void mousePressed()
{
  if(overRestart()){
    setup();
  }
}

boolean overRestart() {
  if (mouseX >= 10 && mouseX <= 80 && 
    mouseY >= (height-30) && mouseY <= (height-10)) {
    return true;
  } 
  else
    return false;
}

void showRestartButton(){
  stroke(255);
  fill(50);
  rect(10, height-30, 70, 20);
  textFont(scoreFont, 13);
  fill(color(50,255,0));
  textAlign(LEFT);
  text("RESTART", 17, height - 15);
}

void showScore(){
  textFont(scoreFont, 15);
  fill(50,255,0);
  textAlign(RIGHT);
  text("Current level: "+currentLevel, width - 20, height - 60);
  text("Touched: "+ps.hitCount+" time"+ (ps.hitCount > 1 ? "s" : ""), width - 20, height - 40);
  text("Next level in: "+toNextLevel+" particules", width - 20, height - 20); 
}



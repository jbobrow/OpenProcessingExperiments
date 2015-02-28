
import netscape.javascript.*;

boolean debug = false;

Rectangle player1pad;
MouseTracker player2;
ScoreTracker score;

ArrayList balls;
int maxBalls = 6;

void setup() {
  
  score = new ScoreTracker(20,30, 400 - 80 ,600 - 20);
  player1pad = new Rectangle (40, 555, 80, 20, color(255, 255, 255));
  player2    = new MouseTracker (200,150,150,150);
 
  balls = new ArrayList();
 
  /*
  for (int i = 0; i < maxBalls; i++) {
    balls.add(new Circle(200 + (i * 40), 100, 40, 0.5, 0.5, i));    
  }
  */

  size(400, 600);
  smooth();
}

void draw() {  

  background(0);
  player2.update();
  player1pad.update();
  
  for (int i = 0; i < balls.size(); i++) {
      Circle calBall = (Circle) balls.get(i);
      if (!calBall.finished) {
        calBall.update();
      }  
      else { 
        calBall = null;
        balls.remove(i);
      }
  
  }
  score.drawSelf();
}

void mousePressed() {
  player2.clickTrack(mouseX,mouseY);
  //println(mouseX + ", " + mouseY);
}

void keyPressed() {
  player1pad.inputReac(key);

  if (key == ' ') {
    if (debug == false) debug = true;
    else                debug = false;
  }

}





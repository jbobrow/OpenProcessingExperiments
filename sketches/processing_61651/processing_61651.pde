
float angle = 0;
float xspeed;
float yspeed;
int score;
final int PAR = 4;

void setup() {
  size(450, 320);
  smooth();
  textAlign(LEFT);
  fill(0);
  text("Score", 10, 20);
  text(score, 80, 20);

}

void draw() {
  background(0,175,0);
  //scores
  fill(0);
  text("Score", 10, 20);
  text(score, 50, 20);
  text("Par", 10, 35);
  text(PAR, 50, 35);
  //walls
  stroke(0);
  strokeWeight(2);
  line(100, 100, 300, 100);
  line(100, 100, 100, 200);
  line(100, 200, 300, 200);
  line(300, 200, 300, 320);
  
  
  //hole
  fill(50);
  ellipse(150, 150, 20, 20);
  //ball
  noStroke();
  fill(255);
  ellipse(250, 260, 18, 18);
  
  //paddle
  translate(mouseX,mouseY);
  rotate(angle);
  stroke(175,105,0);
  strokeWeight(4);
  rect(-1.5,-10,3,20);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      angle += 0.1;
    } else if (keyCode == RIGHT) {
      angle -= 0.1;
    }
  }
}

void mouseClicked() {
  score++;
}


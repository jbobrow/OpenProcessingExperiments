
boolean begin = false;
PFont font;
float x = 250;
float y = 100;
float speedX = 5;
float speedY = 5;
int leftColor = 255;
int rightColor = 255;
int diameter;
int rectSize = 150;
float hit;

void setup() {

  font = loadFont("Baskerville-BoldItalic-48.vlw");
  size(500, 500);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  frameRate(30);
}

void draw()
//keeps the text written throughout every frame

{
  background(135, 206, 250);

  fill(255);
  textSize(30);
  text("Click to Begin", 50, 50);
  textSize(20);
  text("(Proceed with Caution)", 50, 70);
  textSize(15);
  text("Directions:", 100, 380);
  text("Hit the ball with the bar, which is your mouse. Amazing, 100, 400);

  //ball   
  fill(178, 34, 34);
  diameter = 20;
  ellipse(x, y, diameter, diameter);
  fill(leftColor, 0, leftColor);
  //moving plank
  fill(0, rightColor, 0);
  rect(mouseX+20, height- 20, rectSize, 10);


  if (begin) {
    x = x + speedX;
    y = y + speedY;
    // ball hits plank, change direction X
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/5 && y < mouseY+rectSize/5 ) {
      speedX = speedX * -1.3;
      x = x + speedX/5;
      rightColor = 0;
      fill(random(0, 128), random(0, 128), random(0, 128));
      hit = random(75, 150);
      ellipse(x, y, hit, hit);
      rectSize = rectSize-20;

      fill(255, 255, 0);
      text("NICE!.", 100, width/2);
    }

    // if ball hits wall, change direction X
    else if (x < 1) {
      speedX = speedX * -1;
      x = x + speedX;
      leftColor = 0;
    }

    else {    
      leftColor = 255;
      rightColor = 255;
    }
    // reset if game is lost
    if (x > width) {
      begin = false;
      x = 150;
      y = 150;
      speedX = random(3, 5);
      speedY = random(3, 5);
      rectSize = 150;
    }


    // Ball hits Upper/Lower Bound, "bounces"
    if ( y > height || y < 0 ) {
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
}
//restart/pause/lose
void mousePressed() {
  begin = !begin;

  fill(255);
  text("TOO BAD", 100, 100);
}

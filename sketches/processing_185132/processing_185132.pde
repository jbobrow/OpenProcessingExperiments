
/**
 * Clock. 
 * 
 * The current time can be read with the second(), minute(), 
 * and hour() functions. In this example, sin() and cos() values
 * are used to set the position of the hands.
 */

//Import 'Minin' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample Sound;
//Load audio file from HDD

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;

void setup() {
  size(900, 600);
  stroke(0);

  minim = new Minim(this);
  Sound = minim.loadSample("Twilight.mp3");

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.32;
  minutesRadius = radius * 0.30;
  hoursRadius = radius * 0.20;
  clockDiameter = radius * 0.8;

  cx = width / 2;
  cy = height / 2;
}

void draw() {
  background(0);

  // Draw the clock background
  fill(255, 0, 0, 255);
  noStroke();
  ellipse(cx, cy, clockDiameter, clockDiameter);

  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;

  // Draw text
  fill(193, 164, 14);
  textSize(44);
  textAlign(RIGHT);
  text("Love", 810, 350);

  // Draw red ellipses
  fill(255, 0, 0, 0255);
  ellipse(150, 200, 40, 40);
  ellipse(140, 230, 40, 40);
  ellipse(60, 340, 40, 40); 
  ellipse(80, 360, 40, 40);
  ellipse(870, 400, 40, 40); 
  ellipse(900, 420, 40, 40);
  ellipse(90, 160, 40, 40); 
  ellipse(80, 180, 40, 40);
  ellipse(300, 60, 40, 40); 
  ellipse(310, 80, 40, 40);
  ellipse(660, 10, 40, 40); 
  ellipse(670, 20, 40, 40);
  ellipse(360, 520, 40, 40);
  ellipse(370, 530, 40, 40);
  ellipse(570, 580, 40, 40);
  ellipse(580, 590, 40, 40);

  // Draw ellipse big red of clock
  ellipse(450, 300, 300, 300); 

  // Draw gray ellipses
  fill(255, 30);
  ellipse(40, 140, 40, 40);
  ellipse(60, 170, 40, 40); 
  ellipse(120, 130, 40, 40);
  ellipse(140, 160, 40, 40); 
  ellipse(40, 160, 40, 40); 
  ellipse(70, 160, 40, 40); 
  ellipse(140, 140, 40, 40); 
  ellipse(80, 50, 40, 40); 
  ellipse(80, 30, 40, 40); 
  ellipse(80, 60, 40, 40);
  ellipse(160, 250, 40, 40); 
  ellipse(180, 230, 40, 40); 
  ellipse(170, 260, 40, 40);
  ellipse(110, 300, 40, 40); 
  ellipse(130, 310, 40, 40); 
  ellipse(140, 330, 40, 40);
  ellipse(110, 380, 40, 40); 
  ellipse(130, 390, 40, 40); 
  ellipse(120, 400, 40, 40);
  ellipse(120, 480, 40, 40);
  ellipse(120, 490, 40, 40);
  ellipse(90, 500, 40, 40);
  ellipse(170, 530, 40, 40);
  ellipse(190, 550, 40, 40);
  ellipse(790, 530, 40, 40);
  ellipse(770, 530, 40, 40);
  ellipse(750, 510, 40, 40);
  ellipse(870, 560, 40, 40);
  ellipse(770, 530, 40, 40);
  ellipse(800, 160, 40, 40);
  ellipse(810, 180, 40, 40);
  ellipse(860, 200, 40, 40);
  ellipse(810, 150, 40, 40);
  ellipse(860, 170, 40, 40);
  ellipse(830, 100, 40, 40);
  ellipse(860, 90, 40, 40);
  ellipse(810, 40, 40, 40);
  ellipse(810, 20, 40, 40);
  ellipse(780, 80, 40, 40);
  ellipse(760, 90, 40, 40);
  ellipse(680, 80, 40, 40);
  ellipse(700, 90, 40, 40);
  ellipse(600, 100, 40, 40);
  ellipse(620, 110, 40, 40);
  ellipse(610, 120, 40, 40);
  ellipse(720, 390, 40, 40);
  ellipse(730, 400, 40, 40);
  ellipse(730, 410, 40, 40);
  ellipse(720, 390, 40, 40);
  ellipse(730, 400, 40, 40);
  ellipse(730, 410, 40, 40);
  ellipse(650, 440, 40, 40);
  ellipse(660, 450, 40, 40);
  ellipse(660, 470, 40, 40);
  ellipse(490, 520, 40, 40);
  ellipse(490, 530, 40, 40);
  ellipse(500, 550, 40, 40);
  ellipse(520, 10, 40, 40);
  ellipse(530, 20, 40, 40); 
  ellipse(250, 20, 40, 40);
  ellipse(260, 20, 40, 40);

  // Draw the hands of the clock
  stroke(0);
  strokeWeight(1);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  strokeWeight(2);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  strokeWeight(4);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);

  // Draw the minute ticks
  strokeWeight(2);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius;
    float y = cy + sin(angle) * secondsRadius;
    vertex(x, y);
  }

  endShape();
}

void keyPressed() {
  if ( key == 'b' ) Sound.trigger();
  save("Clock Love.png");
}



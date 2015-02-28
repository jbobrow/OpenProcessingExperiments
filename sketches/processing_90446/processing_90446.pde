
/* @pjs font="Cochin-BoldItalic-48.vlw"*/
PFont font;
float timer = 10;
int score = 0;
float time = 0;
 
float boxX = 0;
float boxY = 0;
float boxSize = 150;
 
 
void setup() {
  font = loadFont("Cochin-BoldItalic-48.vlw");
  textFont(font, 32);
  size(400, 300);
  background(0);
}
 
void draw() {
  time += 0.0167;
  timer -= 0.0167; 
  
  if (time > 0.5) {
    background(0);
    fill(random(255), random(255), random(255));
    boxX = width/2 -50;
    boxY = height/2-50;
    rect(boxX, boxY, boxSize, boxSize);
    time = 0;
  }
   
  fill(255);
  rect(0,0,150, 100);
   
  fill(0);
  
     text("TIMER:"+ timer,5,80);

if (score >= 50 && timer <= 0) {
    fill(0)
    rect(0,0,width,height);
    fill(255);
    text("NICE!", width / 2, 40);
    text("Complete", width/2, 60);
  }
   
  text("Score: " + score, 15, 40);
}
 
void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX < (boxX + boxSize)
      && mouseX > boxX
      && mouseY < (boxY + boxSize)
      && mouseY > boxY)
    {
      score++;
    }
    
  }
}


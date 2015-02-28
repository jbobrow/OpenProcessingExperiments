
int x, y;
int startTime;
boolean gotIt = false;
float showTime = 3000;
int bgColor = #face95;
int score = 0;
PImage lose;
  

void setup() {
  size(400, 400);
  startTime = millis();
  fill(255, 0, 0);
  newRandomLocation();
  lose = loadImage("zit.jpg");
}
  
void draw() {
  background(bgColor);
  if (bgColor == 255)
     bgColor = 150;
  showScore();
  if (!gotIt && millis() - startTime < showTime) {
     fill(255 * (1 - (millis() - startTime)/showTime), 0, 0);
     ellipse(x, y, 25, 25);
      
  }
  else {
    newRandomLocation();
     
      
  }
}
  
void newRandomLocation() {
  x = (int)random(0, width);
  y = (int)random(0, height);
  gotIt = false;
  startTime = millis();
}
  
 
void mousePressed() {
  if (dist(mouseX, mouseY, x, y) < 50) {
    score += 10;
    gotIt = true;
    showTime = 0.9 * showTime;
  }
  else
    bgColor = #df5d66;
   fill(255);
}
  
void showScore() {
  fill(0);
  text(score, 3, height - 3);
  textSize(40);
    
  smooth();
  strokeWeight(2);
  fill(180, 240, 220);
  stroke(140, 200, 180);
  ellipseMode(RADIUS);
  float x = mouseX;
  float y = mouseY;
  fill(255);
  stroke(100);
  ellipse(300, 200, 40, 40);
  ellipse(220, 200, 40, 40);
   
  smooth();
  fill(0,0,0,0);
  beginShape();
  vertex((200+((600-x)/8)), (240+((600-y)/5)));
  bezierVertex((200+((600-x)/8)), (260+((600-y)/8)), (240+((600-x)/8)), (260+((600-y)/8)), (240+((600-x)/8)), (240+((600-y)/5)));
  endShape();
   
  fill(0);
  if (x>280){
  ellipse((280+(((x-280)/320)*40)), (180+((y/600)*40)), 10, 10);
  ellipse(240, (180+((y/600)*40)), 10, 10);
  } else {
  ellipse(280, (180+((y/600)*40)), 10, 10);
  ellipse((200+((x/280)*40)), (180+((y/600)*40)), 10, 10);
  }
 
}




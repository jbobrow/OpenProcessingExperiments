
void setup() {
  frameRate(1);
  size(450, 700);
  door(0, 0, 225, 700);
  door(225, 0, 450, 700);
  door(25, 30, 170, 500);
  door(255, 30, 170, 500);
  door(198, 315, 23, 70);
  door(229, 315, 23, 70);
  window(209, 350, 20, 20);
  window(241, 350, 20, 20);
  door(235, 420, 10, 100);
  door(205, 420, 10, 100);
  door(25, 580, 170, 70);
  door(255, 580, 170, 70);
  fill(random(255), random(255), random(255));
  textSize(40);
  text("721", 75, 255);
  fill(random(255), random(255), random(255));
  textSize(12);
  text("BROADWAY", 80, 280);
  fill(random(255), random(255), random(255));
  textSize(40);
  text("721", 300, 255);
  fill(random(255), random(255), random(255));
  textSize(12);
  text("BROADWAY", 305, 280);
  
  
  

}
void draw() {
  door(0, 0, 225, 700);
  door(225, 0, 450, 700);
  door(25, 30, 170, 500);
  door(255, 30, 170, 500);
  door(198, 315, 23, 70);
  door(229, 315, 23, 70);
  window(209, 350, 20, 20);
  window(241, 350, 20, 20);
  door(235, 420, 10, 100);
  door(205, 420, 10, 100);
  door(25, 580, 170, 70);
  door(255, 580, 170, 70);
  fill(random(255), random(255), random(255));
  textSize(40);
  text("721", 75, 255);
  fill(random(255), random(255), random(255));
  textSize(12);
  text("BROADWAY", 80, 280);
  fill(random(255), random(255), random(255));
  textSize(40);
  text("721", 300, 255);
  fill(random(255), random(255), random(255));
  textSize(12);
  text("BROADWAY", 305, 280);
}

void door(float doorX, float doorY, float doorW, float doorH) {
  noStroke();
  fill(random(255), random(255), random(255));
  rect(doorX, doorY, doorW, doorH);
}
void window( float windowX, float windowY, float windowW, float windowH) {
  noStroke();
  fill(random(255), random(255), random(255));
  ellipse(windowX, windowY, windowW, windowH);
}




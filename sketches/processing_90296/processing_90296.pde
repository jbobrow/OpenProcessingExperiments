
int height = 115;
int timer=10;
int timeLast = 0;
 
 
void setup() {
  timeLast=second();
  size(200, 200);
}
void draw() {
  if (keyPressed == true && height > 53 && timer > 0) {
    height = height - 1;
  }
  if (second()!=timeLast) {
    timeLast=second();
    timer-=1;
  }
  
  background (0, 100, 250);
  fill (0, 225, 100);
  rect(-5, 120, 230, 150);
  fill(0);
  rect(95, 60, 5, 65);
  fill (255, 0, 0);
  rect(95, height, 20, 10);

   if (timer < 1 && height > 53) {
    fill(255);
    text("YOU LOSE!!", width / 5, 40);
}
  if (height > 53 && timer > 0) {
    fill(255);
    text("PUSH ANY BUTTON", width / 5, 40);
}
  if (height == 53) {
    fill(255);
    text("YOU WIN!!!!!", width / 2, 40);

  }
   
}

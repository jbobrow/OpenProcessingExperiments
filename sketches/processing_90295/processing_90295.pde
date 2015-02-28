
int height = 115;
int timer=10;
 
void setup() {
  size(200, 200);
}
void draw() {
  if (keyPressed == true) {
    height = height - 1;
  }
 
  background (0, 100, 250);
  fill (0, 225, 100);
  rect(-5, 120, 230, 150);
  fill(0);
  rect(95, 60, 5, 65);
  fill (255, 0, 0);
  rect(95, height, 20, 10);
 
 
  if (height < 53) {
    fill(255);
    text("YOU WIN!!!!!", width / 2, 40);

  }
   
}

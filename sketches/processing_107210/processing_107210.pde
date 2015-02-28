
/* # pseudo code
Have beats of squares randomly come in but stay on x axis
1. Create 3 squares (which will be red green blue)
2. Create random for the Y axis and set the x axis for squares
3. only show one square or three max per loop (beat of 3 one per second)
*/

color r, g, b;
int timer;
int rect_size;
int rect_x;
float rect_y1;
float rect_y2;
float rect_y3;
 
void setup() {
  size(512, 512);
  background(0);
  smooth();
  rect_size = 128;
  rect_x = 20;
  rect_y1 = random(384);
  rect_y2 = random(384);
  rect_y3 = random(384);
  r = color(255, 0, 0);
  g = color(0, 255, 0);
  b = color(0, 0, 255);
}
 
void draw() {
  
  background(0);
  
  noStroke();
 
  // use millis() and a timer to change the background every second
  if (millis() - timer >= 1000) {
    //background(random(255));
    //timer = millis(); // Save the current time to restart the timer!
    fill(r);
    rect(rect_x, rect_y1, rect_size, rect_size);
    println("1 of 3");
  }
  if (millis() - timer >= 2000) {
    fill(g);
    rect(rect_x+170, rect_y2, rect_size, rect_size);
    println("2 of 3");
  }
  if (millis() - timer >= 3000) {
    fill(b);
    rect(rect_x+340, rect_y3, rect_size, rect_size);
    println("3 of 3");
  }
  if (millis() - timer >= 4000) {
    println("end");
    timer = millis(); // Save the current time to restart the timer!
    rect_y1 = random(384);
    rect_y2 = random(384);
    rect_y3 = random(384);
  }

}

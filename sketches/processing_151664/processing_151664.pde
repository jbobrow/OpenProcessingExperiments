
/**
 * 25 Squares gone to party
 *
 * By Juan Sebastian Robles Jimenez
 *
 * 25 Squares went out to party, ¿do you dare to count them all?
 * 's' Saves the actual frame.
 * '+' Makes the squares go wilder
*/

int nRect = 25;
int chaosFactor = 10;

void setup()
{
  size(600, 600);
  frameRate(1);
  rectMode(CENTER);
}

void draw()
{
  background(0);
  int g = width / nRect;  
  for (int i = 0; i < nRect; ++i) {
    stroke(random(1, 255), random(1, 255), random(1, 255));
    fill(random(1, 255), random(1, 255), random(1, 255));
    rect((width / 2) + (random(-1, 1) * chaosFactor), (height / 2) + (random(-1, 1) * chaosFactor), width - g * i, height - g * i);    
  }

  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("party25.jpg");
  }
  
  // Increase or decrease chaos factor
  if (keyPressed == true && key=='+') {
    chaosFactor = min(chaosFactor + 10, width / 2);
  }
  
  // Increase or decrease chaos factor
  if (keyPressed == true && key=='-') {
    chaosFactor = max(chaosFactor - 10, 0);
  }
}

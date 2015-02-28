
/**
 * Array Objects. 
 * 
 * Demonstrates the syntax for creating an array of custom objects. 
 */
/** int unit controls the number of white dots on the screen.  I changed it from 40 to 8*/
int unit = 8;
int count;
Module[] mods;
/**the set up size refers to the size of the window that contains the activity.  I increased the size of the window*/
void setup() {
  size(640, 500);
  noStroke();
  int wideCount = width / unit;
  int highCount = height / unit;
  count = wideCount * highCount;
  mods = new Module[count];
/**the mod random controls the movement of the white dots.  I changed it from .8 to 10 which makes the screen appear to shake*/
  int index = 0;
  for (int y = 0; y < highCount; y++) {
    for (int x = 0; x < wideCount; x++) {
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 10), unit);
    }
  }
}
/**background controls the saturation of the background.  I changed the color from black to grey*/
void draw() {
  background(100);
  for (int i = 0; i < count; i++) {
    mods[i].update();
    mods[i].draw();
  }
}


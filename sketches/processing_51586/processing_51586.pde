
//Emotion: Loneliness / Lonely
//1. Create a composition that evokes an emotion with 5 circles

int s = 25;
int x = 230;
void setup() {
  size (500, 500);
  background(0);
  smooth ();
}

void draw() {
  fill (255);
  ellipse (x, x+30, s, s);
  ellipse (x+30, x, s, s);
  ellipse (x, x, s, s);
  ellipse (x+30, x+30, s, s);
  //four ellipses

  fill (100);    
  ellipse (295, 475, 25, 25);
  //lonely ellipse
}


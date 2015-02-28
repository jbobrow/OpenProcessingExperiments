
/* 
Katie Manduca

A random wanderer on the canvas. 
Randomized color in a distinct range 
*/

int lastX, lastY, r, distance;

void setup() {
  size(600, 600);
  background(0);
  stroke(255);
  lastX = width/2;
  lastY = height/2;
}


void draw() {
  int x = lastX;
  int y = lastY;

  r = (int) random(8);
  distance = (int) random(25);
  stroke(random(60), random(255), random(255));
  strokeWeight(random(3));
  
  if (r == 0 || r == 1 || r == 8)
    y -= distance;
  else if (r == 3 || r == 4 || r == 5)
    y += distance;
  if (r == 1 || r == 2 || r == 3)
    x += distance;
  else if (r == 5 || r == 6 || r == 7)
    x -= distance;

  line(lastX, lastY, x, y);

  if (x >= width)
    x = 0;
  else if (x <= 0)
    x = width;

  if (y >= height)
    y = 0;
  else if (y <= 0)
    y = height;

  lastX = x;
  lastY = y;
}

void keyReleased(){

  switch(key){
   case 's':
    saveFrame("ants-####.png");
    break;
  }
} 




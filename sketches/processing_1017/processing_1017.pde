
float x;
float y;
float storedX;
float storedY;
float easing = 0.05;
int[] portraitX = { 
  300, 445, 472, 530, 561, 567, 561, 581, 580, 589, 578,
  600, 612, 603, 572, 563, 574, 570, 575, 582, 525, 416, 310, 239, 200, 182, 
  189, 203, 215, 220, 235, 235, 236, 210, 440 };
int[] portraitY = { 
  300, 0, 60, 103, 117, 133, 156, 175, 190, 210, 228, 247, 
  258, 274, 290, 322, 340,  369, 419, 442, 475, 544, 560, 553, 522, 465, 407,
  346, 297, 265, 208, 168, 140, 112, 0, 0 };
int[] hubSize = { 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 
  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
  5, 5, 5, 5, 5, 5, 5, 5, 5 };
int i = 1;

void setup() 
{
  size(800, 600); 
  smooth();
  background(0);
  ellipseMode(CENTER);
}

void draw() 
{
  float dx = storedX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }

  float dy = storedY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }

  if(abs(dx) <= 1 && abs(dy) <= 1) {
    fill(0, 0, 0, 200);   
    stroke(255,255,255,100);
    i = (int)(random(portraitX.length-1));
    ellipse(x, y, hubSize[i], hubSize[i]);
    storedX = portraitX[i];
    storedY = portraitY[i];
    hubSize[i] += 3;
  }

  noFill();
  ellipse (x, y, hubSize[i], hubSize[i]);
}








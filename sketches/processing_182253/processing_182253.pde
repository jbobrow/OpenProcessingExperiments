
ArrayList<Ripple> ripples = new ArrayList<Ripple>();
Ripple r1;

int duration = 150;
int rand = int(random(1,4));
int c = 0;
int r;
int g;
int b;

//The program creates ripples based on the the mouse position and
//a ripple size (duration) that's defined at 150 to start. The up
//and down arrows change the size of the ripples by one while the
//right and left change the size by 100. When size is changed,
//the new ripple size is printed. Once a ripple reaches its max
//size through a count line, it deletes itself from the array,
//and as it grows in size, the ripple fades out slowly and
//evenly no matter what size it is.
//
//Every time the code is run, it chooses randomly either red,
//green, or blue to be changed by the mouse wheel. The code also
//can pick to change all three instead of creating a single color
//fade, but instead a black to white fade.


void setup()
{
  size(1000,1000);
  background(0);
  frameRate(60);
  if (rand == 1){ r = c; g = 0; b = 0; }
  else if (rand == 2){ r = 0; g = c; b = 0; }
  else if (rand == 3){ r = 0; g = 0; b = c; }
  else if (rand == 4){ r = c; g = c; b = c; }
}

void draw()
{
  if (rand == 1){ r = c; g = 0; b = 0; }
  else if (rand == 2){ r = 0; g = c; b = 0; }
  else if (rand == 3){ r = 0; g = 0; b = c; }
  else if (rand == 4){ r = c; g = c; b = c; }
  fill(r,g,b,15);
  rect(0,0,width,height);
  for (int i = 0; i < ripples.size(); i++)
  {
    Ripple r1 = ripples.get(i);
    r1.drawRipple();
    if (r1.getCount() > duration)
    {
      ripples.remove(i);
    }
  }
}
  
void mousePressed()
{
  ripples.add(new Ripple(mouseX,mouseY,duration));
}

void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  c -= e*15;
  if (c < 0){
    c = 255;
  } else if (c > 255){
    c = 0;
  }
}

void keyPressed() 
{
  if (key == CODED) {
    if (keyCode == UP) {
      duration += 1;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      duration -= 1;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      duration += 100;
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      duration -= 100;
    }
  }
  println(str(duration));
}


class Ripple
{
  int xpos;
  int ypos;
  int count;
  int size;
  float fade;
  float inc;
  
  Ripple(int x, int y, int duration)
  {
    xpos = x;
    ypos = y;
    count = 1;
    fade = map(duration,0,duration,0,150);
    inc = fade / duration;
  }
  
  void drawRipple()
  {
    noFill();
    stroke(255);
    stroke(255,fade);
    fade -= inc;
    count += 1;
    ellipse(xpos,ypos,count,count);
  }
  
  int getCount()
  {
    return count;
  }
}
    
    
    
    
    


int counter;
int i;
int x, y;
int oldx, oldy;
bool yUp;

void setup() {  //setup function called initially, only once
  size(750, 125);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  x = 0;
  y = 30;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(510),75,127,25);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    oldx = x;
    oldy = y;
    ellipse((0+i), height/2, 80*cos(counter), 80*sin(counter));
    ++i;
    ++x;
    if(y <= 30)
    {
        yUp = false;
    }
    else if(y >= 100)
    {
        yUp = true;
    }
    if(yUp = false)
    {
        y += 2;
    }
    else
    {
        y -= 2;
    } 
    stroke(255);
    line(oldx, oldy, x+10, y+10);  
  }
}

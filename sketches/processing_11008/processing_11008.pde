
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/11008*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*created by rebirth*/

float rot;
int steps;

//modifier tags
int mode,colormode,top;
boolean inner,alt;

PFont font;
String info ="";

color Color;
color[] Colors = new color[511];
color[] go_color = new color[511];
int count;
boolean new_color;

//Presets
State[] states = new State[11];

//constants
int max_mode, max_colormode, max_steps, min_steps, max_levels, min_levels;

void setup() 
{
  size(800, 800);
  noStroke();
  smooth();
  background(0);
  frameRate(30);
  rot = 0;

  font = loadFont("ArialMT-48.vlw");
  textFont(font,17);
  new_color = false;

  //constants
  max_mode = 4;
  max_colormode = 4;
  max_steps = 3000;
  min_steps = 25;
  max_levels = 9;
  min_levels = 1;

  //populate the color arrays
  for(int i=0; i < 511; i++) {
    Color = color(int(random(255)),int(random(255)),int(random(255)));
    Colors[i] = Color;
    go_color[i] = color(int(random(255)),int(random(255)),int(random(255)));
  }

  states[1] = new State(0, 3, false, true, 500, 8);
  states[2] = new State(1, 2, true, false, 950, 6);
  states[3] = new State(2, 0, false, true, 500, 9);
  states[4] = new State(3, 3, true, true, 3000, 8);
  states[5] = new State(0, 2, true, false, 500, 6);
  states[6] = new State(3, 1, true, false, 50, 4);
  states[7] = new State(1, 0, false, false, 3000, 9);
  states[8] = new State(3, 1, false, true, 1500, 8);
  states[9] = new State(1, 3, true, true, 825, 3);
  states[0] = new State(2, 1, true, true, 375, 6);
  //user state
  states[10] = new State(0, 3, false, true, 500, 8);

  loadState(1);
}

void draw() 
{
  if (!inner)
    background(0);
  display();
  count = 0;
  rot = TWO_PI / steps * frameCount;
  //start the recursive fun!
  drawCircle(width/2, height/2, width/2, top);
  if (colormode == 2 || colormode == 3)
    new_color = false;
}

void drawCircle(float x, float y, int radius, int level) 
{
  float rot1 = rot;
  switch (colormode) {
  case 0:
    fill(255 - 126 * level/5.0);
    break;
  case 1:
    fill(random(255),random(255),random(255));
    break;
  case 2:
    if (new_color) {
      Colors[count] = color(int(random(255)),int(random(255)),int(random(255)));
    }
    else {
      Color = Colors[count];
    }
    fill(Color);
    break;
  case 3:
    if (new_color) {
      Colors[count] = color(int(random(255)),int(random(255)),int(random(255)));
      go_color[count] = color(int(random(255)),int(random(255)),int(random(255)));
    }
    else {
      Color = colorCycler(Colors[count],go_color[count]);
      Colors[count] = Color;
    }
    fill(Color);
    break;
  }

  count++;

  //draw all levels if not in inner mode, and only the innermost if in inner mode
  if(!inner || level == 1)
    ellipse(x, y, radius*2, radius*2);      
  if(level > 1) {
    level--;
    if (level%2 == 0 && alt)
      rot1 = -rot1;

    //draw two new circles with half the radius.  the angle of rotation depends on the mode
    switch (mode) {
    case 0:
      drawCircle(x + sin(rot1) * radius/2, y + cos(rot1) * radius/2, radius/2, level);
      drawCircle(x + sin(rot1 + PI) * radius/2, y + cos(rot1 + PI) * radius/2, radius/2, level);
      break;
    case 1:
      drawCircle(x + sin(rot1 * level/2) * radius/2, y + cos(rot1 * level/2) * radius/2, radius/2, level);
      drawCircle(x + sin(rot1 * level/2 + PI) * radius/2, y + cos(rot1 * level/2 + PI) * radius/2, radius/2, level);
      break;
    case 2:
      drawCircle(x + sin(rot1 * (top -level)) * radius/2, y + cos(rot1 * (top -level)) * radius/2, radius/2, level);
      drawCircle(x + sin(rot1 * (top -level) + PI) * radius/2, y + cos(rot1 * (top -level) + PI) * radius/2, radius/2, level);
      break;
    case 3:
      drawCircle(x + sin(rot1*level*level/8) * radius/2, y + cos(rot1*level*level/8) * radius/2, radius/2, level);
      drawCircle(x + sin(rot1*level*level/8 + PI) * radius/2, y + cos(rot1*level*level/8 + PI) * radius/2, radius/2, level);
      break;
    }
  }
}


void modeSwitch() {
  mode++;
  if (mode == max_mode)
    mode = 0;
  switch (mode) {
  case 0:
    break;
  case 1:
    break;
  case 2:    
    break;
  }
  if (inner)
    background(0);
}

void keyPressed() {
  switch (key) {
  case ' ':
    inner = !inner;
    background(0);
    break;
  case 'd': 
  case 'D':
    alt = !alt; 
    background(0);
    break;
  case 'c': 
  case 'C':
    colormode++;
    if (colormode == max_colormode)
      colormode = 0;
    if (inner)
      background(0);
    break;
  case 'n': 
  case 'N':
    new_color = true;
    break;
  case 'm': 
  case 'M':
    modeSwitch();
    if (inner)
      background(0);
    break;
  case 'i': 
  case 'I':
    fill(0);
    rect(10, 0, 200, 30);
    info = mode + ", " + colormode + ", " + inner + ", " + alt + ", " + steps + ", " + top;
    break;
  case 's': 
  case 'S':
    states[10].defineState(mode, colormode, inner, alt, steps, top);
    break;
  case 'l':
  case 'L':
    loadState(10);
    break;
  case '1':  
  case '2':  
  case '3':  
  case '4':  
  case '5':  
  case '6':  
  case '7':  
  case '8':  
  case '9':  
  case '0':
    int load = key - 48;
    loadState(load);
    break;
  }
  if (key == CODED) {
    if (keyCode == RIGHT && steps < max_steps)
      steps += 25;
    if (keyCode == LEFT && steps > min_steps)
      steps -= 25;
    if (keyCode == UP && top < max_levels)
      top++;
    if (keyCode == DOWN && top > min_levels)
      top--;
    if (inner)
      background(0);
  }
}

void mousePressed() {
  randomState();
}

void display() {
  fill(255);
  text(info, 10, 20);
  switch (mode) {
  case 0:
    text("Perfect Mode", width - 110, height - 40);
    break;
  case 1:
    text("Loopy Mode", width - 110, height - 40);
    break;
  case 2:    
    text("Spinster Mode", width - 115, height - 40);
    break;
  case 3:    
    text("Dizzy Mode", width - 110, height - 40);
    break;
  }
  text("Steps: " + steps, 10, height - 40);
  text("Levels: " + top, 10, height - 15);
  if (alt)
    text("Alternating Direction", width - 155, height - 15);
  else
    text("Same Direction", width - 120, height - 15);
}

color colorCycler(color Color, color go_Color) {
  int r = int(red(Color));
  int g = int(green(Color));
  int b = int(blue(Color));
  int r_go = int(red(go_Color));
  int g_go = int(green(go_Color));
  int b_go = int(blue(go_Color));
  if (r == r_go)
    r_go = int(random(255));
  if (g == g_go)
    g_go = int(random(255));
  if (b == b_go)
    b_go = int(random(255));
  if (r < r_go)
    r++;
  if (g < g_go)
    g++;
  if (b < b_go)
    b++;
  if (r > r_go)
    r--;
  if (g > g_go)
    g--;
  if (b > b_go)
    b--;
  Color = color(r,g,b);

  //program specific (since you cannot return 2 values)
  go_color[count] = color(r_go,g_go,b_go);

  return(Color);
}

void randomState() {
  if (int(random(2)) == 1)
    inner = true;
  else
    inner = false; 
  if (int(random(2)) == 1)
    alt = true;
  else
    alt = false;
  colormode = int(random(max_colormode));
  mode = int(random(max_mode));
  steps = int(random(min_steps,max_steps+1));
  top = int(random(min_levels+1,max_levels+1));
  new_color = true;
  background(0);
}

//loads the given state
void loadState(int load) {
  mode = states[load].mode;
  colormode = states[load].colormode;
  inner = states[load].inner;
  alt = states[load].alt;
  steps = states[load].steps;
  top = states[load].top;
  background(0);
}

//stores a state (preset)
class State {
  int mode;
  int colormode;
  boolean inner;
  boolean alt;
  int steps;
  int top;

  State(int mode_in, int colormode_in, boolean inner_in, boolean alt_in, int steps_in, int top_in) {
    mode = mode_in;
    colormode = colormode_in;
    inner = inner_in;
    alt = alt_in;
    steps = steps_in;
    top = top_in;
  }

  void defineState(int mode_in, int colormode_in, boolean inner_in, boolean alt_in, int steps_in, int top_in) {
    mode = mode_in;
    colormode = colormode_in;
    inner = inner_in;
    alt = alt_in;
    steps = steps_in;
    top = top_in;
  }
}





import java.util.*;

ArrayList<Box> Boxlist;
boolean[][] state, newstate;
boolean update;
color ON, OFF, INST;
int gridwidth, gridheight, gridxoffset, gridyoffset, boxwidth, boxgap, framesper, framecount;
Button button;

void setup() {
  size(500,500);
  background(0);
  frameRate(30);
  ellipseMode(CENTER);
  textSize(22);
  
  ON = color(255,255,255);
  OFF = color(70,70,70);
  INST = color(#D6DEFF);
 
  update = false;
  
  gridwidth = 8;
  gridheight = 11;
  gridxoffset = 140;
  gridyoffset = 5;
  boxwidth = 40;
  boxgap = 5;
  framesper = 20;
  framecount = 0;
  
  Boxlist = new ArrayList<Box>();
  state = new boolean[gridwidth][gridheight];
  newstate = new boolean[gridwidth][gridheight];
  button = new Button(60,60,100);
  
  for(int i = 0; i < gridwidth * gridheight; i++) {
    int ix = i % gridwidth;
    int iy = (int)(i / gridwidth);
    int x = ix * (boxwidth + boxgap) + gridxoffset;
    int y = iy * (boxwidth + boxgap) + gridyoffset;
    Boxlist.add(new Box(ix, iy, x, y, boxwidth));
  }
  
  state[3][4] = true;
  state[4][4] = true;
  state[5][4] = true;
  state[5][5] = true;
  state[4][6] = true;
}

void draw() {
  background(0);
  
  if(update) {
    framecount++;
    if(framecount == framesper) {
       framecount = 0;
       updateCells(); 
    }
  }
  
  button.draw();
  for(Box box : Boxlist)  
    box.draw();
    
  fill(INST);
  textSize(18);
  text("When paused, ", 5, 150);
  text("click on a cell", 5, 180);
  text("to toggle it.", 5, 210);
  text("Click circle", 5, 270);
  text("to play.", 5, 300);
}

void mouseClicked() {
  if(!update)
    for(Box box : Boxlist) 
      if(box.mouseOver()) break;
      
  button.mouseOver();
}

void updateCells() {
  for (int x = 0; x < gridwidth; x++) { 
    for (int y = 0; y < gridheight; y++) {
      int count = neighbors(x, y);
      if((count == 2 || count == 3 ) && state[x][y] == true) newstate[x][y] = true;
      if(count == 3 && state[x][y] == false) newstate[x][y]= true;
    }
  } 
  
  state = newstate;
  newstate = new boolean[gridwidth][gridheight];
}

int neighbors(int x, int y) {
  int result = 0;
   //top left
   if(state[(x + gridwidth - 1) % gridwidth][(y + 1) % gridheight]) result++; 
   //top center
   if(state[x][(y + 1) % gridheight]) result++;  
   //top right
   if(state[(x + 1) % gridwidth][(y + 1) % gridheight]) result++;  
   //right cener
   if(state[(x + 1) % gridwidth][y]) result++;  
   //bottom right
   if(state[(x + 1) % gridwidth][(y + gridheight - 1) % gridheight]) result++;  
   //bottom center
   if(state[x][(y + gridheight - 1) % gridheight]) result++;  
   //bottom left
   if(state[(x + gridwidth - 1) % gridwidth][(y + gridheight - 1) % gridheight]) result++; 
   //left center
   if(state[(x + gridwidth - 1) % gridwidth][y]) result++;
   
   return result;
}
class Box {
  int ix, iy, x, y, s;
  
  Box(int IX, int IY, int X, int Y, int S) {
    ix = IX;
    iy = IY;
    x = X;
    y = Y;
    s = S;
  }
  
  void toggle() {
    state[ix][iy] = !state[ix][iy];
  }
  
  void draw() {
    if(state[ix][iy]) fill(ON);
    else fill(OFF);
    rect(x, y, s, s);
  }
  
  boolean mouseOver() {
    if(mouseX >= x && mouseX <= x + s && 
      mouseY >= y && mouseY <= y + s) {
      this.toggle();
      return true;
    }
    else return false;
  }
}

class Button{
 int x, y;
 float r;
 
  Button(int X, int Y, float R) {
    x = X;
    y = Y;
    r = R;
  }
  
  void draw() {
    if(update) {
      fill(ON);
      ellipse(x, y, r, r);
      fill(OFF);
      textSize(22);
      text("PLAYING", x - 45, y + 7 ); 
    } else {
      fill(OFF);
      ellipse(x, y, r, r);
      fill(ON);
      textSize(22);
      text("PAUSED", x - 40, y + 7 ); 
    }
  }
  
  void mouseOver() {
    float distance = sqrt((mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y));
    if(distance < (r / 2)) update = !update;
  }
}



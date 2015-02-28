
// Based on code by Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
PFont font;

int r;
int r2;

void setup(){
  size(800,400);
  background(#272928);
font = loadFont("LeviBrush-100.vlw"); 
r = (int)random(400);
r2 = (int)random(400-800);
textFont(font, 200); 
fill(#45352E);
text("gruhhh", r, 120);
text("erghhh", r2, 240);
fill(#A62B35);
text("BRAINS!", 15, 180);
}

void draw() {
  int x1 = (int) random(0, width);
  int y1 = 0;
  
  int y2 = round(random(5));

  int w = (int) random(35, 50);
  int h = height;

  copy(x1,y1, w,h, x1,y2, w,h);
}

//Pushing any key restores type back to its original state
void keyPressed() {
  if (key == DELETE || key == BACKSPACE){
  r = (int)random(400);
  r2 = (int)random(400-800);
  background(#272928);
  font = loadFont("LeviBrush-100.vlw"); 
  textFont(font, 200); 
  fill(#45352E);
  text("gruhhh", r, 120);
  text("erghhh", r2, 240);
  fill(#A62B35);
  text("BRAINS!", 15, 180);
  }
  
}



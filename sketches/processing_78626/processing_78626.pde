
/*-------------------------------------------------
coded by Ji Zhang @ 11 Nov 2012
-------------------------------------------------*/

int y = -400; // initial baseline y position
int size_x = 1000;
int size_y = 500;
int text_size = 10;
int max_num_col = 300;
int num_col = floor(random(1,max_num_col)); // randomize total num of columns to be created for each loop
int[] xPosi;   // array to store random initial x positions
int[] yOffset; // array to store random initial y position offset
 
void setup(){
  size(size_x, size_y);
  frameRate(30);
  colorMode(HSB,360,100,100);
 
  PFont font;
  font = createFont("Arial Black", 10);
  textFont(font);
 
  xPosi   = new int[num_col];
  yOffset = new int[num_col]; 
 
  for (int i=0; i<num_col; i=i+1) {
    xPosi[i]   = floor(random(size_x/text_size))*text_size;
    yOffset[i] = floor(random(-size_y,size_y));
  }
}

void draw(){
  fill(0,10); // the smaller the alpha, the longer the tail
  noStroke();
  rect(0,0,size_x,size_y);  
 
  //fill(random(360),100,100); // char with color
  fill(120,100,100); // green char
  textSize(text_size);
 
  for (int i=0; i<num_col; i=i+1) {
    int i_char = floor(random(255));
    char T = char(i_char);
    text(T, xPosi[i], y+yOffset[i]);
  }
 
  y = y + floor(text_size/1.1); // spacing btw char 
  if (y>size_y*1.2) {
    y = -400;
    num_col = floor(random(1,max_num_col));
    xPosi   = new int[num_col];
    yOffset = new int[num_col];
    for (int i=0; i<num_col; i=i+1) {
      xPosi[i]   = floor(random(size_x/text_size))*text_size;
      yOffset[i] = floor(random(-size_y,size_y));
    }
  }
}

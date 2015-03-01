
PImage img;
PImage img2;
PImage img3;
color col = color(255,0,0);
int x = 14;
int y = 14;
int dir = -1;
int count = 0;
color black = color(0,0,0);
boolean win = false;
boolean twoWin = false;

void setup(){
  size(494,354);
  img = loadImage("maze2.png");
  img2 = loadImage("maze.png");
  img3 = loadImage("win.png");
  loadPixels();
}

void draw(){
  if(win && !twoWin){
    img = img2;
    dir = 6;
    win = false;
    twoWin = true;
  }
  if(win && twoWin){
    img = img3;
    x = 301;
    y = 148;
  }
  background(img);
  rectMode(CORNER);
  blink();
  if(get(x,y+dir)==color(70,255,0)){
    win = true;
  }
}

void blink(){
  stroke(col);
  fill(col);
  rect(x+2,y,1,5);
  rect(x,y+2,5,1);
  count++;
  if(count==15){
    col = invert(col);
    count = 0;
  }
}

color invert(color c){
  float r = 255-red(c);
  float g = 255-green(c);
  float b = 255-blue(c);
  return color(r,g,b);
}

void keyPressed(){
  if(keyCode == UP){
    if((get(x+2,y-1)!=black)&&!win){
      y-=4;
    }
  }
  if(keyCode == DOWN){
    if((get(x+2,y+6)!=black)&&!win){
      y+=4;
    }
  }
  if(keyCode == LEFT){
    if((get(x-1,y+2)!=black)&&!win){
      x-=4;
    }
  }
  if(keyCode == RIGHT){
    if((get(x+6,y+2)!=black)&&!win){
      x+=4;
    }
  }
}



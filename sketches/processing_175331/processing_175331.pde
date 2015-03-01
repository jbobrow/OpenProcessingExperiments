
PImage img;
PImage img2;
int x = 14;
int y = 14;
boolean leftB = false;

void setup(){
  size(494,354);
  img = loadImage("maze2.png");
  img2 = loadImage("win.png");
  loadPixels();
}

void draw(){
  x = mouseX;
  y = mouseY;
  if((get(x,y)==color(255,255,0))&&!leftB){
    img = img2;
  }
  background(img);
  
  if(get(x,y)==color(200,190,230)){
    leftB = false;
  }
  
  if(get(x,y)==color(255)){
    stroke(0);
    fill(0);
    leftB = true;
  } else {
    stroke(0,255,0);
    fill(0,255,0);
  }
  rect(x-2,y-2,4,4);
}



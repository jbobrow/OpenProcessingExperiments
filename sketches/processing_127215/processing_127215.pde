
/*@pjs preload="apple.png";*/

int x, y;
int x2,y2;
int c;
int eSize = 10;
PImage img;

void setup(){
  size(450, 450);
  noStroke();
  smooth();
  
  c = 0;
  x = width/2;
  y = height/2;
  
  img = loadImage("apple.png");
}

void draw(){
  background(255,0,0);
  fill(c);
  ellipse(x, y, 800, 800);
  
  tint(255);
  image(img,80,80);
}

void mouseMoved(){
  c ++;
  if(c > 255){
    c = 255;
  }
}

void mouseDragged(){
  c --;
  if(c < 0){
    c = 0;
  }
}

void mousePressed(){
for(int x2 = 0; x2 <= width; x2 += 20){
  for(int y2 = 0; y2 <= height; y2 += 20){
 
  if(x2 == width){
    //fill(255);

  }
  else{
    fill(0,0,255);
  }
  rect(x2, y2, eSize, eSize);
  println("x2=" + x2);
}
}
}

void mouseReleased(){
for(int x2 = 0; x2 <= width; x2 += 20){
  for(int y2 = 0; y2 <= height; y2 += 20){
 
  if(x2 == width){
    //fill(255);

  }
  else{
    fill(0,255,255);
  }
  rect(x2, y2, eSize, eSize);
  println("x2=" + x2);
}
}
}



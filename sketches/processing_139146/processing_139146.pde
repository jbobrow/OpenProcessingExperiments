
float x = 300;
float y = 300;
float speed = 5;
PImage map1;
color red = color(255, 0, 0);

void setup() {

size(600, 600);
smooth();
map1 = loadImage("level4.gif");
  
}

void draw() {
  
image(map1, 0, 0);
rectMode(CENTER);
  fill(#55CB46);
rect(x, y, 40, 40);

  }
  
  void keyPressed() {
  
    if(key == 'w') {
      int x1 = int(x);
      int y1 = int(y);
      color c = map1.get(x1, y1 - 22);
      if(c == red) 
    
      y = y - speed;
    
    
    }
    
    if(key == 's') {
      int x1 = int(x);
      int y1 = int(y);
      color c = map1.get(x1, y1 + 22);
      if(c == red) 
    
      y = y + speed;
    
    }
    
    if(key == 'a') {
      int x1 = int(x);
      int y1 = int(y);
      color c = map1.get(x1 - 22, y1);
      if(c == red)
    
    x = x - speed;
      
    }
    
    if(key == 'd') {
      int x1 = int(x);
      int y1 = int(y);
      color c = map1.get(x1 + 22, y1);
      if(c == red)
    
    x =x + speed;
    
    }
  
  }




int num = 300;
float symbolSize = 10;

Symbol[] mySymbols = new Symbol[num];

color[] myColors = new color[3];

void setup() {
  
  size(500,500);
  
  myColors[0] = color(0,255,0,75);
  myColors[1] = color(0,255,0,100);
  myColors[2] = color(0,100,0,75);
  
  for(int i=0;i<mySymbols.length;i++){
    mySymbols[i] = new Symbol();
  }
  noStroke();
  smooth();
  
}

void draw() {
  background(0);
  
  for(int i=0; i < mySymbols.length; i++) {
    mySymbols[i].update();
    mySymbols[i].draw();
  }
}

class Symbol {
  
  int x = int(random(width));
  int y = int(0);
  float xpos = random(0,width);
  float ypos = random(0,height);
  float speed = random(1,5);
  color col = myColors[floor(random(0,3))];
  
  Symbol() {
  }
  
  void update() {
    
    x = x + int(random(-1,1));
    y = y + int(random(-5,5));
    
    ypos = ypos + speed;
    
    if(ypos > height + symbolSize/2) ypos = -symbolSize/2;
    if(ypos < -symbolSize/2) ypos = height - symbolSize/2;
  }
  
  void draw() {
    
    fill(col);
    rect(xpos,ypos,symbolSize,symbolSize);
    fill(0);
    rect(xpos+1,ypos-1,symbolSize-2,symbolSize-1);
    fill(col);
    rect(xpos,ypos-10,symbolSize,symbolSize);
    fill(0,100,0,75);
    rect(x,y,symbolSize,symbolSize);
  }
}


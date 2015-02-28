
//Abstract Painting, Dan Olson

RandomMovingLine[] Line;
int num;
int randomFrameCount;
void setup(){
  colorMode(RGB,255);
  size(400,200);
  background(255);
  num = int(random(1,11));
  randomFrameCount = int(random(500,700));
  Line = new RandomMovingLine[num];
  for (int i = 0; i < Line.length; i++) {
  Line[i] = new RandomMovingLine();

  }
 
}
void draw() {
  //println(frameCount);

  if (frameCount % randomFrameCount == 0) {
  num = int(random(1,20));
  Line = new RandomMovingLine[num];
  for (int i = 0; i < Line.length; i++) {
  Line[i] = new RandomMovingLine();
  }
  
  //Draw a random amount of lines every 500 frames
  for (int i = 0; i < Line.length; i++) {
  Line[i].display();
  Line[i].move();
  Line[i].randomTimer();
  Line[i].randomColor();
  }
  
  } 
  
  //Draw random amount of lines when setup is called
  for (int i = 0; i < Line.length; i++) {
  Line[i].display();
  Line[i].move();
  Line[i].randomTimer();
  Line[i].randomColor();

  }
}

class RandomMovingLine {
  int z, z2;
  int timer;
  float x, y;
  float x2, y2;
  int speed;
  float r;
  
  float col, col2, col3;
  float randomCol;
  float rc, rc2, rc3, rc4, rc5, rc6;
  float randomColorInc;
  float t;
  
  RandomMovingLine() {
    
    x= random(0,width);
    y= random(0,height);
    x2= random(0,width);
    y2= random(0,height);
    
    randomColorInc = random(50,100);
    randomCol= int(random(3));
    
    rc = random(0,randomColorInc);
    rc2 = random(0,randomColorInc);
    rc3 = random(0,randomColorInc);
    rc4 = random(0,randomColorInc);
    rc5 = random(0,randomColorInc);
    rc6 = random(0,randomColorInc);
    
  }
  
  void randomColor() {

     colorMode(RGB,randomColorInc);
    
    if (randomCol == 0) {
       stroke(col,rc,rc2);
    }
    
    if (randomCol == 1) {
       stroke(rc3,col2,rc4);
    }
    
    if (randomCol == 2) {
       stroke(rc5,rc6,col3);
    }
    
    col = col + 1;
    col2 = col2 + 1;
    col3 = col3 + 1;
  
    if (col > randomColorInc) {
    col = 0;
    }
    
    if (col2 > randomColorInc) {
    col2 = 0;
    }
    
    if (col3 > randomColorInc) {
    col3 = 0;
    }
}
  
  void randomTimer() {
    if(millis() - timer >= r) {
    r=random(50,250);
    z= int(random(4));
    z2= int(random(4));
    
    timer = millis();
  }
}

  void display() {
  line(x,y,x2,y2);
  strokeWeight(5);
  speed = 1; 
  }
  
  void move() {
    
  if (z == 0) {
  x+= speed;
  }
  
  if (z2 == 0) {
  x2+= speed;
  }

  if (z == 1) {
  x-= speed;
  }
  
  if (z2 == 1) {
  x2-= speed;
  }

  if (z == 2) {
  y+= speed;
  }
  
  if (z2 == 2) {
  y2+= speed;
  }

  if ( z == 3) {
  y-= speed;
  }
  
  if ( z2 == 3) {
  y2-= speed;
  }
  
  }
}


void mousePressed(){
if (mouseButton == RIGHT){
noLoop();
save("filename.png");
}
if (mouseButton == LEFT) {
loop();
setup();
}
}

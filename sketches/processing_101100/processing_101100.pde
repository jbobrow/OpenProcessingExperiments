
Catcher catcher;    
Timer timer;        
Drop[] drops;       
int totalDrops = 0; 
PFont f; 
float x; 
int index = 0;
String[] headlines = {
  "WINDSHIELD WIPER (Catch the Raindrops)" ,
  "WEEK 5 ASSIGNMENT" ,
};

void setup() {
  size(400,400);
  smooth();
  catcher = new Catcher(32); 
  drops = new Drop[1000];   
  timer = new Timer(300);   
  timer.start(); 
f = createFont( "Arial" ,16,true);
  
  x = width;  
}

void draw() {
  background(255);
  fill(0);

  textFont(f,16);
  textAlign (LEFT);
  
  text(headlines[index],x,180); 
  
  x = x - 3;
    float w = textWidth(headlines[index]); 
  if (x < -w) {
    x = width;
    index = (index + 1) % headlines.length; 
  }
 
  
  
  catcher.setLocation(mouseX,mouseY); 
  
  catcher.display(); 
  
  
  if (timer.isFinished()) {
    
    drops[totalDrops] = new Drop();
    
    totalDrops ++ ;
    
    if (totalDrops >= drops.length) {
      totalDrops = 0; 
    }
    timer.start();
  }
  
 
  for (int i = 0; i < totalDrops; i++ ) {
    drops[i].move();
    drops[i].display();
    if (catcher.intersect(drops[i])) {
      drops[i].caught();
    }
  }
}


class Drop {
  float x,y;   
  float speed;
  color c;
  float r;     

  Drop() {
    r = 8;                 
    x = random(width);     
    y = -r*4;              
    speed = random(1,5);  
    c = color(50,100,150); 
  }

  
  void move() {
    
    y += speed; 
  }

  
  boolean reachedBottom() {
   
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  
  void display() {
    
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      ellipse(x,y + i*4,i*2,i*2);
    }
  }

  
  void caught() {
    
    speed = 0; 
    
    y = - 1000;
  }
}


class Timer {
 
  int savedTime; 
  int totalTime; 
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
 
  void start() {

    savedTime = millis(); 
  }
  

  boolean isFinished() { 
   
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}


class Catcher {
  float r;  
  color col; 
  float x,y; 
  
  Catcher(float tempR) {
    r = tempR;
    col = color(50,10,10,150);
    x = 0;
    y = 0;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    stroke(0);
    fill(col);
    ellipse(x,y,r*2,r*2);
  }
  
  
  boolean intersect(Drop d) {
   
    float distance = dist(x,y,d.x,d.y); 
    
    
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}



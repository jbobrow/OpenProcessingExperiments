
//Thanks cualquierchica! 
import gifAnimation.*;
Gif flame;
Log[] logs = new Log[19];
float y = 0;



void setup() {
  size(800, 800);
  background (233);
  frameRate(120);
  noCursor();
 


  logs[0] = new Log(0, 100);
  logs[1] = new Log(0, 200);
  logs[2] = new Log(0, 300);
  logs[3] = new Log(0, 400);
  logs[4] = new Log(0, 500);
  logs[5] = new Log(0, 600);
  logs[6] = new Log(0, 700);
  logs[7] = new Log(0, 800);
  logs[8] = new Log(0, 900);
  logs[9] = new Log(0, 1000);
  logs[10] = new Log(0, 1100);
  logs[11] = new Log(0, 1200);
  logs[12] = new Log(0, 1300);
  logs[13] = new Log(0, 1400);
  logs[14] = new Log(0, 1500);
  logs[15] = new Log(0, 1600);
  logs[16] = new Log(0, 1700);
  logs[17] = new Log(0, 1800);
  logs[18] = new Log(0, 1900);
 flame = new Gif(this, "Hadouken.gif");
}
String [] animas = {
};


void draw () {
  background(255);
  tint(255, 0, 0);
  image (flame, mouseX, 600);
  frameRate(120);

  flame.play(); 
  for (int i = 0; i < logs.length; i++) {

    logs[i].move();
    logs[i].display();
  }
  for (int i = 0; i < logs.length; i++) {
    if (logs[i].y > 600) {
      if (logs[i].isingap(mouseX)) {
        println("poof!");
      }
    }
  }
}

class Log {

  float x, y;
  color c;
  float speed;

  Log(float nx, float ny) {
    x = nx;
    y = ny;
    speed = 1;
    x = random(width-100);
  }

  void move() {
    y += speed;
    if (y > height) y = -100;
  }
  
  boolean isingap(float mx){
    if(abs(x - mx) < 50){
      return true;
    }
    else return false;
    
    
  }


  void display() {
    noStroke();
    fill(255,100,0);
    rect(0, y,width , 10);
    fill(255);
    noStroke();
    rect(x, y, 100, 10);
  }
}







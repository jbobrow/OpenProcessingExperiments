
import java.util.Map;
  
  class Walker {
    
  int x, y;
  float STEP = 8;
  float SIZE = 10;
  int count = 0;
  HashMap<String,Integer> hm = new HashMap<String,Integer>();
  
  Walker() {
    x = width/2 + int(random(width/20));
    y = height/2 + int(random(height/20));
    strokeWeight(SIZE);
  }
    
  boolean checkOverlap() {
    hm.put(x + "," + y, 1);
    //println(hm);
    if (hm.containsKey(x+","+y)) {
      print("Overlap! :: ");
      print(x+","+y+"\n");
      return true;
    }
    return false;
  }
  
  void bounceOffWall() {
    if (x >= width) x -= STEP;
    if (y >= height) y -= STEP;
    if (x <= 0) x += STEP;
    if (y <= 0) y += STEP;
  }
  
  void randomStep() {
    int r = int(random(0, 100));
    if (r < 15) {x += STEP+2;  STEP -= 0.1;}
    else if (r < 35) {x -= STEP-2; STEP += 0.01/x; y-=1;}
    else if (r < 65) {y -= STEP+1; STEP -= 0.1; y+=2;}
    else {y += STEP; STEP += 0.1;}
    bounceOffWall();
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
   
  void randomStep2() {
    count += 1;
    if (count % 15 == 0) {x += STEP+2;  STEP -= 0.1;}
    else if (count % 12 == 0) {x -= STEP-2; STEP += 0.01/x; y-=1;}
    else if (count % 8 == 0) {y -= STEP+1; STEP -= 0.1; y+=2;}
    //else {y += STEP; STEP += 0.1;}
        int r = int(random(0, 100));
    if (r < 15) {x += STEP+2;  STEP -= 0.1;}
    else if (r < 35) {x -= STEP-2; STEP += 0.01/x; y-=1;}
    else if (r < 65) {y -= STEP+1; STEP -= 0.1; y+=2;}
    else {y += STEP*2/2; STEP += 0.1;; x-=3;}
    bounceOffWall();
    x = constrain(x, 0, width);
    y = constrain(y, 0, height);
  }
  
  void renderPoints(int r) {
    color c = color(random(155,255));
    stroke(c);
    c = color(0, r, r-25);
    stroke(c);
    strokeWeight(8);
    point(x, y);
    
    stroke(255, 255, 0);
    strokeWeight(6);
    point(x, y);
    
    stroke(255);
    strokeWeight(3);
    point(x, y);
  }
  
  
  void walk() {
    /*
    color c = color(random(155,255),
                    random(0,255),
                    random(0,255));
                  */
    int r = int(random(160,255));
    //color c = color(r, r-25, 0);
    //if (r % 7 == 0) { c = color(0, r, 0);}
    randomStep();
    randomStep2();
    STEP = abs(STEP) - 0.05;
    if (count % 4 == 0)  y += 1;
    if (count % 7 == 0)  x -= 2;
    if (count % 14 == 0)  x = abs(x)+2;
    if (count % 14 == 0)  y = abs(y)+3;
    //if (y > height/2)  x += 1;
    x += 2;
    y -= 0.85;
    //if (x < y) x += 1;
    //if (y < x && x > height/2) x += 3; y -= int(sin(y)*6);
    count /= 2;
    if (x > width)  x/= -2;
    if (y < height/12)  y = height;
    if (y > height/12)  y += int(sin(y+x));
    renderPoints(r);
  }
  
  void mainWalk() {
    stroke(255);
    walk();
    walk();
    walk();
  }
    
  
}


class WalkerGenerator {

  int count = 10;
  Walker[] walkers;
  
  WalkerGenerator(int tmp_count) {;
    count = tmp_count;
    walkers = new Walker[count];
    for(int i=0; i<count; i++) {
      walkers[i] = new Walker();
    }
  }
  
  void start() {
    for(int i=0; i<count; i++) {
      walkers[i].mainWalk();
    }
  }

}



WalkerGenerator wg;

void setup() {
  background(10);
  size(500, 400);
  frameRate(60);
  wg = new WalkerGenerator(125);
}


void draw() {
  filter(BLUR, 1);
  filter(ERODE);
  //filter(GRAY);

  wg.start();
  //filter(GRAY);
}

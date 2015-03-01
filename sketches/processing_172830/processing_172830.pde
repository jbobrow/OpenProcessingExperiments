
class Walker {
  
  int SIZE = 12; // Walker Size
  int x, y;     // Coords
  color c;      // Latest Sample Color
  int r;        // Temporary Variable for Random Values
  int STEP = 14; // Step Amount
  int count = 0; // Iteration Count
  
  int total = width/STEP * height/STEP;
  
  Walker() {
    x = width/2;
    y = height/2;
    newColor();
    //println(total);
  }
 
  void newColor() {
    //c = color(random(0, 255), random(0, 155), random(0,255));
    //c = color(random(0, 255), random(0, 255), random(0,255));
    c = color(random(0, 255), random(0, 255), random(0,255));
    //c = color(0, random(0,255), 255);
    stroke(c);
    fill(c);
  }
  void changeColor() {
    color sample = get(x, y);
    if (sample == c) {
      newColor();
    }
  }
  
  void stepOver() {
    if (count >= total) {
      return;
    }
    // only step on blank areas of the canvas
    color canvas_color = color(0, 0, 0);
    if (get(x, y) != canvas_color) {
      print("Nope: x:");
      print(x);
      print(",");
      print(y);
      print("\n");
      step();
    } else {
      println("Yup!");
    }
  }
  
  void boundrySet() {
    if (x >= width) x -= STEP;
    if (y >= height) y -= STEP;
    if (x <= 0) x += STEP;
    if (y <= 0) y += STEP;
  }
  
  void endFade() {
    filter(POSTERIZE, 10);
    filter(BLUR, 2);
    count += 1;
    if (count >= total + 50) {
      filter(ERODE);
    }
    if (count >= total + 100) {
      background(0);
      count = 0;
    }
  }
 
  void step() { 
    if (count >= total) {
      endFade();
      return;
    }
    println("Stepping!");
    boundrySet();
    r = int(random(4));
    if (r == 3){
      x += STEP;
    } else if (r == 2) {
      y -= STEP;
    } else if (r == 1) {
      y += STEP;
    } else {
      x -= STEP;
    }
    changeColor();
    stepOver();
  }
  
  void render() {
    if (count >= total) {
      return;
    }
    rect(x, y, SIZE, SIZE);
    //ellipse(x, y, SIZE, SIZE);
    //ellipse(x+SIZE/2, y+SIZE/2, SIZE, SIZE);
    count += 1;
  }
  
}




Walker w;

void setup() {
  size(1024, 256);
  background(0);
  w = new Walker();
  smooth();
  noStroke();
  frameRate(200);
}

void draw() {                                                                                                                   
  w.step();
  w.render();
}

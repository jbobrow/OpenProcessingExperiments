
int anz = 500;
Hair[] myHairArray;

void setup() {
  size(512,512);
  myHairArray = new Hair[anz];
  colorMode(HSB, 100);
  for (int i=0; i<anz; i++) {
    float newX = map(i,0,anz,0,width);
    color newColor = color(map(i,0,anz,0,100),100,100);
    myHairArray[i] = new Hair(newX, height/2, newColor);
  }
}

void draw() {
  colorMode(RGB, 255);
  fill(255,13);
  rect(0,0,width,height);
  //background(255);

  for (int i=0; i<anz; i++) {
      myHairArray[i].update();
      myHairArray[i].display();
  }  
}


class Hair {
  
  float x;
  float y;
  color fillColor;
  float easing = 0.05;

  float counter;
  float random1;
  float random2;
  
  // CONSTRUCTOR
  Hair(float in_x, float in_y, color in_color) {
    x = in_x;
    y = in_y;
    fillColor = in_color;
    random1 = random(0,1000);
    random2 = random(0,1000);
  }

  void update() {
    counter++;
    float moveX = 3*(noise(counter*.01+random1)-0.5);
    float moveY = 3*(noise(counter*.01+random2)-0.5);
    x+= moveX;
    y+= moveY;
  }
  
  void display() {
    noStroke();
    fill(fillColor);
    ellipse(x,y,4,4);
  }
}





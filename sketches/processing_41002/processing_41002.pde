

//Bubbles 
Bubble myBubble_1;
Bubble myBubble_2;
Bubble myBubble_3;
Bubble myBubble_4;
Bubble myBubble_5;
Bubble myBubble_6;

int BubbleSize = 600; // Bubble size constant

color[] magnusColour = new color[6];


void setup() {

  size(300, 300);

  //magnusColours
  magnusColour[0] = color(255, 0, 0, 30);
  magnusColour[1] = color(254, 255, 0, 60);
  magnusColour[2] = color(0, 0, 255, 90);
  magnusColour[3] = color(200, 200, 200, 30);
  magnusColour[4] = color(250, 250, 250, 60);
  magnusColour[5] = color(150, 150, 150, 90);
  

  // New Bubble onject
  myBubble_1 = new Bubble();
  myBubble_2 = new Bubble();
  myBubble_3 = new Bubble();
  myBubble_4 = new Bubble();
  myBubble_5 = new Bubble();
  myBubble_6 = new Bubble();

  strokeWeight(random(1,3));
  stroke(255);
  smooth();
}


void draw() {
  background(220);

  myBubble_1.update();
  myBubble_2.update();
  myBubble_3.update();
  myBubble_4.update();
  myBubble_5.update();
  myBubble_6.update();

  myBubble_1.draw();
  myBubble_2.draw();
  myBubble_3.draw();
  myBubble_4.draw();
}

class Bubble {

  float x = random(0, width*2);
  float y = random(0, height*2);
  float speed = random(1, 2);
  color col = magnusColour[int(random(0, 5))];


  Bubble() {
  }

  void update() {

    y = y + speed;

    if (y > height + BubbleSize/2) y = -BubbleSize/2;
    if (y < -BubbleSize/6) y = height - BubbleSize/2;
  }

  void draw() {
    fill(col);
    ellipse(x, y, BubbleSize, BubbleSize);
  }
}



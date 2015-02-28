
PImage img;int STATE = 0;
int MAIN = 0;
PFont rockwell;
float r = 10; //--------------------------background
//----------------------------------------bubbles
float x = 0;
float y = 0;
float d = 0;
float end;
int ra = 25;
int counter;
float timer, start, totalTime;
int bSize = 200;
coke[] bubble = new coke[bSize];
int vlaue = 0;
boolean startDead=false;

void setup() {
  rockwell = loadFont("Rockwell-48.vlw");
  smooth();
  size(800, 600);
  background(0);
  for (int i=0;i<bSize;i++) {
    bubble[i] = new coke(random(width), random(height+700), random(1), random(30), (int)random(100));
  }
}

void reset() {
  startDead = false;
  counter =0;
}

void draw() {
  noStroke();
  fill(50);
  rect(0,0,width,height);
  for (int i = 0; i <= 100; i++) {
    for (int a = 0; a <= 50; a++) {
      float d= dist(mouseX, mouseY, a*20, i*20);
      
      fill(random(200), 30, random(200));
      
      if (d < r + 50) {
        r=0;
      }
      else {
        r=10;
      }
      ellipse(a*20, i*20, 2*r, 2*r);
    }
  }

  if (STATE == 0) {
    for (int i=0;i<bSize;i++) {
      bubble[i] = new coke(random(width), random(height+700), random(1), random(30), (int)random(100));
    } 
    if (mouseY > height/2) {
      fill(50);
      rect (0, 400, 800, 600);
      
    }  
    textFont(rockwell, 25);
    text("SUPRISE~ This is my FINAL!",250, 100);
    text("coke", width/2, height/2);
    fill(240);
    text("Click & Pop Coke Bubbles", 250, height-165);
    text("PRESS 'c' to play ClassicCoke      (easy)", 180, height-130);
    text("PRESS 'd' to play DietCoke     (medium)", 180, height-100);
    text("PRESS 'r' to play RaspberryCoke (hard)", 180, height-70);
    text("PRESS 'space' to pause", 180, height-40);
    noStroke();
    fill(180, 0, 0);
    ellipse(width/2, height/2, 120, 120);
    fill(0);
    text("coke", width/2, height/2);
  }

  else if (STATE == 1) {
    background(150, 0, 0);
    noStroke();
    fill(0);
    cursor(CROSS);
    start = 600;
    timer += 1;
    totalTime = timer;
    rect(0, 0, width, height);
    noStroke();
    for (int i=0;i<bSize;i++) {
      bubble[i].update(60);
    }
    text("score:"+counter, 20, 50);
  }

  else if (STATE == 2) {
    background(0);
    noStroke();
    cursor(CROSS);
    start = 600;
    timer += 1;
    totalTime = timer;
    rect(0, 0, width, height);
    for (int i=0;i<bSize;i++) {
      bubble[i].update(40);
    }
    text("score:"+counter, 20, 50);
  }

  else if (STATE == 3) {

    noStroke();
    fill(0);
    cursor(CROSS);
    start = 600;
    timer += 1;
    totalTime = timer;
    rect(0, 0, width, height);
    for (int i=0;i<bSize;i++) {
      bubble[i].update(20);
    }
    text("score:"+counter, 20, 50);
  }
}

void keyPressed() {

  if (key == 'c' && STATE == 0) {
    STATE = 1;
  }
  if (STATE == 1 && key == ' ') {
    STATE = 0;
    reset();
   
  }
  if (key == 'd' && STATE == 0) {
    STATE = 2;

    
  }
  if (STATE == 2 && key == ' ') {
    STATE = 0;
    reset();
    
  }

  if (key == 'r' && STATE == 0) {
    STATE = 3;

  }
  if (STATE == 3 && key == ' ') {
    STATE = 0;
    reset();
    
  }
}

class coke {
  float x=0;
  float y=0;
  float d=0;
  float a=0;
  int c=0;
  boolean popped=false;

  public coke (float x, float y, float d, float a, int c) {
  
    this.x = x;
    this.y = y;
    this.d = d;
    this.a = a;
    this.c = c;
  }

  public void update(int bSize) {
    noStroke();
    ellipseMode(CENTER);
    fill(255);
    if (!popped)
    fill(random(255),0,random(255));
      ellipse(x, y, bSize, bSize);
    y-=2;

    if (mousePressed == true && dist(x, y, mouseX, mouseY) < ra && popped ==false) {
      fill(135, 206, 250);
      popped=true;
      println("Hit");
      counter+=1;
    }

    if (popped==true)
    {
      println(counter);
    }

    if (totalTime > start) {
      background(0);
      textFont(rockwell);
      fill(255);
      text("GAME OVER", 250, height/2, 50);
      fill(200,50,20);
      text("coke", width/2, 380);
      textFont(rockwell,20);
      text("PRESS 'space' to go to the main page", 220, height-45);
    }
  }
}




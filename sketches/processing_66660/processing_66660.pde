
PImage bg;
PImage bg2;
int rectX;
int startTime;
int currentTime;
int interval;

void setup() {
  size(500, 500);
  background(40);
  smooth();
  bg = loadImage("bg.png");
  bg2 = loadImage("bg2.png");
/*  rectX = 10;
  startTime = millis();
  interval = 1000;*/
}

void draw() {
  
  frameRate(7);
  fill(40,40,40,100);
  rect(0,0,500,500);
  for (int i=1; i <=80; i++) {
    noStroke();
    fill(random(255),random(255),random(255), 120);
    rect(random(510), random(510), 50, 50);
  }
  

  
  
/*  
  rectX += 10;
  currentTime = millis();
  if (currentTime - startTime >=interval) {
    drawRect();
    startTime = millis();
  }*/
  
  image(bg, 0, 0);
  image(bg2, 17, 22);
  
  for (int i=1; i <=500; i++) {
    noStroke();
    fill(random(150),random(150),random(200), 20);
    rect(random(510), random(500), 5, 300);
  }    
}

/*void drawRect(){
    noStroke();
    fill(255);
    rect(rectX+10, 0, 10, 500);
}*/



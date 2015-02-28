
int drawingMode = 0;

void setup() {
  size(400,400);
  smooth();
  rectMode(CENTER);
  fill(24,185,117);
  noStroke();
}


void draw() {
  
  background(178,255,239); 
  
  
  if (drawingMode == 0) {
    drawFlower1();
  } else if (drawingMode == 1) {
    drawFlower2();
  } else if (drawingMode == 2) { 
    drawFlower3();
  } else if (drawingMode == 3) {
    drawFlower4();
  } else if (drawingMode == 4) {
    drawFlower5();
  }
  
}

void keyReleased() {
  if (key == ' ') {
    drawingMode++;}
  if (drawingMode>=5){
    drawingMode=0;
  }
}

void drawFlower1(){
  translate(width/2, height/2);
  fill(255,213,0);
  ellipse(0, 0, 50, 50);
  fill(20,152,9);
  for (int i = 0; i < 5; i++) {
    ellipse(0,-40,50,50);
    rotate(radians(72));
  }
  

}

void drawFlower2(){
  translate(width/2, height/2);
  fill(255,213,0);
  ellipse(0, 0, 60, 60);
  fill(20,152,9);
  for (int i = 0; i < 5; i++) {
    ellipse(0,-50,40,40);
    rotate(radians(72));
  }
}

void drawFlower3(){
  translate(width/2, height/2);
  fill(255,213,0);
  ellipse(0, 0, 50, 50);
  fill(20,152,9);
  for (int i = 0; i < 5; i++) {
    ellipse(0,-60,30,30);
    rotate(radians(72));
  }
}

void drawFlower4(){
    translate(width/2, height/2);
  fill(255,213,0);
  ellipse(0, 0, 70, 70);
  fill(20,152,9);
  for (int i = 0; i < 5; i++) {
    ellipse(0,-70,20,20);
    rotate(radians(72));
  }
}
  
void drawFlower5(){
    translate(width/2, height/2);
  fill(255,213,0);
  ellipse(0, 0, 80, 80);
  fill(20,152,9);
  for (int i = 0; i < 5; i++) {
    ellipse(0,-80,10,10);
    rotate(radians(72));
  }
}
  
  
  
  



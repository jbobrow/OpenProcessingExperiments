

boolean button1, button2, button3; 
float b1, b2, b3;

void setup() {
  size(500, 500);
  background(56,236,204);
  
  for(int i=0; i<100; i++){
  fill(255,255,255);
    line(random(width), random(height), random(width), random(height));
  fill(0,0,0);
  rect(108,207,304,90);
  fill(255,255,255);
  rect(102,200,304,90);
  textSize(20);
  text("click 1 or 2 or 3",180,50);

}
  }

  

void draw() {
  if (button1) {
    drawButton1();
  } else {
    b1=0;
  }
  if (button2) {
    drawButton2();
  }
  if (button3) {
    drawButton3();
  }
}



void drawButton1() {
  if (button1) {
   size(500, 500);
  background(56,236,204);
  for(int i=0; i<100; i++){
  line(random(width), random(height), random(width), random(height));
  fill(0,0,0);
  rect(108,207,304,90);
  fill(255,255,255);
  rect(102,200,304,90);
    fill(0);
    textSize(80);
    text("Hi",210,275);
  }
}
}

void drawButton2() {
  if (button2) {
            size(500, 500);
  background(56,236,204);
  for(int i=0; i<100; i++){
  line(random(width), random(height), random(width), random(height));
  fill(0,0,0);
  rect(108,207,304,90);
  fill(255,255,255);
  rect(102,200,304,90);
    fill(0);
    textSize(80);
    text("say",190,265);
  }
}
}
void drawButton3() {
  if (button3) {
        size(500, 500);
  background(56,236,204);
  for(int i=0; i<100; i++){
  line(random(width), random(height), random(width), random(height));
  fill(0,0,0);
  rect(108,207,304,90);
  fill(255,255,255);
  rect(102,200,304,90);
    fill(0);
    textSize(80);
    text("omeme",110,270);
  }
}
}
void keyPressed() {
  switch(key) {
    case('1'):
    button1=true;
    break;
    case('2'):
    button2=true;
    break;
    case('3'):
    button3=true;
    break;
  }
}
void keyReleased() {
  switch(key) {
    case('1'):
    button1=false;
    break;
    case('2'):
    button2=false;
    break;
    case('3'):
    button3=false;
    break;
  }
}




int x1=0;
int y1=0;
int x2=0;
int y2=0;
int speed = 1;

void setup() {
  size(600, 400);
  noStroke();
}

void draw() { 
  // speed = 1
  background(#9ca6f0);
  fill(#000000);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("SPEED=1", 300, 150);
  
  fill(#c4c8ec);
  rect(195, 230, 205, 40, 7);
  fill(#ffffff);
  textSize(20);
  text("SPEED>1", 300, 250);

  fill(#ee7070);
  rect(x1+1,y1+1, 50, 50, 7);
  if (x1==0) {
    y1 += speed;
  } 
  if (y1==(height-51)) {
    x1 += speed;
  } 
  if (x1==(width-51)) {
    y1 -= speed;
  } 
  if (y1==0) {
    x1 -= speed;
  } 
    
  // speed > 1 (mousePressed) 
  if (mousePressed == true) {
    background(#c4c8ec);  
    fill(#000000);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("SPEED>1", 300, 250);
       
    fill(#9ca6f0);
    rect(195, 130, 205, 40, 7);
    fill(#ffffff);
    textSize(20);
    text("SPEED=1", 300, 150);
  
    fill(#ee7070);
    rect(x2+1,y2+1, 50, 50, 7);
    if (x2==0) {
      y2 += speed*2;
    } 
    if (y2==(height-51)) {
      x2 += speed*2;
    } 
    if (x2==(width-51)) {
      y2 -= speed*2;
    } 
    if (y2==0) {
      x2 -= speed*2;
    } 
    
    fill(#ed5353);
    rect(0, 380, 52, 30);
    text("IT DISAPPEARS HERE", 160, 390); 
  }
  
}







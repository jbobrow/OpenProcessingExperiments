
String aString ="Try and Hit the T-Shirts!";
PFont caslon;

void setup () {
  size(500,500);
  smooth();
  caslon = loadFont("ArialMT-48.vlw");
}

void draw() { 
  background(255);
  drawBackground();
  
  tR1.moveRightRect();  
  tR2.moveRightRect();
  tR3.moveRightRect();
  tR4.moveLeftRect(); 
  tR5.moveLeftRect();
  tR6.moveLeftRect();
  tR7.moveRightRect(); 
  tR8.moveRightRect();
  tR9.moveRightRect();
  tR10.moveLeftRect(); 
  tR11.moveLeftRect();
  tR12.moveLeftRect();
  
  t1.moveRight();  
  t2.moveRight();
  t3.moveRight();
  t4.moveLeft(); 
  t5.moveLeft();
  t6.moveLeft();
  t7.moveRight(); 
  t8.moveRight();
  t9.moveRight();
  t10.moveLeft(); 
  t11.moveLeft();
  t12.moveLeft();
  
  drawCrossHairs();
  
  textFont(caslon);
  fill(0,102,153);
  text(aString,0,480);

  text(counter, 30, 50);
}


void drawBackground(){
  fill(255);
  dottedLine(500,100,0,100,100);
  dottedLine(500,200,0,200,100);
  dottedLine(500,300,0,300,100);
  dottedLine(500,400,0,400,100);

}

void dottedLine(float x1, float y1, float x2, float y2, float steps){
 for(int i=0; i<=steps; i++) {
   float x = lerp(x1, x2, i/steps);
   float y = lerp(y1, y2, i/steps);
   noStroke();
   fill (50);
   rect(x, y,2,1);
 }
}

void mouseClicked() {
 fill(255,0,0);
  tR1.checkHit();  
  tR2.checkHit();
  tR3.checkHit();
  tR4.checkHit(); 
  tR5.checkHit();
  tR6.checkHit();
  tR7.checkHit(); 
  tR8.checkHit();
  tR9.checkHit();
  tR10.checkHit(); 
  tR11.checkHit();
  tR12.checkHit();
  println(counter);
}

void drawCrossHairs () {
  drawBackground();
  smooth();
  stroke(0,0,0,70);
  noFill();
  ellipse(mouseX, mouseY, 30,30);
  ellipse(mouseX, mouseY,50,50);
  stroke(0);
  line(mouseX-20,mouseY, mouseX+20, mouseY);
  line(mouseX, mouseY-20, mouseX, mouseY+20);
  fill(0,0,0,80);
  rect(mouseX-35, mouseY-2.5, 15,5);
  rect(mouseX+20, mouseY-2.5, 15,5);
  rect(mouseX-2.5, mouseY-35, 5,15);
  rect(mouseX-2.5, mouseY+20,5,15);
}



float circleX, circleY;
float diam;
PFont font;

void setup() {
  size(600, 450);
  circleY = 150;
  background(255);
}

void draw() {
  fill(230);
  triangle(280, 350, 300, 320, 320, 350);//up
  triangle(280, 360, 300, 390, 320, 360);//down

  float time = millis()*0.001;
  float sine = sin(time/6);
  noStroke();
  fill(random(100, 255), random(200, 255), random(100, 255));

  circleX = map (sine, -1, 1, 0, width);
  diam=random(1, 30);
  ellipse(circleX, circleY, diam, diam);

  //clear button
  fill(230);
  rect(360, 340, 50, 30);
  fill(0);
  text("CLEAR", 367, 357);
  if (mouseX > 360 && mouseX <410 && 
    mouseY > 340 && mouseY < 370 && mousePressed)
  { 
    println ("clear button");
    background(255);
  }

  translate(width/2, height/2);

  //Up button
  if (mouseX > 280 && mouseX <320 
    && mouseY > 320 &&  mouseY < 350 && mousePressed) 
  {
    println ("up button");
    circleY--;
  }
  if (circleY<-10) {
    circleY=height+10;
  }
  //Down button
  if (mouseX > 280 && mouseX <320
    && mouseY > 360 && mouseY < 400 && mousePressed)
  {
    println ("down button");
    circleY++;
  }
}

//Capture Screen
void keyPressed() {

  if (keyPressed) {
    if (key=='s'||key=='a') {
      saveFrame();
    }
  }
}




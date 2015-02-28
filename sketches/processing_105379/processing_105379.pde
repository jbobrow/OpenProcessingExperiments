
int colorValue;
boolean mouseOnRight;
PFont gill;
int fontPosY;

void setup() {
  size(400, 400);
  background(255);
  fontPosY=100;
  gill = loadFont("GillSans-48.vlw");

  colorValue = 0;
  mouseOnRight = false;
}

void draw () {

  fill (174-colorValue, 279-colorValue, 0);
  rect(0, 0, 100, 100);

  fill (200-colorValue, 255-colorValue, 0);
  rect(100, 0, 100, 100);

  fill (255-colorValue, 255-colorValue, 0);
  rect(200, 0, 100, 100);

  fill (255-colorValue, 255-colorValue, 0);
  rect(300, 0, 100, 100);



  fill (255, 255-colorValue, 255);
  rect(0, 100, 100, 100);

  fill (255, 255-colorValue, 255);
  rect(100, 100, 100, 100);

  fill (255, 255-colorValue, 255);
  rect(200, 100, 100, 100);

  fill (255, 255-colorValue, 255);
  rect(300, 100, 100, 100);




  fill (255-colorValue, 0, 255);
  rect(0, 200, 100, 100);

  fill (255, 0, 255-colorValue);
  rect(100, 200, 100, 100);

  fill (255, 0, 255-colorValue);
  rect(200, 200, 100, 100);

  fill (255-colorValue, 0, 255);
  rect(300, 200, 100, 100);



  fill (255-colorValue, 255-colorValue, 255);
  rect(0, 300, 100, 100);

  fill (255, 255-colorValue, 255-colorValue);
  rect(100, 300, 100, 100);

  fill (255, 130-colorValue, 255-colorValue);
  rect(200, 300, 100, 100);

  fill (255-colorValue, 255-colorValue, 255);
  rect(300, 300, 100, 100);


  textFont(gill);
  text("scratch n sniff", 20, fontPosY);



  if (mouseX > width/2 && mouseOnRight == false) {
    mouseOnRight = true;
    colorValue += 5;
  }

  if (mouseX < width/2 && mouseOnRight == true) {
    mouseOnRight = false;
    colorValue += 5;
  }

  println(colorValue);
}




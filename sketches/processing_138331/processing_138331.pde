
float lineX = 450;
float lineY = 450;
int radius = 400;
int angle = 0;
int red = 0;
int blue = 0;
int i = 0;
int s = 0;
int a = 100;

void setup(){
  background(0);
  size (800, 800);
  frameRate(30);
  fill(25);
  ellipse(width/2, height/2, 700, 700);
}

  void keyPressed() { //hit the "s" key and save my image
  if (key=='s')
  {
    saveDrawing();
  }
}

void draw(){
//getting the lines to draw in random lengths and angles away from the mouse
 if ((mousePressed) && mouseX>50 && mouseX<750 && mouseY>50 && mouseY<750){
   mousePressed = true;
   i = random(-120, 120);
   s = random(-120, 120);
   a = random(90, 255);
   strokeWeight(random(.5, 3));
   stroke(red, 0, blue, a);
 line(mouseX, mouseY, mouseX+i, mouseY+s);
 red= floor(random(250));
 blue= floor(random(250));
 }
}

void saveDrawing() {
  saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
}





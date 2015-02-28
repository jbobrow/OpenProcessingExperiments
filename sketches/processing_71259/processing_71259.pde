
 
 
PImage bg;
int a; 
int rectWidth;

void setup() 
{
  size(500,500);
  frameRate(30);
  bg = loadImage("mback4.jpg");
  rectWidth = width/4;
}

void draw() 
{
  background(bg);
    //2 yellow lines drifting down (from Background example)
  a = (a + 1)%(width+32);
  stroke(226, 204, 0);
  line(0, a, width, a-26);
  line(0, a-6, width, a-32);
}

void keyPressed() {
  //blackBars triggered when keys are hit (fromInput key pressexample)
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    // If it's not a letter key, clear the screen
    background(0);
  } else { 
    // It's a letter key, fill a rectangle
    fill(millis() % 255);
    float x = map(keyIndex, 0, 25, 0, width - rectWidth);
    rect(x, 0, rectWidth, height);
  }
    
    //(from Input mousPressed example)
     if(mousePressed) {
    stroke(255);
     }else {
    stroke(0);
  }
     
     line(mouseX-66, mouseY, mouseX+66, mouseY);
     line(mouseX, mouseY-66, mouseX, mouseY+66);


}



PFont font ;

void setup () {
  size (500, 500);
  smooth();
  font = loadFont("GravurCondensed-Thin-100.vlw");
  textFont(font);
}

void draw () {
  background (0);
  textSize(36);


  if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    fill (random(0,255));
    text ("A", 30, 100);
  }
  else {
    fill(0);
    text ("A", 30, 0);
  }
  
  if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    fill (random(0,255));
    text ("P", 30+20, 100);
  }
  else {
    fill(0);
    text ("P", 30+20, 0);
  }
  
  if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    fill (random(0,255));
    text ("P", 30+40, 100);
  }
  else {
    fill(0);
    text ("P", 30+40, 0);
  }
  
   if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    fill (random(0,255));
    text ("E", 30+60, 100);
  }
  else {
    fill(0);
    text ("E", 30+60, 0);
  }
  
   if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    fill (random(0,255));
    text ("A", 30+80, 100);
  }
  else {
    fill(0);
    text ("A", 30+80, 0);
  }
  
  
  if (mousePressed == true) {
    int x = mouseX;
    int y = mouseY;
    fill (random(0,255));
    text ("R", 30+100, 100);
  }
  else {
    fill(0);
    text ("R", 30+100, 0);
  }

}



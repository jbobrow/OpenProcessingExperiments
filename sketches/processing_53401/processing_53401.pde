
PFont font ;

void setup () {
  size (500, 500);
  smooth();
  font = loadFont("GravurCondensed-Black-100.vlw");
  textFont(font);
}

void draw () {
  background (0);
  textSize(36);


  if (mousePressed == true) {
    
    fill (random(0,255));
    text ("F", 30+11, 100);
  }
  else {
    fill(0);
    text ("F", 30+11, 0);
  }
  
  if (mousePressed == true) {
    
    fill (random(0,255));
    text ("L", 30+30, 100);
  }
  else {
    fill(0);
    text ("L", 30+30, 0);
  }
  
  if (mousePressed == true) {
   
    fill (random(0,255));
    text ("I", 30+48, 100);
  }
  else {
    fill(0);
    text ("I", 30+48, 0);
  }
  
   if (mousePressed == true) {
   ;
    fill (random(0,255));
    text ("C", 30+60, 100);
  }
  else {
    fill(0);
    text ("C", 30+60, 0);
  }
  
   if (mousePressed == true) {
    
    fill (random(0,255));
    text ("K", 30+80, 100);
  }
  else {
    fill(0);
    text ("K", 30+80, 0);
  }
  
  
  if (mousePressed == true) {
   
    fill (random(0,255));
    text ("E", 30+100, 100);
  }
  else {
    fill(0);
    text ("E", 30+100, 0);
  }
  
  if (mousePressed == true) {
    
    fill (random(0,255));
    text ("R", 30+120, 100);
  }
  else {
    fill(0);
    text ("R", 30+120, 0);
  }

}


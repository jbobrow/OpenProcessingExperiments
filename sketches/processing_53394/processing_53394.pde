
PFont font ;

void setup () {
  size (500, 500);
  smooth();
  font = loadFont("GravurCondensed-Thin-75.vlw");
  textFont(font);
}

void draw () {
  background (255);
  textSize(36);


  if (mousePressed == true) {
    
    fill (0);
    text ("H", 30, 100);
  }
  else {
    fill(0);
    text ("S", 30, 100);
  }
  
  if (mousePressed == true) {
    
    fill (0);
    text ("W", 30+20, 100);
  }
  else {
    fill(0);
    text ("W", 30+20, 100);
  }
  
  if (mousePressed == true) {
    
    fill (0);
    text ("T", 30+50, 100);
  }
  else {
    fill(0);
    text ("I", 30+50, 100);
  }
  
   if (mousePressed == true) {
    
    fill (0);
    text ("C", 30+67, 100);
  }
  else {
    fill(0);
    text ("T", 30+67, 100);
  }
  
   if (mousePressed == true) {
   
    fill (0);
    text ("S", 30+87, 100);
  }
  else {
    fill(0);
    text ("C", 30+87, 100);
  }
  
  
  if (mousePressed == true) {
   
    fill (0);
    text ("I", 30+107, 100);
  }
  else {
    fill(0);
    text ("H", 30+107, 100);
  }

}




PFont font ;

void setup () {
  size (500, 500);
  smooth();
  font = loadFont("GravurCondensed-Black-48.vlw");
  textFont(font);
}

void draw () {
  background (255);
  textSize(36);


  if (mousePressed == true) {
    
    fill (0);
    text ("D", 60, 300);
  }
  else {
    fill(0);
    text ("D", 60, 300);
  }


  if (mousePressed == true) {
    
    fill (0);
    text ("E", 83+1, 300);
  }
  else {
    fill(0);
    text ("E", 83, 300);
  }

  if (mousePressed == true) {
   
    fill (0);
    text ("C", 105+2, 300);
  }
  else {
    fill(0);
    text ("C", 105, 300);
  }

  if (mousePressed == true) {
    
    fill (0);
    text ("O", 127+3, 300);
  }
  else {
    fill(0);
    text ("O", 127, 300);
  }

  if (mousePressed == true) {
    
    fill (0);
    text ("N", 151+5, 304);
  }
  else {
    fill(0);
    text ("N", 151, 300);
  }

  if (mousePressed == true) {
    
    fill (0);
    text ("S", 178+25, 277);
  }
  else {
    fill(0);
    text ("S", 178, 300);
  }

  if (mousePressed == true) {
    
    fill (0);
    text ("T", 200+40, 400);
  }
  else {
    fill(0);
    text ("T", 200, 300);
  }

  if (mousePressed == true) {
    
    fill (0);
    text ("R", 220+80, 280);
  }
  else {
    fill(0);
    text ("R", 220, 300);
  }

  if (mousePressed == true) {
    
    fill (0);
    text ("U", 244+120, 400);
  }
  else {
    fill(0);
    text ("U", 244, 300);
  }

  if (mousePressed == true) {
    ;
    fill (0);
    text ("C", 268+180, 370);
  }
  else {
    fill(0);
    text ("C", 268, 300);
  }

  if (mousePressed == true) {
    
    fill (0);
    text ("T", 293+190, 390);
  }
  else {
    fill(0);
    text ("T", 293, 300);
  }
}



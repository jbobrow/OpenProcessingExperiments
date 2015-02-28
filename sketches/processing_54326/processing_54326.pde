
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
    pushMatrix ();
    float r = random(15,120);
    
    translate (178+25, 277);
    rotate (radians (r));
    fill (0);
    text ("S", 0,0);
    popMatrix ();
  }
  else {
    fill(0);
    text ("S", 178, 300);
  }

  if (mousePressed == true) {
    
    pushMatrix ();
    float r = random(15,220);
    
    translate (200+40, 300);
    rotate (radians (r));
    fill (0);
    text ("T", 0,0);
    popMatrix ();
    
    
  }
  else {
    fill(0);
    text ("T", 200, 300);
  }

  if (mousePressed == true) {
    
    pushMatrix ();
    float r = random(40,120);
    
    translate (220+80, 280);
    rotate (radians (r));
    fill (0);
    text ("R", 0,0);
    popMatrix ();
    
    
  }
  else {
    fill(0);
    text ("R", 220, 300);
  }

  if (mousePressed == true) {
    
    pushMatrix ();
    float r = random(50,200);
    
    translate (244+120, 400);
    rotate (radians (r));
    fill (0);
    text ("U", 0,0);
    popMatrix ();
    
   
  }
  else {
    fill(0);
    text ("U", 244, 300);
  }

  if (mousePressed == true) {
    pushMatrix ();
    float r = random(100,300);
    
    translate (268+180, 370);
    rotate (radians (r));
    fill (0);
    text ("C", 0,0);
    popMatrix ();
    
  }
  else {
    fill(0);
    text ("C", 268, 300);
  }

  if (mousePressed == true) {
    
    pushMatrix ();
    float r = random(15,120);
    
    translate (293+190, 390);
    rotate (radians (r));
    fill (0);
    text ("T", 0,0);
    popMatrix ();
    
   
  }
  else {
    fill(0);
    text ("T", 293, 300);
  }
}



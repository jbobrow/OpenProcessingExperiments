
void setup() {
  size(600, 600);
  noStroke();
  colorMode(RGB, 200);
  background(random(000), (random(200)), random(200));
  // randomizes background colour


  // randomly generates rectangles to display
  for (int k = 0; k<700; k++) {
    stroke(random(200), random(200), random(200), 95);
    fill(random(200), random(200), random(200), 90);
    rect(random(k), random(k), random(100), random(100));
    
  } 
  
  // randomly generates circles to display
  for (int x=0;x < width;x+=25) {
    for (int y=0;y<height;y+=25) {
      stroke(random(200), random(200), random(200), 80);
      fill(random(200), random(200), random(200), 75);
      ellipse(random(x), random(y), 20,20);
      
    }
  }
  // randomly generates trianglea to display
  for (int z=0;z < width;z+=100) {
    for (int c=0;c<height;c+=100) {
      fill(random(200), random(200), random(200), 33); 
      triangle(random(z+50), random(c+50), random(z+50), random(z), random(c), random(z));
    }
  }

  int x = 30;
  PFont fontA;
  fontA = loadFont("ArialMT-48.vlw");

  // Set the font and its size (in units of pixels)
  textFont(fontA, 48);

  // Only draw once
  noLoop();
  fill(0);
  // Set the left and top margin
  int margin = 6;
  int gap = 100;
  translate(60,60);
  // Create a matrix of letterforms
 
   // writes 'majed'
  fill((random(200)+20), random(200), random(200));
  rotate(PI/random(600));
  text("M", random(20,40), random(10));
  rotate(PI/random(600));
  text("A", random(60,80), random(10));
  rotate(PI/random(600));
  text("J", random(100,120), random(10));
  rotate(PI/random(600));
  text("E", random(140,160), random(10));
  rotate(PI/random(600));
  text("D", random(180,200), random(10));
  
  //writes 'martyn'
  fill((random(200)+20), random(200), random(200));
  rotate(PI/random(600));
  text("M", random(20,40), random(60,70));
  rotate(PI/random(600));
  text("A", random(60,80), random(60,70));
  rotate(PI/random(600));
  text("R", random(100,120), random(60,70));
  rotate(PI/random(600));
  text("T", random(140,160), random(60,70));
  rotate(PI/random(600));
  text("Y", random(180,200), random(60,70));
  rotate(PI/random(600));
  text("N", random(220,240), random(60,70));
  
  //writes 'hussain'
  fill((random(200)+20), random(200), random(200));
  rotate(PI/random(600));
  text("H", random(20,40), random(120,130));
  rotate(PI/random(600));
  text("U", random(60,80), random(120,130));
  rotate(PI/random(600));
  text("S", random(100,120), random(120,130));
  rotate(PI/random(600));
  text("S", random(140,160), random(120,130));
  rotate(PI/random(600));
  text("A", random(180,200), random(120,130));
  rotate(PI/random(600));
  text("I", random(220,240), random(120,130));
  rotate(PI/random(600));
  text("N", random(260,280), random(120,130));
  
}

void draw() {
  /* backgroun
   for (int i = 0; i < 600; i++) {
   for (int j = 0; j < 600; j++) {
   fill(i, j, 600);
   rect(i, j, 100, 100);
   }
   }
   */
}


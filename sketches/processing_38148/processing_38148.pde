
void setup() {
  size (300, 300);
  colorMode(RGB);
}
 
 //create yellow circles which touch and create a void
void draw() {
  background(0);
  for (int x=25; x<300; x+=50) { 
    for (int y=25; y<300; y+=50) {  
      fill(254,255,3);
      noStroke();             
      ellipse(x, y, 50, 50);
  }
 }
 //create white circles in the voids created by the yellow circles
  for (int x=25; x<275; x+=50) { 
    for (int y=25; y<275; y+=50) {
      fill(255);
      ellipse(x+25, y+25, 10, 10);
  }
 }
}



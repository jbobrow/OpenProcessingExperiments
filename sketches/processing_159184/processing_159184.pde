
int cielo;

void setup() {
  size (500, 500);
  cielo=0;
  } 
void draw() {
  cielo++;
  colorMode(RGB);
  background(random(190),150,225);
  colorMode(HSB);
  fill (random(250), 100, 250);
  ellipse (250, cielo, 90, 90);
  if (cielo<width/3) {
    colorMode(RGB);
    stroke(50);
    fill(160, 37, 37);
    ellipse(150, cielo, 70, 70);
    rect(cielo, cielo, 70, 70);
    fill(18, 162, 161);
    ellipse(450, cielo, 70, 70);
    fill(0);
    ellipse(cielo, width/3, 70, 70);
    

  }
  if (cielo<width/3*2) {
    fill(6, 103, 5);
    ellipse(150, cielo, 70, 70);
} 
else {
  colorMode(RGB);
  fill (10, 147, 9);
  rect(cielo, cielo, 70, 70);
  fill(11, 209, 8);
  ellipse(150, cielo, 70, 70);
  fill (150, 130, 20);
  ellipse (450, cielo, 70, 70);
  fill(170);
  ellipse(cielo, width/3, 70, 70);
  fill(9, 113, 174);
  ellipse(cielo, width/3*2, 70, 70);
    
}
  
}

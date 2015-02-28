
int n;
PFont font;
int timer;
int range = 60;
float spacing;
boolean cycle = true;

void setup() {
  size(800,600);
  background(0);
  n=2;
  spacing = width / (range+1); // leave some room on the edge
  timer = millis();
  font = createFont("Roboto", 9);
  textFont(font);
  textAlign(CENTER, CENTER);
}

void mousePressed() {
  // if they clicked near the number line
  if (mouseY > 375 && mouseY < 425) {
    // then select the number they clicked near
    n = round(mouseX / spacing);
    cycle = false;
  } else { // otherwise just toggle animation
    cycle = !cycle;
  }
}

void draw() {
  background(0);
  if (cycle) {
    if (millis() > timer + 500) {
      n++;
      if (n > range) {
        n = 2;
      }
      timer = millis();
    }
  }
  
  // draw the number labels
  for (int i=1; i <= range; i++) {
    text(i, i*spacing, 400);
  }
  
  noFill();
  stroke(255);
  strokeWeight(2);
  for (int j=1; j <= sqrt(n); j++) {
    if (n % j == 0) {
      int k = n / j;
      // j and k are factors of n
      if (j == k) { // roots of a perfect square
        arc( spacing*j, 390, spacing/2, spacing, PI, PI*2 );
      } else {
        arc( spacing*(j+k)/2, 390, (k-j)*spacing, (k-j)*spacing/2, PI, PI*2);
      }
    }
  }
  
  
}

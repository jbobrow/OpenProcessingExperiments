
// Tak-KI
// Verkefni 4
// innblástur frá sýnishorna-horninu.

int rectX, rectY;    // Ræður staðsetningu takkans
int rectSize = 90;     // Diameter of rect
color rectColor1, rectColor2, baseColor, rectHighlight, currentColor;
boolean rectOver = false;


void setup() {
  size(400, 400); // Stærð upphaflega glugga.
  if (frame != null) { // Ef gluggin er til...
    frame.setResizable(true);}  // ...Er hægt að breyta stærð hanns
  rectColor2 = color (0, 255, 0); 
  rectColor1 = color(255, 0, 0);
  rectHighlight = color(0, 0, 255);
  baseColor = color(0, 0, 200);
  currentColor = color(0);
  
}

void draw() {
  rectX = width/2-45; // Teiknar takkann á miðjum glugganum.
  rectY = height/2-90/2; 
  update(mouseX, mouseY);
  background(currentColor);
  
  if (rectOver) { // Ef músin er innan kassans...
    fill(rectHighlight); // ...Er hann lýstur
  } else {
    fill(baseColor); // Annasr er hefur hann upphaflega litinn.
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
}

void update(int x, int y) {
  if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
  } else {
   rectOver = false;
  }
}


void mousePressed() {
  if (rectOver) {
    if (currentColor == rectColor1) {
    currentColor = rectColor2;
    } else {
    currentColor = rectColor1;
    }
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}



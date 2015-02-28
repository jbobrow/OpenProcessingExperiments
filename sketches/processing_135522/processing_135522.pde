
//Sam Legros, Exercise 5, Question 1




// NOTE! Swipe mouse across window (not too slowly) to reveal hidden message!




float[] hilite = new float[8];

void setup() {
  size(520, 210);
  background(255);
  noStroke();
  textSize(16);
  fill(0);
  text("'All I ever wanted really, and continue to want out of life,", 10, 40);
  text("is to give 100 percent to whatever I'm doing and to be", 10, 60);
  text("committed to whatever I'm doing and then let the results", 10, 80);
  text("speak for themselves. Also to never take myself or", 10, 100);
  text("people for granted and I will always be thankful and grateful", 10, 120);
  text("to the people who helped me.' - Quote by Jacki Joyner-Kersee", 10, 140);
  text("Quote was taken from brainyquote.com because it is where you", 10, 160);
  text("find who you are, and to then become the best you can be.", 10, 180);
}
void draw() {
  println(mouseX, mouseY);
  if (mouseX > 40 && mouseX < 155) {
    for (int i=0; i < hilite.length; i++) { 
      float x = mouseX;
      float y = map(i, 0, 8, 30, 190);
      fill(224, 255, 0, 10);
      rect(x, 50, 10, 10);
    }
  }
  if (mouseX > 170 && mouseX < 335) {
    for (int i=0; i < hilite.length; i++) { 
      float x = mouseX;
      float y = map(i, 0, 8, 30, 190);
      fill(224, 255, 0, 10);
      rect(x, 110, 10, 10);
    }
  }
  if (mouseX > 84 && mouseX < 230) {
    for (int i=0; i < hilite.length; i++) { 
      float x = mouseX;
      float y = map(i, 0, 8, 30, 190);
      fill(224, 255, 0, 10);
      rect(x, 70, 10, 10);
    }
  }
  if (mouseX > 72 && mouseX < 119) {
    for (int i=0; i < hilite.length; i++) { 
      float x = mouseX;
      float y = map(i, 0, 8, 30, 190);
      fill(224, 255, 0, 10);
      rect(x, 170, 10, 10);
    }
  }
  if (mouseX > 277 && mouseX < 328) {
    for (int i=0; i < hilite.length; i++) { 
      float x = mouseX;
      float y = map(i, 0, 8, 30, 190);
      fill(224, 255, 0, 10);
      rect(x, 170, 10, 10);
    }
  }
}



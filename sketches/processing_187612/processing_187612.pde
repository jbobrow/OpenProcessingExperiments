


void setup() {
  size(800, 600);
  smooth();
  noCursor();


}

void draw() {
    noStroke();
   int time1 = 2000;
  int timer = millis();
 println(timer); 
  int currentTime = millis();
  background (55, 200, 55);
  for (int y = 0; y <= height; y += 17) {
    for (int x= 0; x <= width; x += 17) {
      fill(200, 50, 55);
      ellipse (x, y, 15, 15);
    }
  }


  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      background (200, 50, 55);
      for (int y = 0; y <= height; y += 17) {
        for (int x= 0; x <= width; x += 17) {
          fill(55, 200, 55);
          ellipse (x, y, 15, 15);

        }
         }
        }
      }
    
    if (mousePressed == true) {
    if (mouseButton == RIGHT) {
      background (55, 50, 200);
      for (int y = 0; y <= height; y += 17) {
        for (int x= 0; x <= width; x += 17) {
          fill(55, 155, 55);
          ellipse (x, y, 15, 15);
  
  
}
      }
    }
    }

if (keyPressed) {
  if (key == 'c') {
  background(0);
  for (float i=0; i<height; i+=5.3) {
    stroke(55, 200, 55);
 
strokeWeight(.4);
    line(mouseX, mouseY, 0, i);
    line(mouseX, mouseY, width, i);
  }
  for (float i=0; i<width; i+=5.3) {
    line(mouseX, mouseY, i, 0);
    line(mouseX, mouseY, i, height);

  }
}
}
}













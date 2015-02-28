
// Created by Sarah Oh
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Lovell Health House by Richard Neutra

void setup() {
  size(1200, 500); 
  background(255);
  noCursor();
}

void mousePressed() {
  background(255);
  int numObjects = 5;

  for (int i = 0; i < numObjects; i++) {
    noStroke();

    fill(mouseX, mouseY, 0);
    noStroke();
    rect((450), random(70, 100), (950), (1));
    rect((450), random(195, 250), (480), (1));
    rect((1040), random(260, 290), (600), (1));
    rect((1040), random(300, 320), (120), (1));
    rect((820), random(330, 360), (340), (1));
    rect((520), random(370, 400), (640), (1));
    rect((200), random(410, 490), (730), (1));
    rect((940), random(410, 490), (220), (1));
    rect((200), random(500, 550), (960), (1));
  }
}

void draw() {
  translate (-200, -50);
  stroke(mouseX, 150, mouseY, mouseY);
  smooth();
  strokeWeight(1);
  line(1220, 110, 1220, 250);
  line(1280, 110, 1280, 250);
  line(1340, 110, 1340, 250);
}

void mouseDragged() {
  translate (0, 0);
  int numObjects = 1;

  for (int i = 0; i < numObjects; i++) {
    noStroke();

    fill(mouseX, 150, mouseY, mouseY);
    rect(random(450, 920), (110), (10), (75));
    rect(random(940, 1150), (110), (10), (40));
    rect(random(940, 1150), (160), (10), (40));  
    rect(random(940, 1150), (210), (10), (40));  
    rect(random(520, 1020), (260), (10), (60));
    rect(random(520, 800), (330), (10), (30));

    fill(255);
    rect(random(450, 920), (110), (10), (75));
    rect(random(940, 1150), (110), (10), (40));
    rect(random(940, 1150), (160), (10), (40));  
    rect(random(940, 1150), (210), (10), (40));  
    rect(random(520, 1020), (260), (10), (60));
    rect(random(520, 800), (330), (10), (30));
  }
}



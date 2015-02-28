
int y = 0;

void setup() {
  size(800, 800); // Tamaño del canvas.
  background(90);
  frameRate(30);
}

void draw() {
  translate(width/2, height/2);

  // Semillas
  if (y<=150)
  {
    rotate(y);
    stroke(53, 2216);
    fill(33, 22, 20);
    rect(y, 0, 30, 30);
  } 

  // Petalos
  else if (y < 200+50) {
    rotate((200-y*2)*TWO_PI/(70-1));
    stroke(0);
    fill(251, 255, 0);
    ellipse(180+random(0, 20)+int((230-y)/5)*2, 0, 120, 40);
  }
  
  else if (y < 450) {
    rotate((200-y*2)*TWO_PI/(70-1));
    noStroke();
    fill(211, 138, 2, 30);
    ellipse(189+random(0, 20)+int((230-y)/5)*1.3, 0, 120, 40);
  }

  y++;
}



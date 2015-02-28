
// Tamaño inicial de la bola
float ballH = 50, ballW = 50;
// Tamaño actual de la bola
float currH = ballH, currW = ballW;
// Posición actual de la bola
float currX, currY;
// Posición inicial de la bola
float startX, startY;

// Flag para controlar animación
boolean startAnim = false;
boolean goDown = true;

float i = 0;
float j = 0.05;


void setup() {
  size(640, 480);
  background(0);
  strokeWeight(3);
  frameRate(70);

  textSize(24);
  fill(0, 102, 153);
  text("Click to start", 30, 60); 

  ellipseMode(CENTER);
  startX = width * 0.5;
  startY = height * 0.15;
  currX = startX;
  currY = startY;
}

void draw() {
  if (startAnim) {
    noStroke();
    fill(0x70000000);
    rect(0, 0, width, height);

    // Tocamos el suelo; rebotamos
    if (((currY + currH + 8) >= height) || !goDown) {
      if (j >= 0.30) startAnim = false;
      if (goDown) j += 0.01;
      goDown = false;

      translate(0, i);
      currY = currY - i;
      i -= 0.3 + j;
    }    
    // Si llegamos al techo o al iniciar; caemos
    if ((i <= 0.5) || goDown) {
      if (!goDown) i = 0;
      goDown = true;

      translate(0, i);
      currY = currY + i + j;
      i += 0.3;
    }

    stroke(0x90FFFFFF);
    fill(0xFF22BB22);
    ellipse(currX, currY, currW, currH);

    print("cY:" + currY + " cH:" + currH + " gD:" + goDown + " sY:" + startY + " i:" + i + " j:" + j + "\n");
  }
}


void mousePressed() {
  startAnim = !startAnim;
}

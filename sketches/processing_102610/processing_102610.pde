
// Configuration Section
int brushes = 25;
int delay = 1;
// End Configuration

int pbrush[][];
Maxim maxim;
AudioPlayer player;
boolean playing;
int spacing = 0;

void setup() {
  size(600, 600);
  background(0);
  smooth();
  pbrush = new int[200][2];
  maxim = new Maxim(this);
  player = maxim.loadFile("song.wav");
  player.setLooping(true);
  player.setAnalysing(true);
  playing = true;
}

void draw() {
  float weight, speed;
  int r, g, b, a;

  r = (int) map(mouseX, 0, width, 0, 255);
  g = (int) map(mouseY, 0, height, 0, 255);
  b = (int) dist(mouseX, mouseY, width / 2, height / 2);

  speed = constrain(dist(pmouseX, pmouseY, mouseX, mouseY), 0, 20);
  a = (int) map(speed, 0, 20, 0, 15);

  if (playing) {
    player.play();
    player.speed(0.9);

    if (spacing == 0) {
      if (player.getAveragePower() > 0.35) {
        fill(r, g, b);
        noStroke();
        float w = 5 + dist(0, mouseY, 0, height / 2) / 5;
        float h = 5 + dist(mouseX, 0, width / 2, 0) / 5;
        draw4Ellipses(mouseX, mouseY, w, h);
        spacing = 10;
      }
    } 
    else {
      spacing -= 1;
    }
  }

  noStroke();
  fill(0, a);
  rect(0, 0, width, height);

  stroke(r, g, b);
  strokeWeight(weight);
  draw4Lines(pmouseX, pmouseY, mouseX, mouseY);

  drawBrushes(g, b, r, 127, 1);
}

void drawBrushes(int r, int g, int b, int a, int weight) {
  stroke(r, b, g);
  strokeWeight(weight);

  for (int i = 0; i < brushes; ++i) {
    int brush[] = new int[2];
    brush[0] = pbrush[i][0] + (mouseX - pbrush[i][0]) / ((i+1) * delay);
    brush[1] = pbrush[i][1] + (mouseY - pbrush[i][1]) / ((i+1) * delay);
    draw4Lines(pbrush[i][0], pbrush[i][1], brush[0], brush[1]);
    pbrush[i] = brush;
  }
}

void draw4Lines(int pX, int pY, int X, int Y) {
  line(pX, pY, X, Y);
  line(width - pX, pY, width - X, Y);
  line(pX, height - pY, X, height - Y);
  line(width - pX, height - pY, width - X, height - Y);
}

void draw4Ellipses(int x, int y, float w, float h) {
  ellipse(x, y, w, h);
  ellipse(width - x, y, w, h);
  ellipse(x, height - y, w, h);
  ellipse(width - x, height - y, w, h);
}

void keyPressed() {
  switch(keyCode) {
  case LEFT:
    delay = constrain(delay - 1, 1, 20);
    break;
  case RIGHT:
    delay = constrain(delay + 1, 1, 20);
    break;
  case ENTER:
    background(0);
    for (int i = 0; i < brushes; ++i) {
      pbrush[i][0] = mouseX;
      pbrush[i][1] = mouseY;
    }
    break;
  case UP:
    brushes = constrain(brushes + 1, 10, 200);
    break;
  case DOWN:
    brushes = constrain(brushes - 1, 10, 200);
    pbrush[brushes][0] = 0;
    pbrush[brushes][1] = 0;
    break;
  }

  switch(key) {
  case ' ':
    playing = !playing;
    if (!playing)
      player.stop();
    break;
  }
}

void stop()
{
  player.stop();
  super.stop();
}




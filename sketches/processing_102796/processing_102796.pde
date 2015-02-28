
Maxim maxim;
AudioPlayer player;
PFont font = createFont("Arial", 16, true);

void setup()
{
  size(800, 600);
  maxim = new Maxim(this);
  player = maxim.loadFile("silbido.wav");
  player.setLooping(true);
  background(0);
}

void draw()
{
  
}

void mouseDragged()
{
  float speed = ceil(dist(pmouseX, pmouseY, mouseX, mouseY));
  
  noStroke();
  rectMode(CORNER);
  fill(0, random(5, 25));
  rect(0, 0, width, height);

  rectMode(CENTER);
  strokeWeight(5 + random(20));
  fill(random(50, 255), random(50, 255), random(50, 255), 255);
  brush(mouseX, mouseY);

  player.play();
  player.ramp(1.0, 1000);
  player.speed((float) map(speed, 0, 50, 0.5, 2.0));
}

void mouseReleased()
{
  player.ramp(0.0, 1000);
}

void brush(float x, float y)
{
  String st = new String(char(65+random(26)));
  pushMatrix();
  translate(x, y);
  rotate(random(-PI, PI));
  textFont(font, 10+random(40));
  text(st, 0, 0);
  popMatrix();
}



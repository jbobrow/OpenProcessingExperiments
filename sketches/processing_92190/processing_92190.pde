


PFont font;
float x1 = 0;
float x2 = width;
int opacity = 0;
int direction = 1;
String s = "Toward those short trees We saw a hawk descending On a day in spring";
float angle = 0.0;
float timer = 0.0;

void setup() {
  size( 600, 400);
  colorMode(HSB, 360, 100, 100, 100);
  font = loadFont("Herculanum-48.vlw");
  textFont(font);
  fill(0);
}

  
void draw(){  
  background(timer*20, 60, 80, 40);
  timer += 0.0167;
  if (timer > 18.0) {
    timer = 0.0;
  }
  
  fill(timer*25);
  text("An old silent pond...A frog jumps into the pond,splash! Silence again.", x1, 50);
  text("Over the wintryforest, winds howl in  rage with no leaves to blow.", x2, 350);
  x1 += 1.0;
  if (x1 > width) { x1 = -1500; }
  x2 -= 0.8;
  if (x2 < -1500) { x2 = width; }
  
  opacity += 2 * direction;
  if (( opacity < 0) || ( opacity > 255)) {
    direction = -direction;
  }
  
  fill(0);
  angle += 0.02;
  pushMatrix();
  translate(width/2, height/2);
  scale(( cos( angle/4.0) + 1.2) * 2.0);
  rotate(angle);
  text(s, 0, 0);
  popMatrix();
  
  fill(255, opacity);
  text("The old pond", width/2, height/2 - 50);
  text("A frog jumps in", width/2 , height/2);
  text("The sound of the water", width/2, height/2+ 50);
}



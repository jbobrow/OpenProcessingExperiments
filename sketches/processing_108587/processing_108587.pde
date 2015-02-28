
/* dont run this if you are an epileptic */

void setup() {
  frameRate(30);
  size(500, 200);
}

void draw() {
  /* set up colors */
  color back_color = get_rand_color();
  color text_color = get_rand_color();
  color heart_stroke = get_heart_color();
  color heart_color = get_heart_color();
  while (text_color == back_color)
    text_color = get_rand_color();
  while (heart_stroke == back_color || heart_stroke == text_color)
    heart_stroke = get_heart_color();
  while (heart_color == heart_stroke)
    heart_color = get_heart_color();

  background(back_color);
  
  /* write "hello world" */
  noStroke();
  fill(128);
  rect(0, 0, width/7, 12);
  fill(64);
  textFont(createFont("Lucida Console", 12));
  textAlign(LEFT, TOP);
  text("hello world", 0, 0);

  /* write a seductive message */
  fill(text_color);
  textFont(createFont("Impact", 48));
  textAlign(CENTER, CENTER);
  text("I GIVE BLOWJOBS\nFOR ONLY $5.",
       width/2, height/2);

  /* draw a heart coming out of the mouse */
  float heart_w = 30;
  drawHeart(mouseX, mouseY, heart_w, heart_color, heart_stroke);
}

void drawHeart(int x, int y, float w, color heart_color, color heart_stroke) {
  /* draw inside of heart */
  noStroke();
  fill(heart_color);
  rect(x-2*w/3, y-2*w/3, 2*w/3, 2*w/3);
  arc(x-2*w/3, y-w/3, 2*w/3, 2*w/3, HALF_PI, PI+HALF_PI);
  arc(x-w/3, y-2*w/3, 2*w/3, 2*w/3, PI, TWO_PI);
  
  /* draw outside of heart */
  noFill();
  stroke(heart_stroke);
  strokeWeight(w/15);
  strokeCap(PROJECT);
  arc(x-2*w/3, y-w/3, 2*w/3, 2*w/3, HALF_PI, PI+HALF_PI, OPEN);
  arc(x-w/3, y-2*w/3, 2*w/3, 2*w/3, PI, TWO_PI, OPEN);
  strokeCap(SQUARE);
  line(x, y-2*w/3, x, y);
  line(x, y, x-2*w/3, y);
}

color get_rand_color() {
  int red = int(random(256));
  int green = int(random(256));
  int blue = int(random(256));
  return color(red, green, blue);
}

color get_heart_color() {
  int green = int(random(256));
  int blue = int(random(green, 256));
  int red = int(random(blue, 256));
  return color(red, green, blue);
}

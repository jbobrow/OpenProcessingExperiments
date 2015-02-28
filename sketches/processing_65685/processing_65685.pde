
float r;
float clockw=0;
float counterc=2;
void setup()
{
  size(400, 400);
  background(255);
  noStroke();
  fill(0);
  rectMode(CENTER);
  r = 0;
}

void draw()
{
  background(255);
  draw_rect(100, 100, #FF850A, clockw);
  draw_rect(100, 200, #00FFFF, counterc);
  draw_rect(100, 300, #FF00FF, clockw);
  draw_rect(200, 100, #FFFF00, counterc);
  draw_rect(200, 200, #00FF00, clockw);
  draw_rect(200, 300, #FF0000, counterc);
  draw_rect(300, 100, #0000FF, clockw);
   draw_rect(300, 200, #FF78FF, counterc);
   draw_rect(300, 300, #78FF78, clockw);

  r = r + 0.05;
}
//way should be either 0 or 2
void draw_rect(float x, float y, color col, float way) {
  fill(col);
  translate(x, y);
  rotate(r-(r*way));
  rect(0, 0, 60, 60);
  resetMatrix();
}


float counter_sin = 0;
float counter_x = 0;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  stroke(0);
  
  float sin_y = sin(counter_sin);
  //float pos_y = map(sin_y, -1, 1, -100, 100);
  //translate(counter_x, width/2);
  //point(0, sin_y);
  
  translate(counter_x, width/2+sin_y*100);
  point(0, 0);
  
  counter_sin += 0.1;
  counter_x += 1;
}

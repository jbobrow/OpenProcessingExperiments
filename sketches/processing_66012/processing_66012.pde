
float line_size,point_size,first_angle,total_length_x,total_length_y,length_x,length_y,i;

void setup()
{
  size(600,400);
  background(0);
  stroke(0,255,0);
  frameRate(20);
  noFill();
}

void draw()
{
  line_size = random(8);
  point_size = random(30,150);
  if (mousePressed == true)
  {
    draw_circle();
    draw_lines();
  }
}

void draw_circle()
{
  strokeWeight(line_size);
  ellipse(mouseX,mouseY,point_size,point_size);
}

void draw_lines()
{
  first_angle = random(TWO_PI / 3);
  total_length_x = point_size / 2;
  total_length_y = point_size / 2;
  i = 0;
  while (i < 5)
  {
    length_y = total_length_y * sin(first_angle);
    length_x = total_length_x * cos(first_angle);
    line(mouseX,mouseY,mouseX + length_x,mouseY + length_y);
    first_angle = first_angle + TWO_PI / 5;
    i += 1;
  } 
}



void setup()
{
  size(500, 500);
}

void draw()
{

  if (hour()>7 && hour()<20) background(255);
  else background(0);

  line(0, 110, 500, 390);
  translate(width/2, height/2);
  stroke(200); 
  noFill();
  ellipse(0, 0, 410, 410);


  pushMatrix();
  
  float h = map(hour(), 0, 24, 0, 360);
  rotate(radians(h));
  if (minute()<15)
    ellipse(0, 205, 25, 25);
  else if (minute()<30)
    ellipse(0, 205, 50, 50);
  else if (minute()<45)
    ellipse (0, 205, 75, 75);
  else 
    ellipse (0, 205, 100, 100);

  popMatrix();
}

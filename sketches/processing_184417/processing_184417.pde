
void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);
  stroke(255);
  line(width/6 - width/8, random(height - height + height/32, height/2-height/32), width/2 - width/32, random(height - height + height/32, height/2-height/32));
  line(width/2 + width/32, random(height - height + height/32, height/2-height/32), width - width/32, random(height - height + height/32, height/2-height/32));
  line(width/2 + width/32, random(height/2 + height/32, height - height/32), width - width/32, random(height/2 + height/32, height - height/32));
  line(width/6 - width/8, random(height/2 + height/32, height - height/32), width/2 - width/32, random(height/2 + height/32, height - height/32));
}



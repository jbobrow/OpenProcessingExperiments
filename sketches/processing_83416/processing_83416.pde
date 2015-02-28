
void setup()
{
 size(400, 600);
 background(random(255),random(255),random(255));
 smooth();
}

void draw()
{
  
 textSize(random(5,30));
 stroke(random(0,130),random(255),random(255));
 text(("merry christmas"),random(height),random(width));
}

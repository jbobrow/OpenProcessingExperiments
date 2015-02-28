
void setup()
{
  size(1366,768);
  smooth();
  frameRate(30);
}

void draw()
{
 noStroke();
 fill(0,(mouseY/5.35),(mouseX/5.35),20);
 rect(0,0,width,height);
 fill(random(height), (mouseX/5.35),(mouseY/5.35));
 //stroke(255,(mouseX/5.35),(mouseY/5.35));
 triangle(random(width),random(height),random(width),random(height),mouseX,mouseY);
if(mousePressed)
{
  fill(0,0,0,255);
 rect(0,0,width,height);
 fill(255,255,255,255);
 //fill(random(height), (mouseX/5.35),(mouseY/5.35));
 //stroke(255,(mouseX/5.35),(mouseY/5.35));
 triangle(random(width),random(height),random(width),random(height),mouseX,mouseY);
}
}

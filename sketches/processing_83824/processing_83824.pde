
void setup()
{
  size(1366,768);
  smooth();
  frameRate(30);
}
 
void draw()
{
 noStroke();
 fill(0,(mouseY/1.35),(mouseX/1.35),20);
 rect(0,0,width,height);
 fill(random(height), (mouseX/1.35),(mouseY/1.35));
 //stroke(255,(mouseX/5.35),(mouseY/5.35));
 triangle(random(width),random(height),random(width),random(height),mouseX,mouseY);
if(mousePressed)
{
  fill(226,226,226,5);
 rect(0,0,width,height);
 fill(226,226,226,226);
 //fill(random(height), (mouseX/5.35),(mouseY/5.35));
 //stroke(255,(mouseX/5.35),(mouseY/5.35));
 triangle(random(width),random(height),random(width),random(height),mouseX,mouseY);
}
}

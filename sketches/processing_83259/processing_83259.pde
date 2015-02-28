
void setup()
{
  size(1366,768);
  smooth();
  frameRate(60);
}

void draw()
{
 noStroke();
 fill(0,(mouseY/5.35),(mouseX/5.35),50);
 rect(0,0,width,height);
 fill(255,(mouseX/5.35),(mouseY/5.35));
 ellipse(mouseX,mouseY,100,100);
 stroke(255,(mouseX/5.35),(mouseY/5.35));
 strokeWeight(10);
 line(random(width),random(height),mouseX,mouseY);
 if(keyPressed)
 {
   textAlign(CENTER);
   textSize(36);
   text("Don't touch my keys, thanks.",683,384);
 }
if(mousePressed)
{
  textAlign(CENTER);
  textSize(36);
  text("\nAck, don't click my mouse please.", 683,384);
}
}

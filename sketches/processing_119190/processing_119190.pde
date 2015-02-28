
void setup()
{
    size(500,500);
    background(80);
    frameRate(20);
}

void draw()
{
  fill(40);
  background(0);
  ellipse(width/2, height/2, 350, 350);
  
  line(0,0,100,100);
  line(400,400,500,500);
  line(400,100,500,0);
  line(100,400,0,500);
  line(width/2,0,width/2,40);
  line(width/2,460,width/2,500);
  line(0,height/2,40,height/2);
  line(460,height/2,500,height/2);
  
  float rechteck = map(mouseX, 0, mouseY, 0, 2*PI);
  translate(width/2, height/2);
  rotate(rechteck);
  rectMode(CENTER);
  fill(0);
  rect(0,0,100,100);
  

  float linie = map(width/2, 0, height/2, 0, 2*PI);
  rotate(linie);
  stroke(0,236,255);
  line(0,0,150,150);  
}


void setup()
{
size(400, 600);
background(0,0,0);
smooth();
strokeWeight(5);
frameRate(5);
stroke(255,255,255);
textSize(36);
 textAlign(CENTER);
}

void draw()
{
 fill(160,152,152,100);
  rect(0,0,width,height);
 fill(255,0,0);
  point(random(400),random(600));
  point(random(400),random(600));
  point(random(400),random(600));
  point(random(400),random(600));
  point(random(400),random(600));
  point(random(400),random(600));
  point(random(400),random(600));
  point(random(400),random(600));
  point(random(400),random(600));
 fill(255,0,0);
 text("The\n Ohio-State-ment...\n 2012...\n 12-0!",200,50);
fill(108,61,2);
ellipse(mouseX, mouseY, 100, 50);
 fill(252,245,25);
line(200,600,200,350);
line(200,350, 350,350);
line(200,350, 50,350);
line(50,350, 50,150);
line(350,350, 350,150);
}

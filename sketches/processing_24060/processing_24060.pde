
int y = 0;
int direction = 1;
int x = 799;
int value = 0;

void setup() {
  size (800,800);
  frameRate(200);
}



void draw() {
background(204); // no trace


  fill(value);
ellipse(400, 400, 400, 400); // moon
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }






ellipse(mouseX, mouseY, 100, 100); // orbiting planet
fill(82, 82, 82, 50); // half moon colour (grey black)
arc(400, 400, 400, 400, HALF_PI, PI+HALF_PI);
fill(255, 255, 255, 50); // moon colour (white)
arc(400, 400, 200, 400, HALF_PI, PI+HALF_PI);


fill(151, 227, 220, 50); // triangle colour and transparency
triangle(mouseX, 500, mouseY, 200, mouseX, 800); // triangle prism

line (0, mouseY, 800, mouseX); // horizontal line
line (800, mouseY, 0, mouseY); // downwards diaganol line 1
line(800, mouseY, 0, mouseX); // downwards diaganol line 2
line(400, mouseY, 0, mouseX); // upper diagonal line 1
line(800, mouseX, 400, mouseY); // upper diagonal line 2

}
    




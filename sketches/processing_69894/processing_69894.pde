
float x = 480;
float y = 200;

int targetX = 480;
int targetY = 200;

int dia = 329;
int rad = dia/2;

PFont font;


void setup()
{
  size(980, 400);
  noStroke();
  smooth();
  
  background(255);
  font = loadFont("OstrichSansRounded-Medium-48.vlw");
  textFont(font);
}

void draw()
{
  
   
  background(255);
  
  fill(220,220,220);
  text("is everything.",targetX-80,targetY);
  ellipse(x,y,dia,dia);
  fill(255);
  text("interaction",x-80,y);
  
  
  if (mousePressed == true
        && mouseX < x + rad && mouseX > x - rad
          && mouseY < y + rad && mouseY > y - rad)
  {
   x = constrain(mouseX, rad, width - rad - 10);
   y = constrain(mouseY, rad, height - rad);
  }

  if (mousePressed && mouseX < 50 ||
         mousePressed && mouseX > width - 50 ||
          mousePressed && mouseY < 50 ||
            mousePressed && mouseY > height-50)
  {
    mousePressed = false;
  }

  else
  {
  x=lerp(x, targetX,0.04); 
  y=lerp(y, targetY,0.04);

  }
  
}



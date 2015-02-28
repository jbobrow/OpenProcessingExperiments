
float x;
float easing = 0.05;
PFont thefont;
 
void setup()
{
  size(800, 100);
  smooth();
  noStroke(); 
  thefont = loadFont("NewsGothicMT-Bold-50.vlw");
}

void draw()
{
  background(250,229,106);
 
  float targetX = mouseX;
  float remaining = (targetX - x);
 
  x+= remaining * easing;
  float y = constrain(mouseY, height/2, height/2);
  ellipse(x, y, 100, 100);
  
  textFont(thefont);
  textAlign(CENTER);
  text("Pot Au Feu", 400, 50);
  
}  





// initialisation
void setup()
{
  size(400,400);
  smooth();
  frameRate(30);
  background(255);
  
}

// dessin
void draw()
{
  float rayon = random(200);
  float valeur = random(255);
  stroke(random(20-255),random(50),random(60),20);
  fill(10,10,10);
  //noStroke();
  //noFill();
  line(mouseX,mouseY,50,50);
  line(mouseX,mouseY,350,350);
  line(mouseX,mouseY,50,350);
  line(mouseX,mouseY,350,50);
  noStroke();
  ellipse(mouseX,mouseY,5,5);
}
void mousePressed()
{
   saveFrame();
}




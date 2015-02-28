
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
background(0);
//mitte

noStroke();
fill(100);
ellipse(250, 250, 25, 25);
fill(255);
ellipse(250, 250, 15, 15);
fill(0);
ellipse(250, 250, 5, 5);

//unten rechts
noStroke(); 
fill(100);
ellipse(440, 360, 40, 40);
ellipse(440, 440, 40, 40);
ellipse(360, 440, 40, 40);
fill(53, 163, 229);
float xNeu = map(mouseX, 250, 0, 360, 0);
  ellipse(xNeu,xNeu,40,40);
  
//oben links
fill(100);
rect(40, 40, 40, 40);
rect(120, 40, 40, 40);
rect(40, 120, 40, 40);
fill(53, 163, 229);
float xNeu2 = map(mouseX, 250, 0, 120, 500);
  rect(xNeu2,xNeu2,40,40);
  
  //oben rechts
  fill(100);
  triangle(360, 40, 340, 80, 380, 80); 
  triangle(440, 40, 420, 80, 460, 80);
  triangle(440, 120, 420, 160, 460, 160);
  fill(53, 163, 229);
  float xNeu3 = map(mouseX, 250, 120, 120, 340);
  
  triangle(360,xNeu3,340,160,380,160);
  
  
  //unten links
  stroke(100);
  line(60, 340, 60, 380);
  line(60, 420, 60, 460);
  line(140, 420, 140, 460);
  stroke(53, 163, 229);
  float xNeu4 = map(mouseX, 250, 0, 140, 500);
  line(xNeu4, 340, 140, 380);
  
}

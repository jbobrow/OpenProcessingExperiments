
void setup()
{
  size(800, 600);
  smooth();
}

void draw()
{

  float colourRange = map(mouseX, 0, 800, 1, 255);
  background(0);

  stroke(colourRange, mouseY, 100);
  strokeWeight(4); // Stroke weight to 2 pixels

  fill(0);
  ellipse(200, 230, 330, 270); //Ears
  ellipse(600, 230, 330, 270); 


  ellipse(400, 400, 320, 320);//Head


  arc(400, 400, 290, 290, 0.08, 3.06); //Mouth

  arc(400, 410, 290, 20, 0.08, 3.06);


  ellipse(315, 340, 100, 100); //Eyes
  ellipse(485, 340, 100, 100);

  strokeWeight(6); // Stroke weight to 4 pixels

  line(282, 308, 347, 373); //Crosses in eyes
  line(347, 308, 282, 373);

  line(518, 308, 453, 373);
  line(453, 308, 518, 373);
}



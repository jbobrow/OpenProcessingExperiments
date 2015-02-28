
//Pat Luke Mooney
//7-31-2012
//Reproduction of Mondrian's "Composition in Blue and Red"

void setup()
{
  size(1024, 768);
  background(230);
  
  strokeWeight(15); //thickness for straight lines
  
  line(0, 128, 1024, 128);
  line(0, 340, 1024, 340);
  line(0, 650, 1024, 650);
  line(172, 0, 172, 768);
  line(340, 0, 340, 768);
  line(585, 0, 585, 768);
  line(888, 0, 888, 768);
  line(180, 555, 335, 555);
  
  noStroke(); //removes line thickness for colored quadrilaterals
  
  fill(255, 0, 0);
  rect(180, 136, 153, 197);
  
  fill(0, 0, 255);
  rect(592, 136, 289, 197);
  
  fill(255, 255, 0);
  rect(180, 562, 153, 81);
}

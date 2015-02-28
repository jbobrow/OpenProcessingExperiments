
float fill_1 = random(255);
float fill_2 = random(255);
float fill_3 = random(255);
float x;
float y;
float diameter = 150;

void setup()
{
  size(300,300);
  x = width / 2;
  y = width / 2;
}

void draw()
{ 
 
  fill(fill_1, fill_2, fill_3);
  ellipse(diameter, diameter, x, y);
  x = (width /2) + 100;
  y = (width /2) + 100;
  diameter = 150 + 100;
  ellipse(diameter, diameter, x, y);
  x = x / 2;
  y = y / 2;
  diameter = diameter / 2;
  ellipse(diameter, diameter, x, y);
  
  // three random shapes w/proportional scale
 fill(fill_1 + 50, fill_2 + 100, fill_3 + 150);
 triangle(0, width / 2, width / 2, 300, 0,300);
 fill(fill_1 + 100, fill_2 + 1150, fill_3 + 25);
 triangle(0 , width / 4, width / 4, 0, 0, 0 ); 
 fill(fill_1 + 50, fill_2 + 100, fill_3 + 150);
 triangle(width / 6, 0, 300, 0, 300, width / 6);
 
 // Lines
 fill(0);
 line(0, 150, 150, 150);
}



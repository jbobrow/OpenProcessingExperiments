
int diameter = 5;

void setup()
{
 size(300,300);
 noFill();
 frameRate(10);
}
void draw()
{
  if (diameter<200)
  stroke(0);
 ellipse(150,150,diameter,diameter);
 if (diameter<100);
 stroke(103,18,18);
 ellipse(80,80,diameter,diameter);
 if (diameter<180);
 stroke(29,119,191);
 ellipse(80,200,diameter,diameter);
 if (diameter<220);
 stroke(39,191,29);
 ellipse(220,80,diameter,diameter);
 if (diameter<110);
 stroke(214,240,56);
 ellipse(220,200,diameter,diameter);
 diameter = diameter + 10;
}




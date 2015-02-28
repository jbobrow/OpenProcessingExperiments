
void setup( )
{
  size(150, 150);
  background(255);
  smooth();

  ellipse(50, 60, 30, 30); // augen
  ellipse(70, 55, 30, 30);
  fill(255, 0, 0);//farbe der punkte
  ellipse(50, 60, 5, 5);  // punkte
  ellipse(67, 55, 5, 5); 
  noFill();//mund
  stroke(0);
  bezier(30, 105, 25, 125, 115, 125, 100, 85);

  stroke(0);//kopf
  strokeWeight(8);
  bezier(25, 40, 35, 60, 80, 40, 100, 30);

  strokeWeight(1);//Mundecken
  line(27, 103, 33, 104);
  line(98, 87, 102, 84);
}

                

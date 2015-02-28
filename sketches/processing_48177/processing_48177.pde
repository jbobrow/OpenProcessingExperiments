
void setup() {
  background(225, 225, 225);
  size(300, 300);
  smooth();

  //base faccia
  noStroke();
  fill(250, 130, 130);
  ellipse(150, 150, 180, 180);

  //occhio sx
  fill(255, 255, 255);
  ellipse(115, 162, 32, 32);
  //pupilla
  fill(0);
  ellipse(115, 154, 16, 16);

  //occhio dx
  fill(255, 255, 255);
  ellipse(186, 162, 32, 32);
  //pupilla
  fill(0);
  ellipse(186, 154, 16, 16);

  //bocca
  fill(140, 40, 40);
  ellipse(150, 220, 40, 40);

  fill(225, 225, 225); //copertura
  rect(0, 35, 300, 98);

  fill(250, 130, 130);
  arc(153, 91, 180, 180, radians(-140), radians(40));
}



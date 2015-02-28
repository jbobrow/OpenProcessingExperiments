
void setup()
{
  size(500, 500);
}

void draw()
{
  stroke(0);
  fill(0);
  ellipse(250, 150, 70, 80); // hoofd

  stroke(0);
  fill(200, 0, 0);
  rect(215, 135, 70, 15); // bandana

  stroke(0);
  fill(255); //kleur hoofd
  ellipse(240, 145, 15, 10); // linker oog

  fill(0);//kleur pupil
  ellipse(240, 145, 5, 5); //pupil linker oog

  stroke(0);
  fill(255);
  ellipse(260, 145, 15, 10); //rechter oog

  stroke(0);
  fill(0);
  ellipse(260, 145, 5, 5); //pupil rechter oog

  stroke(0);
  fill(255);
  ellipse(250, 170, 25, 7); // mond

  stroke(0);
  fill(0); //stomp kleur
  ellipseMode(CENTER);
  ellipse(250, 250, 100, 130); // stomp

  stroke(0);
  fill(255, 0, 0);
  rect(203, 265, 95, 10); // band (riem)

  stroke(0);
  fill(255, 0, 0);
  ellipse(230, 385, 30, 15); //linker schoen

  stroke(0);
  fill(0);
  ellipse(235, 335, 20, 100); //linker been

  stroke(0);
  fill(255, 0, 0);
  ellipse(275, 385, 30, 15); // rechter schoen

  stroke(0);
  fill(0);
  ellipse(270, 335, 20, 100); //rechter been

  stroke(0); //armen
  fill(255);
  line(260, 230, 100, 150);
  line(260,240,100,180);
  line(100,150,100,180);
  

}


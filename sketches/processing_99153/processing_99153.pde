
void setup()
{
  size(500, 600);
  background(31,18,180);
  smooth();
  frameRate(15);
}

void draw()
{ 

  fill(65, 183, 97);
  triangle(340, 400, 400, 350, 400, 450);
  triangle(180, 350, 230, 350, 230, 300);
  triangle(210,350,250,360,250,300);
  triangle(175,450,200,450,210,500);
  ellipse(200, 400, 300, 100);
  fill(255, 255, 255);
  ellipse(100, 390, 20, 20);
  fill(0, 0, 0);
  ellipse(99, 388, 10, 10);
  line(175,380 ,200,400);
  line(175, 420,200,400);
  line(165,380,190,400);
  line(165,420,190,400);
  line(185,380,210,400);
  line(185,420,210,400);
  fill(240,19,19);
  ellipse(50,400,12,10);
  ellipse(50,407,15,12);
  
  fill(31,18,180, 10);
  rect(0, 0, 2000, 600);
  fill( random(255), random(255), random(255), 70 );
  ellipse( mouseX, mouseY, 50, 50);
}

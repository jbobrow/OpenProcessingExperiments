
//John VanVliet
void setup()
{
  size(400,600);
  background(255,0,0);
  smooth();
}
void draw()
{
  strokeWeight(5);
  fill(0,255,0);
  rect(40,50,300,100);
  ellipse(192,250,200,200);
  rect(40,350,300,100);
  ellipse(80,190,20,20);
  ellipse(80,300,20,20);
  ellipse(300,300,20,20);
  ellipse(300,190,20,20);
  triangle(124,320,190,155,260,320);
  fill(0,0,0);
  rect(186,320, 10,20);
  fill(255,0,0);
textSize(25);
text("Merry Christmas!", 95,100);
text("Happy New Year!",95,400);
}
void Keypressed ()
{
  save ("snapshot.jpg");
}





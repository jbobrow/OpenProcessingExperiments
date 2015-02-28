
void setup()
{
  size( 400, 600 ) ;
  background( 255, 255, 255);
  smooth();
  frameRate(10);
}
void draw()
{
  strokeWeight(5);
  stroke(0, 255, 0);
  fill(255, 0, 0);
  rect( 10, 75, 200, 100 ) ;
  fill(0, 255, 255);
  rect(50, 100, 300, 200);
  noFill();
  rect(50,100,  200, 300);
  stroke(200,45,89);
  fill(35, 65, 200);
  ellipse(250, 300, 200, 200);
  stroke(134,5,255);
  rect( 90, 500, 55, 60);
  rect( 145, 450, 60, 85);
  stroke(90,150,200);
  fill( random(200), random(34), 90);
  ellipse(200,300, 100, 100);
  ellipse(300, 300, 100, 100);
  stroke(45,45, 45);
  fill(255,0,0);
ellipse(mouseX,mouseY,50,50);
text("Merry Christmas", 300, 500);
text("Merry Christmas", 300, 400);
text("Merry Christmas", 300, 90);
text("Merry Christmas", 300, 450);
text("Merry Christmas", 50, 450);
}
void mousePressed()
{
save("snapshot.png");
background(255,255,255);
}

  // dj E-Z ezezekiel



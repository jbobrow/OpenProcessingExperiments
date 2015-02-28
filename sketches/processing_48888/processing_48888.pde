
void setup()
{
  size(400, 600) ;
  background( 0, 255, 255) ;
  smooth();
  textAlign(CENTER) ;
  frameRate(50);
}

void draw()
{
  frameRate(5);
  fill(255, 255, 255, 100) ;
  rect(0, 0, width, height) ;
  fill(random(255),random(15),random(235)) ;
  textSize(random(8, 36)) ;
  text( "Merry Christmas!", random(400), random(600)) ;
  fill(0,255,0);
  triangle(200,100, 50,400, 350,400);
  fill(0,0,0);
  quad(175,400, 175,500, 225,500, 225,400);

}

void mousePressed()
{
  background(random(0), random(255), random(255));
}

void keyPressed()
{
  fill(random(255), random(255), random(255));
  save("snapshot.jpg");
}


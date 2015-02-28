
//Samantha G. Rotating Cube Dumb Rock Mods 14-15 10/05/12
PImage tongue;
int x = 300;
void setup() 
{
  background(0);
  size(500, 480, P3D);
  tongue = loadImage("http://sammiespagexd.bravesites.com/files/resized/47993/cropped/120;90;805163c06857ab7ccd4f7799577604aed330a842.png");
}
void draw ()
{
  background(107, 124, 149);
  //mouth
  smooth();
  strokeWeight(2);
  stroke(0);
  fill(107, 124, 149);
  arc(440, 330, 120, 145, PI/2, 3*PI/2);
  arc(60, 330, 120, 145, -PI/2, PI/2);
  fill(0);
  ellipse(250, 340, 260, 155);
  fill(255);
  rect(250,267,35,50);
  rect(210,267,35,50);
  image(tongue, mouseX, 350, 120, 160);

  //eyes
  point(50, 100, 200);
  stroke(0);
  translate(120, 170, 0);
  rotateX(mouseX);
  rotateY(mouseY);
  frameRate(5);
  fill(255);
  sphere(50);
  rotateY(-mouseY);
  rotateX(-mouseX);
  translate(-120, -170, 0);
  translate(360, 170, 0);
  rotateX(mouseX);
  rotateY(mouseY);
  sphere(50);
}

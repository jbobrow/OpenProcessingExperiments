
void setup()
{
  size(600, 400);
  background(0, 0, 0);
  smooth();
  textAlign(CENTER);
}
void draw()
{
  smooth();
  fill(201, 171, 20);
  triangle(0, 190, 630, 300, 600, 400);
  fill(57, 48, 5);
  stroke(57, 48, 5);
  triangle(50, 150, 25, 170, 75, 170);
  strokeWeight(8);
  fill(201, 171, 20);

  line(25, 170, 25, 188);
  strokeWeight(5);
  stroke(57, 48, 5);
  line(75, 195, 75, 170);
  stroke(255, 255, 0);
  // star
  fill(255,255,0);
  triangle(45, 20,30,50,60,50);
  triangle(45,70,30,40,60,40);
  
  
  strokeWeight(.1);
  fill(255,255,0,5);
  triangle(45,78,15,200,85,200);
  fill(230,0,0);
  textSize(25);
  text("Immanuel! Born in Bethlehem!",250,40);
}
void keyPressed()
{
  stop();
}



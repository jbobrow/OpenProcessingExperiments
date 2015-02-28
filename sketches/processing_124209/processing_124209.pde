
void setup()
{
  size(500,500);
  background(35,54,64);
  noStroke();
  fill(65,74,24);
  triangle(230,50,320,150,120,150);
  triangle(230,130,350,230,90,230);
  triangle(230,210,380,310,60,310);
  triangle(230,290,410,390,30,390);
  
  
  
  fill(5,5,5); 
  rect(200,390,60,70);
}
void draw()
{

  
  stroke(255,255,255,100);
  strokeWeight(5);
  point(random(width),random(height));
  }
  
 void mousePressed()
 {
 noStroke();
 fill(random(255),random(255),random(255));
 ellipse(mouseX, mouseY, 10,10);
 }

  
  

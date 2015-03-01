
void setup()
{
  size(500,500);
  background(0);
  //noFill();
  fill(255);
  stroke(0,0,0);
  
  smooth();
}

void draw()
{
  //translate(mouseX, mouseY);
  println(degrees(mouseX/100.0));
  translate(width/2,height/2);
  
  rotate(radians(millis())*10);
  rectMode(CENTER);
  triangle(0,0,0,50,25,50);
  //translate(0,50);
  triangle(50,100,50,50,25,50);
  //fill(255);
  //triangle(0,0,0,200,50,200);
  translate(50,50);
  triangle(50,100,50,50,25,50);
  translate(50,50);
  triangle(50,100,50,50,25,50);
  translate(50,50);
  triangle(50,100,50,50,25,50);
 
  
  //pushMatrix();
  //fill(200);
  //triangle(0,50,0,50,25,50);
  //popMatrix();
  
}

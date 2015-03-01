
void setup()
{
size (200,200);
frameRate(30);
}

void draw() 
{
  background(255);


  
  //cat face
fill(255); 

  strokeWeight (0);
  fill (202,200,193);
  ellipse (mouseX, mouseY, 60,45);
  beginShape(TRIANGLES);
  vertex(mouseX-15,mouseY-20);
  vertex(mouseX-25,mouseY-10);
      vertex(mouseX-30,mouseY-25);
      vertex(mouseX+33,mouseY-25);
  vertex(mouseX+18,mouseY-15);
      vertex(mouseX+28,mouseY-10);
  endShape();
  beginShape();
fill(0);
ellipse(mouseX-10,mouseY-5, 5,8);
ellipse(mouseX+10, mouseY-5, 5,8); 
 
}
  
void mousePressed () {
println("meow...feed me");
}



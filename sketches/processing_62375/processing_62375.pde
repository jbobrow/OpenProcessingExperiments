
void setup()
{
  size(1000, 800);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}
void draw()
{

  beginShape();
  fill(60, 70, 0);
  vertex(500, 500);
  vertex(600, 650);
  vertex(700, 670);
  vertex(650, 450);
  endShape(CLOSE);
  
  beginShape();
  fill(20, 70, 0);
  vertex(200, 150);
  vertex(300, 450);
  vertex(700, 670);
  vertex(650, 450);
  endShape(CLOSE);
  
   beginShape();
  fill(100, 50, 0);
  vertex(70, 850);
  vertex(90, 450);
  vertex(700, 670);
  vertex(750, 450);
  endShape(CLOSE);
  
   beginShape();
  fill(900, 50, 0);
  vertex(70, 850);
  vertex(90, 450);
  vertex(700, 670);
  vertex(20, 450);
  endShape(CLOSE);
  
   beginShape();
  fill(70, 20, 2);
  vertex(50, 950);
  vertex(90, 20);
  vertex(200, 50);
  vertex(20, 450);
  endShape(CLOSE);
  
   beginShape();
  fill(62, 7, 22);
  vertex(500, 900);
  vertex(20, 650);
  vertex(700, 670);
  vertex(650, 450);
  endShape(CLOSE);
  
  beginShape();
  fill(212, 219,248 );
  vertex(25, 50);
  vertex(90, 10);
  vertex(150, 50);
  vertex(125, 100);
  vertex (580, 298);
  endShape(CLOSE);
  

}


//void setup()
//{
//  size(400,200);
//  smooth();
//
//textAlign(CENTER);
//text("Merry Christmas!", 500,400);
//
//}







void setup () {
  size ( 800, 800);
  background (85, 180, 120);
  smooth(8);
}
void draw () {

  
  background(85, 180, 120);
  pushMatrix();
  if (mousePressed){

  background(mouseX/2, mouseX/10*mouseY/10, mouseY/6, random(0, 255));
     translate((mouseX-250)*random(-1, 1), (mouseY-200)*random(-1, 1) );
};


  translate(mouseX-250, mouseY-200 );
//draw a
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  triangle(50, 100, 25, 200, 75, 200);
  
  line(50, 100, 0, 300);
  line(50, 100, 100, 300);
  line(25, 200, 75, 200);
  fill(random(0, 100), random(0, 255), random(0, 100));
  ellipse(0, 300, 10, 10);
   fill(random(0, 100), random(0, 100), random(0, 255));
  ellipse(100, 300, 10, 10);
fill(random(0, 255), random(0, 100), random(0, 100));
  ellipse(50, 100, 10, 10);
   fill(random(0, 255), random(0, 100), random(0, 100));
  ellipse(50, 100, 10, 10);
 
  //draw +
  fill(mouseX/2, mouseX/5*mouseY/5, mouseY/2, random(0,255));
  line(200, 200, 300, 200);
  line(250, 100, 250, 300);
  
quad(225, 200, 250, 150, 275, 200, 250, 250);

ellipse(200, 200, 5, 5);
ellipse(300, 200, 5, 5);
ellipse(250, 100, 5, 5);
ellipse(250, 300, 5, 5);
//darw t
fill(mouseY/3, mouseX/2, mouseX+mouseY-77, random(0, 255));
  line(400, 100, 500, 100);
  line(450, 100, 450, 300);
  ellipse(400, 100, 10, 10);
  fill(mouseY/2, mouseX/3, mouseX+mouseY-100, random(0, 255));
  ellipse(500, 100, 10, 10);
  fill(mouseY/2, mouseX/2, mouseX+mouseY-150, random(0, 255));
  ellipse(450, 300, 10, 10);
  popMatrix();
  
}

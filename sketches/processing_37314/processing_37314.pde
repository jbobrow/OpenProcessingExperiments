
//LUIS ORTIZ



void setup()
{
  size(500, 500);
  smooth();
  noStroke();

}


void draw()
{
beginShape();
vertex(mouseX+20, mouseY+20);
vertex(mouseX+40, mouseY+20);
vertex(40, 40);
vertex(60, 40);
vertex(60, 60);
vertex(20, 60);
endShape(CLOSE);
 fill(random(255),random(255),random(255));
  rect(mouseX-20, mouseY-20, 20, 20);
  ellipse(mouseX-40,mouseY-40,20,20);
  ellipse(mouseX+20,mouseY+20,20,20);
  fill(random(255),random(255),random(255));


}


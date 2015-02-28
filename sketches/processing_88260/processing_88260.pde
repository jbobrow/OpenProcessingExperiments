
void setup() {
  size(400, 400);
} 

void draw() {
  background(56, 169, 242);
  ellipseMode(CENTER);//use center mode for all ellipses
  rectMode(CENTER);//use center mode for all rects

  stroke(255, 132, 0);
  line(0, 0, 400, 400);
  line(0, 400, 400, 0);

  noStroke();//no outline

    fill(12, 142, 1);//green fill
  ellipse(200, 200, 300, 300);//outer circle

  fill(255, 0, 0);//red fill
  rect(200, 200, 200, 200);//red square


  fill(255, 255, 0);//yellow fill
  ellipse(150, 200, 100, 50);//left
  ellipse(250, 200, 100, 50);//right
  ellipse(200, 150, 50, 100);//top
  ellipse(200, 250, 50, 100);//bottom

  fill(229, 0, 255);//purple fill
  ellipse(200, 200, 50, 50);//outer ellipse
  fill(255);//white fill
  ellipse(200, 200, 25, 25);//inner ellipse
  fill(255, 132, 0);//orange fill
  ellipse(200, 200, 12.5, 12.5);//innermost ellipse

  ellipse(100, 100, 20, 20);//top left ellipse
  ellipse(300, 100, 20, 20);//Top right ellipse
  ellipse(100, 300, 20, 20);//Bottom left ellipse
  ellipse(300, 300, 20, 20);//Bottom right ellipse
  
  fill(0,0,0,130);
  ellipse(mouseX, mouseY, 50, 50);
}









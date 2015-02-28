
void setup() {
  size(400, 400);
  background(56, 169, 242);
  smooth();
  frameRate(20);
} 

void draw() {
  background(56, 169, 242);
  ellipseMode(CENTER);//use center mode for all ellipses
  rectMode(CENTER);//use center mode for all rects
  noStroke();//no outline

    fill(12, 142, 1);//green fill
  ellipse(200, 200, 300, 300);//Green circle

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

  ellipse(mouseX-12.5, mouseY-12.5, 15, 15);//top left ellipse
  ellipse(mouseX+12.5, mouseY-12.5, 15, 15);//Top right ellipse
  ellipse(mouseX-12.5, mouseY+12.5, 15, 15);//Bottom left ellipse
  ellipse(mouseX+12.5, mouseY+12.5, 15, 15);//Bottom right ellipse

  fill(0, 0, 0, 130); //sets fill color to black with 130 opacity
  ellipse(mouseX, mouseY, 12.5, 12.5); //draws ellipse at where ever the mouse is and it's size is 50x50
}

void mousePressed() {
  fill(103,8,188);
  ellipse(mouseX-100, mouseY-100, 20, 20);//top left ellipse
  ellipse(mouseX+100, mouseY-100, 20, 20);//Top right ellipse
  ellipse(mouseX-100, mouseY+100, 20, 20);//Bottom left ellipse
  ellipse(mouseX+100, mouseY+100, 20, 20);//Bottom right ellipse
  
  fill(7,138,234);
  ellipse(mouseX-75, mouseY-75, 20, 20);//top left ellipse
  ellipse(mouseX+75, mouseY-75, 20, 20);//Top right ellipse
  ellipse(mouseX-75, mouseY+75, 20, 20);//Bottom left ellipse
  ellipse(mouseX+75, mouseY+75, 20, 20);//Bottom right ellipse
  
  fill(2,227,30);
  ellipse(mouseX-50, mouseY-50, 20, 20);//top left ellipse
  ellipse(mouseX+50, mouseY-50, 20, 20);//Top right ellipse
  ellipse(mouseX-50, mouseY+50, 20, 20);//Bottom left ellipse
  ellipse(mouseX+50, mouseY+50, 20, 20);//Bottom right ellipse
}

void keyPressed() {
  println("Danger Will Robinson");
}




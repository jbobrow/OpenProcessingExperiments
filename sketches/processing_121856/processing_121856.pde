
void setup() {
  size(500, 500);
}


void draw() {

  background(255);

  //lichaam
  fill(255, 255, 0);
  noStroke();
  ellipse(mouseX+75, mouseY, 150, 100);
  rect(mouseX, mouseY, 150, 200);

  //armen
  rect(mouseX-40, mouseY+130, 50, 20);
  rect(mouseX+140, mouseY+130, 50, 20);


  //streep
  fill(0);
  rect(mouseX, mouseY+30, 150, 20);


  //linkeroog
  stroke(0);
  fill(0);
  ellipse(mouseX+40, mouseY+40, 60, 60);
  fill(255);
  ellipse(mouseX+40, mouseY+40, 50, 50);
  fill(0);
  ellipse(mouseX+45, mouseY+45, 15, 15);


  //rechteroog

  fill(0);
  ellipse(mouseX+110, mouseY+40, 60, 60);
  fill(255);
  ellipse(mouseX+110, mouseY+40, 50, 50);
  fill(0);
  ellipse(mouseX+105, mouseY+45, 15, 15);

  //mond
  fill(255);
  ellipse(mouseX+75, mouseY+110, 100, 20);


  //benen
  noStroke();
  fill(255, 255, 0);
  rect(mouseX+35, mouseY+190, 20, 30);
  rect(mouseX+95, mouseY+190, 20, 30);


  //broek
  fill(0, 0, 225);
  rect(mouseX+25, mouseY+140, 100, 60);
  rect(mouseX, mouseY+130, 150, 30);


  //voeten
  fill(0);
  rect(mouseX+25, mouseY+210, 30, 20);
  rect(mouseX+95, mouseY+210, 30, 20);
}


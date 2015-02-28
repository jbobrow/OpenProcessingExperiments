
void setup() {
  //set the size of the window

  size(500, 500);
  smooth();
  frameRate(30);
}

void draw() {
background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  //Head
    fill(0);
  rect(mouseX, mouseY, 75, 75);
  
  fill(mouseY,0,mouseX+mouseY,mouseX);
  rect(mouseX, mouseY+20, 40, 20);

  //Eyes
  noStroke();
  fill(mouseX, mouseY, 0);
  ellipse(mouseX-15, mouseY-20, 15, 20);
  noStroke();
  fill(mouseX, mouseX*mouseY, mouseY);
  ellipse(mouseX+15,mouseY-20, 15, 20);

  //Body

  fill(0);
  rect(mouseX, mouseY+110, 20, 150);

  //Arms
  stroke(0);
  line(mouseX+100, mouseY+90, pmouseX-100, pmouseY+100);

  //Legs
  strokeWeight(abs(mouseX-pmouseX));
 
  line(mouseX-10, mouseY+185, pmouseX-10, pmouseY+345);
  line(mouseX+10, mouseY+185, pmouseX+10, pmouseY+345);

  //Feet
 // rect(mouseX-80, mouseY+345, 20, 10);
  //rect(mouseX+80, mouseY+345, 20, 10);
}

  //Print Output text
  
  void mousePressed(){
  println("ALL YOUR BASE ARE BELONG TO US!");
}


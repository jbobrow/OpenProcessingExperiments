

void setup(){
  size(500,500);
  background(255);
}


void draw(){
  background(mouseX,mouseY,mouseX);
  ellipseMode(CENTER);
  stroke(0);
  strokeWeight(5);
  fill(255,201,2);
  ellipse(250,250,350,350);


  ellipseMode(CENTER);
  stroke(0);
  fill(0);
  ellipse(300,170,40,70);

  ellipseMode(CENTER);
  stroke(0);
  fill(0);
  ellipse(200,170,40,70);

  noStroke();
  fill(255,201,2);
  triangle(230, 170, 150, 120, 230, 100);


  stroke(0);
  strokeWeight(5);
  line(150, 297, 350, 297);

  noStroke();
  fill(255,255,255);
  rect(217, 300, 30, 40);

  noStroke();
  fill(255,255,255);
  rect(260, 300, 30, 35);

}








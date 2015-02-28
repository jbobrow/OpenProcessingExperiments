
void setup(){
  size(250, 250);
  smooth();
  background(255);
  noFill();
  
  //Background Lines
  strokeWeight(30);
  line(230, 250, 230, 0);
  strokeWeight(20);
  line(200, 250, 200, 0);
  strokeWeight(15);
  line(180, 250, 180, 0);
  strokeWeight(10);
  line(160, 250, 160, 0);
  strokeWeight(5);
  line(140, 250, 140, 0);
  
  strokeWeight(30);
  line(20, 250, 20, 0);
  strokeWeight(20);
  line(50, 250, 50, 0);
  strokeWeight(15);
  line(70, 250, 70, 0);
  strokeWeight(10);
  line(90, 250, 90, 0);
  strokeWeight(5);
  line(110, 250, 110, 0);
  strokeWeight(3);
  line(125, 250, 125, 0);
  
  //Circles
  stroke(#74AC53);
  strokeWeight(15);
  ellipse(250, 0, 300, 300);
  ellipse(250, 0, 250, 250);
  ellipse(250, 0, 200, 200);
  ellipse(250, 0, 150, 150);
  ellipse(250, 0, 100, 100);
  ellipse(250, 0, 50, 50);
  
  stroke(#416728);
  strokeWeight(15);
  ellipse(0, 250, 300, 300);
  ellipse(0, 250, 250, 250);
  ellipse(0, 250, 200, 200);
  ellipse(0, 250, 150, 150);
  ellipse(0, 250, 100, 100);
  ellipse(0, 250, 50, 50);
  
  stroke(#D2EFC9);
  strokeWeight(5);
  ellipse(200, 200, 100, 100);
  ellipse(200, 200, 75, 75);
  ellipse(200, 200, 50, 50);
  ellipse(200, 200, 25, 25);
  
  stroke(#9ACD8E);
  strokeWeight(5);
  ellipse(50, 50, 100, 100);
  ellipse(50, 50, 75, 75);
  ellipse(50, 50, 50, 50);
  ellipse(50, 50, 25, 25);
  
  stroke(#11230B);
  strokeWeight(10);
  ellipse(125, 125, 200, 200);
  ellipse(125, 125, 150, 150);
  ellipse(125, 125, 100, 100);
  ellipse(125, 125, 50, 50);
  
 
  stroke(#416728, 150);
  fill(#D2EFC9);
}

void draw(){
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  ellipse(mouseX, mouseY, 25, 25);
}




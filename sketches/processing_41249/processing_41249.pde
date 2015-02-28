
float max_distance1;
float max_distance2;
float max_distance3;
float max_distance4;

void setup() {
  size(400, 400);
  background(0);
  smooth();
}

void draw() {
  noStroke();
  fill(255, 100);
  rect(0, 0, width, height);
  fill(0);
  ellipse(100, 100, 20, 20);
  ellipse(300, 100, 20, 20);
  ellipse(100, 300, 20, 20);
  ellipse(300, 300, 20, 20);



  //ellipse 100,100

    max_distance1 = dist(100, 100, mouseX, mouseY);
  max_distance2 = dist(300, 100, mouseX, mouseY);
  max_distance3 = dist(100, 300, mouseX, mouseY);
  max_distance4 = dist(300, 300, mouseX, mouseY);

  fill(0);   
  ellipse(100, 100, (2000/max_distance1), (2000/max_distance1) );
  ellipse(300, 100, (2000/max_distance2), (2000/max_distance2) );
  ellipse(100, 300, (2000/max_distance3), (2000/max_distance3) );
  ellipse(300, 300, (2000/max_distance4), (2000/max_distance4) );
}


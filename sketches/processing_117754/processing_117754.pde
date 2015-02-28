
float carHeight = 100;
float carWidth;
float number_to_sin = 0;
float number_to_sin2 = 10;
float angle = 0;


void setup() {
  size(300, 300);
  background(91, 195, 232);
  carWidth = carHeight*1.7;
  smooth();
}

void draw() {
  //grass
  noStroke();
  fill(177, 242, 66);
  rect(0, 215, width, height);

  //road
  noStroke();
  fill(145, 155, 153);
  rect(0, 225, width, height);

  //clouds
  noStroke();
  fill(255, 5);
  ellipse(mouseX, mouseY, 50, 50);
  fill(250, 5);
  ellipse(mouseX, mouseY, 70, 70);
  fill(200, 5);
  ellipse(mouseX, mouseY, 100, 100);

  float ellipse_width = sin(number_to_sin) * 65; 
  float x_value = sin(radians(number_to_sin)) * 65;
  float y_value = cos(radians(number_to_sin)) * 65; 

  x_value +=100;
  y_value +=100;

  float rect_width = sin(number_to_sin2) * width;
  float x_value2 = sin(radians(number_to_sin2)) * width;
  float y_value2 = cos(radians(number_to_sin2)) * width; 

  x_value2 +=100;
  y_value2 +=100;

  //sun 
  pushMatrix();
  strokeWeight(1.5);
  stroke(255, 172, 93);
  fill(255, 207, 13, 60);
  ellipse(230, 70, ellipse_width, ellipse_width);
  number_to_sin += .06;
  ellipse_width += 1;
  popMatrix();

  //road lines
  pushMatrix();
  noStroke();
  fill(246, 250, 56);
  rect(rect_width, 255, 25, 10);
  number_to_sin2 +=.5;
  rect_width += 1;
  popMatrix();

  //car top:
  noStroke();
  fill(255, 3, 95);
  ellipse(150, 200, carHeight, carHeight/1.23);
  fill(240, 179, 203, 213);
  ellipse(150, 200, 80, carHeight/1.5);

  //car body:
  fill(255, 3, 95);
  ellipse(150, 220, carWidth, carHeight/1.8); 

  //wheels/hubcaps 
  pushMatrix();
  translate (108, 242);
  rotate(angle);
  fill(255);
  ellipse(-1, -1, 40, 40);
  fill(255, 139, 170);
  ellipse(-1, -1, 20, 20);
  popMatrix();
  angle += .5;

  pushMatrix();
  translate (190, 242);
  rotate(angle);
  fill(255);
  ellipse(-1, -1, 40, 40);
  fill(255, 139, 170);
  ellipse(-1, -1, 20, 20);
  popMatrix();
  angle += .5;



  //sun rays 
  translate(230, 70);
  rotate(angle);
  stroke(245, 224, 104, 90);
  line(10, 10, 40, 40);
  angle +=1;
}

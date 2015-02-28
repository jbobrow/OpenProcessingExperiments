
void setup(){
  size(300,300);
  colorMode(HSB,100);
  noStroke();
  smooth();
  background(100);
}

float count = 100;  //controls the number of shapes
float circleSize;
float rectSize;

void draw(){
  if (count > 0) {
    circleSize = random(20,75);  //limits the size of circles
    fill(66,65,98,10);
    ellipse(random(width),random(height/2), circleSize, circleSize);  //limits the location of circles to the top half of drawing
  }
    if (count > 0) {
    circleSize = random(5,40);
    fill(66,65,98,20);
    ellipse(random(0,100),random(150,300), circleSize, circleSize);  //limits the location  of circles to first third of drawing in x axis and bottom half in y axis
  }
      if (count > 0) {
    circleSize = random(5,40);
    fill(66,65,98,20);
    ellipse(random(200,300),random(150,300), circleSize, circleSize);  //limits the location of circles to last third of drawing in x axis and bottom half in y axis
  }
  
  
  if (count > 0){
    rectSize = random(10,40);  //limits the size of rectangles
   fill(98,93,65,30);
  rect(random(0,300),random(150,300),rectSize,rectSize); //limits the location of rectangles to bottom haof of drawing
  }
    if (count > 0){
    rectSize = random(5,20);
   fill(98,93,65,30);
  rect(random(100,200),random(0,150),rectSize,rectSize); //limits the location of rectangles to middle third of drawing in x axis and top half in y axis
  }
  count--;
}


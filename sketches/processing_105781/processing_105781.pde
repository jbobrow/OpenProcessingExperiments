
float distancePoint;

void setup() {

  size(500, 500); 
   if (frame != null) {
    frame.setResizable(true);
  }
  smooth();
  noStroke();
  distancePoint = dist(120, 120, width, height);
}

void draw() {

  background(255,200,50);
  
  for (int a = 0; a<= width; a += 25) {

    for (int b = 0; b <= width; b +=25) {

      float size = dist(mouseX, mouseY, a, b);

      size = size/distancePoint * 30;

      rect(a, b, size, size);
    }
  }
  if (mouseX >= width/2) {
    fill(55,150,210);
  }else{
    fill(255);
  }
}

//random(255), random(255), random(255),random(255)




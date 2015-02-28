
// Cheese generator. Feel free to adjust the varying thickness, holes count, dimensions or colour range... and be aware, it may get spoiled in the end!

void setup() {
  size(600,600);
  noLoop();
}
void draw() {
  // Generate cheese dimensions and color
  float width = random(350,450),
        height = random(350,450),
        thickness = random(20,30),
        holes = random(5,15);
  
  // Generate cheese colour
  colorMode(HSB,360,100,100);
  color cheeseColor = color(random(32,56),random(70,95),random(85,100));
  
  // Draw cheese
  background(0,0,0);
  rectMode(CENTER);
  fill(cheeseColor);
  noStroke();
  rect(300,300,width, height);
  
  // Declare bottom left corner
  float     topSideCornerX = (300 - width/2),
            topSideCornerY = (300 - height/2),
            rightSideCornerX = topSideCornerX + width,
            rightSideCornerY = topSideCornerY,
            shift = sqrt((thickness * thickness)+(thickness * thickness));
  
  // Draw sides
  color topSide = color(hue(cheeseColor),saturation(cheeseColor),brightness(cheeseColor)-15),
        rightSide = color(hue(cheeseColor),saturation(cheeseColor),brightness(cheeseColor)-20),
        holeColor = color(hue(cheeseColor),saturation(cheeseColor),brightness(cheeseColor)-30);
  // Top side
  fill(topSide);
  quad(topSideCornerX, topSideCornerY, topSideCornerX + width, topSideCornerY, topSideCornerX + width + thickness, topSideCornerY - thickness, topSideCornerX + thickness, topSideCornerY - thickness);
  // Right side
  fill(rightSide);
  quad(rightSideCornerX, rightSideCornerY, rightSideCornerX, rightSideCornerY + height, rightSideCornerX + thickness, rightSideCornerY + height - thickness, rightSideCornerX + thickness, rightSideCornerY - thickness);
  fill(holeColor);
  // Draw Holes
  for(int i = 0; i < holes;  i++) {
    int radius = int(random(15,50));
    ellipse(random(width - radius*2) + radius + (300 - width/2), random(height - radius*2) + radius + (300 - height/2), radius, radius);
  }
  // Is the cheese spoiled?
  fill(0,0,100);
  if(round(random(1)) == 0) {
    // Yes, it's pretty old!
    for(int i = 0; i < random(10,40);  i++) {
      int radius = int(random(5,10));
      ellipse(random(width - radius*2) + radius + (300 - width/2), random(height - radius*2) + radius + (300 - height/2), radius, radius);
    }
  }
}





int diam = 30;

void setup(){
  size(700, 700);
  frameRate(1);
}

void draw(){
  
  background(map(mouseX, mouseY, random(0, 255), random(10, 100), random(200, 255)));
  noStroke();
  //circles drawn in a single line across the screen
//  for(int i = diam/2; i < width; i+=diam){ //increasing i by increment of diameter so circles don't overlap
//    ellipse(i, height/2, diam, diam); //(where we're drawing the x coordinate of the ellipse, where we're drawing the y coordinate
//    //of the ellipse, diameter, diameter)
//  }

//circles drawn in multiple lines across the screen:
  fill(0);
  for(int x = diam/2; x < width; x +=diam){
    for(int y = diam/2; y < height; y +=diam){
      int fillValue = int(map(y, diam/2, width, 0, 255)); //map function takes one range and maps it to another range that you tell it to
  //if you have a map function that returns a float and you need it to return an int, just wrap the function within int();
      fill(fillValue);
      ellipse(x, y, diam, diam);
    }
  }
  
  
}



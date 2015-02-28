
void setup()  {
  size(400, 400);
  colorMode(RGB,400);
  background(190,201,222);
  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw()  {  //set up grid for rectangles and circles
  for (int a=0; a<=width; a+=50)  {
    for (int b=0; b<=height; b+=50)  {
      rectangles(a, b);  circles(a, b);
    }
  }
 
noLoop();

}

void rectangles (float x, float y)  {
  pushMatrix();
  translate(0, 0);  //starts grid in corner
  noFill();
  strokeWeight(random(3));
  stroke(random(255));; 
  rect(x, y, 50, 10);  //draws rectangles from center at every 50 pixels in x & y axis
  popMatrix();
} 

void circles (float x, float y)  {
  pushMatrix();
  translate(0, 0);  //starts grid in corner
  strokeWeight(random(5));
  stroke(random(255));
  ellipse(x*2, y*2, 50, 50);  //draws circles from center every 100 pixels in x & y axis
  popMatrix();
}  
 



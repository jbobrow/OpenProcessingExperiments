
dflyWidth = 100; //Set intital dfly width
dflyHeight = 100; //Set intital dfly height
dflyX = 250; //Set initial x position
dflyY = 250; //Set initial y position

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(200,150,255);  //set background color
  smooth();
}

void draw() {  //draw function loops 
  //Body
  strokeWeight(3);
  fill(0,0,255);
  ellipse(dflyX,dflyY,dflyWidth/2,dflyHeight/2);

}

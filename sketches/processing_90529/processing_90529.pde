
/*
  circular widget for webpage
  interact with the widget with the mouse
  text icons on widget link to parts of the webpage
  */
float rads = 170;
float angle = 0;
float col = 0;
float col2 = 0;
float col3 = 0;


void setup(){
  size(400,400);
  smooth();
  noStroke();
  
  frameRate(30);
  
}

void draw(){

  background(125);
  drawPlanet(width/2, height/2);
  drawMoons(width/2, height/2, angle);
 
   //if mouse enters the planet, moons rotate in circular motion
  if(mouseY < 100 && mouseY > 300 || mouseX > 100 && mouseX < 300){
    angle = angle + 5;
  } 
}

void drawPlanet(float x, float y){

  ellipseMode(CENTER);
  
  //planet changes color when mouse enters the field 
  if(mouseY < 100 && mouseY > 300 || mouseX > 100 && mouseX < 300 ){
    fill(col = (col + 5) % 255, col2 = (col2 + 3) % 255, col3 = (col3 + 2) % 255);
    ellipse(x, y, 200, 200);
   } 
  ellipse(x,y,200,200);
}

// the outter moons rotate when mouse enters the planets field 
void drawMoons(float x, float y, float angle){
 
  float moveX = 200 + cos(radians(angle))*(rads);
  float moveY = 200 + sin(radians(angle))*(rads);
  
  float moveX2 = 200 + cos(radians(angle + 90))*rads;
  float moveY2 = 200 + sin(radians(angle + 90))*rads;
  
  float moveX3 = 200 + cos(radians(angle + 180))*rads;
  float moveY3 = 200 + sin(radians(angle + 180))*rads;
  
  float moveX4 = 200 + cos(radians(angle + 270))*rads;
  float moveY4 = 200 + sin(radians(angle + 270))*rads;
  
  float cenX = width/2;
  float cenY = height/2; 
  
  ellipseMode(CENTER);
  
  fill(angle % 255, angle % 130, angle % 200);
  ellipse(moveX, moveY, 50, 50);
  ellipse(moveX2, moveY2, 50, 50);
  ellipse(moveX3, moveY3, 50, 50);  
  ellipse(moveX4, moveY4, 50, 50);
}




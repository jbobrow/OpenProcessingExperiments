

int x = 500;
int y = 500;

void setup(){
  size(500, 500);
  background(229, 194, 141);
  ellipseMode(CENTER);
  frameRate(25);
 
}

void draw () {
  
//left eye, right eye 
noStroke();
 fill(#FAF8F5);
 ellipse(150, 250, 180, 150);
 ellipse(350, 250, 180, 150);


float x1 = map(mouseX, 0, width, 100, 200);
float y1 = map(mouseY, 0, height, 220, 290);
float x2 = map(mouseX, 0, width, 300, 400);
float y2 = map(mouseY, 0, height, 220, 290);


//left iris, right iris
  fill(81, 161, 222);
  ellipse(x1, y1, 50, 50);
  ellipse(x2, y2, 50, 50);
  fill(133, 187, 227);
  ellipse(x1, y1, 35, 35);
  ellipse(x2, y2, 35, 35);
  
    
//pupil
  fill(0);
  ellipse(x1, y1, 20, 20);
  ellipse(x2, y2, 20, 20);
  
 //nostrils
 ellipse (230, 360, 20, 12);
 ellipse (260, 360, 20, 12);
 
 
}







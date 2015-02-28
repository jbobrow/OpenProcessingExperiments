
/**
Yingying Yang
Creative Computing Section B
Wk 5 Assignment - Loop
*/

float angle;
  
void setup() {
  size(800,500);
  smooth();
  frameRate(200);
  background(255);
}

void draw() {
  background(255);
  float a = map(sin(angle),-1,1,0,height); //for movement of top row
  float b = map(cos(angle),-1,1,0,height); //for movement of bottown row
  for (int i = 0; i <= width; i = i + 200){ //repeating the lines for entire width of screen
    strokeCap(ROUND);
    strokeWeight(80);
    stroke(map(mouseX,0,width,100,200),map(mouseY,0,width,100,200),map(i,0,width,100,200)); //changing color gradient with movement of mouse
    line(i,height,i,a); //bottom row
    line(i+100,0,i+100,b); //top row
    angle += 0.0025; 
  }
}



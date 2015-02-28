
int x = 200;
int y = 200;
int z = 100;
int a = 20;
 
void setup() {
  size(500,500);
  smooth();
  ellipseMode(CENTER);
  frameRate(30);
}

void draw() {
  background(0);
 line(100,400,300,400);
 ellipse(250,250, 300, 500);
  ellipse(190, 240, z, z);
  ellipse(310, 250, z, z);
  
float x1 = map(mouseX, 0, width, 145, 195);
float y1 = map(mouseY, 0, height, 225, 275);
float x2 = map(mouseX, 0, width, 305, 355);
float y2 = map(mouseY, 0, height, 225, 275);
    
  fill(150, 0, 0);
  ellipse(x1, y1, 35, 35);
  ellipse(x2, y2, 35, 35);
    
  fill(255);
  ellipse(x1, y1, 10, 10);
  ellipse(x2, y2, 10, 10);
   if(mousePressed)                   
  fill(0);
  ellipse(x1, y1, 20, 40); 
  ellipse(x2, y2, 20, 40);

}

  





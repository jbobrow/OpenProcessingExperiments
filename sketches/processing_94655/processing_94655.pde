
int x = 400;
int y = 300;
int pup = 10;
int iris = 25;
int i = 50;
int wid = 80;
int r = 216;
int g = 110;
int b = 28;  


void setup() {
  size(400,300);
  smooth();
  ellipseMode(CENTER);
  frameRate(20);
}

void draw() {
  background(r,g,b);
 
//Eyes
  noStroke();
  fill(255, 255, 255);
  ellipse(x/2 - 30, y/2, wid, i);
  ellipse(x/2 + 30, y/2, wid, i);
float x1 = map(mouseX, 0, width, 145, 190);
float y1 = map(mouseY, 0, height, 140, 162);
float x2 = map(mouseX, 0, width, 210, 255);
float y2 = map(mouseY, 0, height, 140, 162);
  
//iris  
  
  fill(37, 80, 245);
  ellipse(x1, y1, iris, iris);
  ellipse(x2,y2, iris, iris);
  
//pupil
  fill(0);
  ellipse(x1, y1, pup, pup);
  ellipse(x2, y2, pup, pup);
  fill(255,255,255);
  ellipse(x1+3, y1-3, 5, 5);
  ellipse(x2+3, y2-3, 5, 5);


//brows
  stroke(0);
  strokeWeight(5);
  line(140, 120, 195, 120);
  line(205, 120, 255, 120);
  

if (mouseX > width/3 && mouseY< height/2){
   stroke(r,g,b); 
   line(205, 120, 255, 120);
   
   stroke(0);
   line(210,120, 235, 105);
   line(235,105, 260,120);
  }
}

void mousePressed(){
float x1 = map(mouseX, 0, width, 145, 190);
float y1 = map(mouseY, 0, height, 140, 162);
float x2 = map(mouseX, 0, width, 210, 255);
float y2 = map(mouseY, 0, height, 140, 162);
  
  fill(r,g,b);
  noStroke();
  ellipse(x/2 - 30, y/2, wid, i);
  ellipse(x/2 + 30, y/2, wid, i);
  ellipse(x1, y1, iris, iris);
  ellipse(x2,y2, iris, iris);
  ellipse(x1, y1, pup, pup);
  ellipse(x2, y2, pup, pup);
  ellipse(x1+3, y1-3, 5, 5);
  ellipse(x2+3, y2-3, 5, 5);
  
  stroke(255,255,255);
  strokeWeight(10);
  line(x/2-65, y/2, x/2-3, y/2);
  line(x/2+3, y/2, x/2+60, y/2);
  
}






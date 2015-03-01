
float circle_x =200;
float circle_y =100;
int height=400;
int width=400;

void setup() {
  size(400, 400);
}

void draw() {
  background(0);
  fill(255);
  rect(30, 30, 340, 340);
  
  fill(random(255),random(255),random(255));
  rect(30, 30,70, 70);
  fill(255);
  rect(30, 30, 40, 40);
  
  fill(random(255),random(255),random(255));
  rect(300, 30,70, 70);
  fill(255);
  rect(330, 30, 40, 40);
  
  fill(random(255),random(255),random(255));
  rect(30, 300,70, 70);
  fill(255);
  rect(30, 330, 40, 40);
  
  fill(random(255),random(255),random(255));
  rect(300, 300,70, 70);
  fill(255);
  rect(330, 330, 40, 40);
 
  
  fill(random(255),random(255),random(255));
  quad(200,0,0,200,200,400,400,200);
  fill(random(255),random(255),random(255));
  rect(50,50,300,300);
  fill(255);
  quad(200, 30, 30, 200, 200,370,370, 200);
  fill(random(255),random(255),random(255));
  quad(200, 130, 130, 200, 200,270,270, 200);
  fill(255);
  rect(165, 165, 70, 70);
  fill(random(255),random(255),random(255));
  quad(200, 165, 165, 200, 200,235,235, 200);
  fill(random(255),random(255),random(255));
  noStroke();
  circle_x=circle_x-1;
  circle_y=circle_y+1;
  ellipse(circle_x, circle_y, 35, 35);

//1
if (circle_x<width/2)
if(circle_y<height/2){
circle_x=circle_x-1;
circle_y=circle_y+1;
}

//2
if (circle_x<width/2)
if(circle_y>height/2){
circle_x=circle_x+4;
  circle_y=circle_y+2;
}
//3
if (circle_x>width/2)
if(circle_y>height/2){
circle_x=circle_x+4;
  circle_y=circle_y-4;
}
//4
if (circle_x>width/2)
if(circle_y<height/2){
  circle_x=circle_x-2;
  circle_y=circle_y-4;
}
}
//click
  void mousePressed() {
    circle_x =200; 
    circle_y =100;
    fill(255);
  }


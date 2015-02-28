
float circle_x=0;

void setup(){
  size(400,400);
  noStroke();
  frameRate(9000);
}
void draw() {
  background(0);
  
 fill(255,0,0);
  ellipse(circle_x,50,25,25);
  circle_x = circle_x + .5;
 
 fill(255,159,13);
  ellipse(circle_x,100,25,25);
  circle_x = circle_x + .5;
  
  fill(255,239,0);
  ellipse(circle_x,150,25,25);
  circle_x = circle_x + .5;
  
  fill(0,255,0);
  ellipse(circle_x,200,25,25);
  circle_x = circle_x + .5;
  
  fill(0,0,255);
  ellipse(circle_x,250,25,25);
  circle_x = circle_x + .5;
  
  fill(149,3,255);
  ellipse(circle_x,300,25,25);
  circle_x = circle_x + .5;
  
  //NEW ROW
  
  fill(206,2,2);
  ellipse(circle_x,50,25,25);
  circle_x = circle_x + 1;
  
  fill(227,140,0);
  ellipse(circle_x,100,25,25);
  circle_x = circle_x + 1;
  
  fill(245,229,3);
  ellipse(circle_x,150,25,25);
  circle_x = circle_x + 1;
  
  fill(2,214,0);
  ellipse(circle_x,200,25,25);
  circle_x = circle_x + 1;
  
  fill(0,1,188);
  ellipse(circle_x,250,25,25);
  circle_x = circle_x + 1;
  
  fill(91,0,162);
  ellipse(circle_x,300,25,25);
  circle_x = circle_x + 1;
 
 if(circle_x > 400){
   circle_x = 0;
}
}


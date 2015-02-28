
float y = 50.0; //y position variable
float speed = 20; //value for speed
float radius = 1.0; //value for circle size

void setup(){
  size(250, 250);
  smooth();
  noStroke();
  ellipseMode(RADIUS);}
  
void draw(){
  fill(0, 12);
  rect(0, 0, width, height);
  fill(#29C100);
  ellipse(20, y, radius, radius);
  ellipse(67, y, radius, radius);
  ellipse(1, y, radius, radius);
  ellipse(54, y, radius, radius);
  ellipse(217, y, radius, radius);
  ellipse(100, y, radius, radius);
  ellipse(245, y, radius, radius);
  ellipse(230, y, radius, radius);
  ellipse(200, y, radius, radius);//green dots
  fill(#EDFF00);
  ellipse(48, y, 1.8, 1.8);
  ellipse(33, y, 1.8, 1.8);
  ellipse(84, y, 1.8, 1.8);
  ellipse(216, y, 1.8, 1.8);
  ellipse(170, y, 1.8, 1.8);//yellow dots
  fill(#00FFCE);
  ellipse(185, y, 2.3, 2.3);
  ellipse(5, y, 2.3, 2.3);
  ellipse(240, y, 2.3, 2.3);
  ellipse(75, y, 2.3, 2.3);//teal dots
  //if(y>height -radius){  //if the object goes off screen
   //without the if line, it wouldn't be continuous
  if (y > 250){ //this is how far it will travel down
   y= -10;} //this is where the ball starts to fall
  y += speed;}
//this is the falling white ball with a stream
//background darkens

// || means and






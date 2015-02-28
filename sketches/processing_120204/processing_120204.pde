
float ellipse_x = 150;
float ellipse_y = 70;
float ellipse2_x = 100;
float ellipse2_y = 100;

/*
setup(): 
    
      sets up the window and original background
*/
void setup() 
{
 background(#00ffff);
  size(400,400);
  frameRate(10);
}

void make_cloud1(){

if(random(100) > 50) {
  fill(#ffff00);
  ellipse(ellipse_x, ellipse_y, 70, 40);
}
}

void make_cloud2()
{
if(random(100) > 50) {
  fill(#FFFFFF);
  ellipse(ellipse2_x, ellipse2_y, 70, 40);
  }
  }

void draw_grass_and_sky() {

// draw grass
  fill(#00ff00);
  rect(0,310,400,400);
  }
  
  void draw_stickMan() {
  
  if(random(100) > 60) {
  
  offset = -40;
  }
  
  else {
  
  offset = 0;
  }
  
  // draw head
  ellipse(50, 280 + offset, 10, 10);
  
  
  // draw body
  line(50,285 + offset,50, 310 + offset);
  
  // draw right leg
  line(50,310 + offset,55, 325 + offset);
  
  // draw left leg
  line(50,310 + offset,45, 325 + offset); 
  
  // draw right arm
  line(50,290 + offset,64, 300 + offset);
  
  // draw left arm
  line(50,290 + offset,45, 305 + offset);
  }
  
  void change_location() {
  
  ellipse_x = random(350);
  ellipse2_x = random(350);
  
void draw() { 
background(#00ffff);

draw_grass_and_sky();
draw_stickMan();
make_cloud1();
make_cloud2();
change_location();
}

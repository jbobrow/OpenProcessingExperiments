
float y = 50.0;
float speed = 1.0;
float radius = 15.0;

void setup() {
  size(400, 400);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
}


void draw() {
  fill(214, 239, 250);
rect(0, 0, 1500, 25);
fill(214, 237.5, 250);
rect(0, 25, 1500, 25);
fill(214, 236, 250);
rect(0, 50, 1500, 25);
fill(214, 234.5, 250);
rect(0, 75, 1500, 25);
fill(214, 233, 250);
rect(0, 100, 1500, 25);
fill(214, 231.5, 250);
rect(0, 125, 1500, 25);
fill(214, 230, 250);
rect(0, 150, 1500, 25);
fill(214, 228.5, 250);
rect(0, 175, 1500, 25);
fill(214, 227, 250);
rect(0, 200, 1500, 25);
fill(214, 225.5, 250);
rect(0, 225, 1500, 25);
fill(214, 224, 250);
rect(0, 250, 1500, 25);
fill(214, 222.5, 250);
rect(0, 275, 1500, 25);
fill(214, 220, 250);
rect(0, 300, 1500, 25);
fill(214, 219, 250);
rect(0, 325, 400, 25); 
fill(214, 217,250);
rect(0, 350, 400, 25);
fill(214, 215, 250);
rect(0, 375, 400, 25);
fill(214, 212, 250);
rect(0, 400, 400, 25);

    //main cloud
    fill (255, 255, 255);
  ellipse(200, y+5, radius+30, radius);
  ellipse(150, y+15, radius+50, radius);
  ellipse(250, y+15, radius+40, radius);
  ellipse(240, y, radius+20, radius);
  ellipse(200, y+20, radius+45, radius);
  //small cloud left
  ellipse (50, y-100, radius+60, radius);
  ellipse (70, y-115, radius +15, radius);
  ellipse(40, y-120, radius+20, radius);
  ellipse (340, y+100, radius+60, radius);
  ellipse (360, y+85, radius +15, radius);
  ellipse(330, y+80, radius+20, radius);
  //small cloud right
  ellipse (300, y-150, radius+50, radius);
  ellipse(310, y-165, radius+15, radius);
  ellipse(280, y-165, radius+10, radius);
  ellipse (100, y+170, radius+50, radius);
  ellipse(110, y+155, radius+15, radius);
  ellipse(80, y+155, radius+10, radius);
  //top and bottom cloud
  ellipse (100, y-280, radius+50, radius);
  ellipse(115, y-295, radius+15, radius);
  ellipse(90, y-290, radius+10, radius);
  ellipse (300, y+280, radius+50, radius);
  ellipse(315, y+265, radius+15, radius);
  ellipse(300, y+260, radius+10, radius);
  //tippy tippy top cloud
  ellipse(375, y-325, radius+5, radius); 
  ellipse(360, y-315, radius+35, radius);
  ellipse(350, y-320, radius+5, radius);
  ellipse(75, y+325, radius+5, radius); 
  ellipse(60, y+335, radius+35, radius);
  ellipse(50, y+330, radius+5, radius);

  y = y + speed;
  if (y > height-radius-20) { 
    speed = -1.0;
  }
  if (y < 0 + radius) {
    speed = 1;
  }
}





float circle_x = 500;
float circle_y = 200;
float circle_speed_x = -5;
float circle_speed_y = -3;


int radius=40;


void setup(){
  size (500, 500);

}

void draw (){

circle_x = circle_x + circle_speed_x;
circle_y = circle_y + circle_speed_y;

background(255,255,255);
noStroke();
ellipse(circle_x,circle_y,radius,radius);
  
  radius--;
  
  radius=constrain(radius,20,80);
  
  //circle_y is top
  if (circle_y < 0){
    circle_speed_y=5;
radius=80;
noStroke();
fill(random(213), random(54), random (234));

}

 //if circle_y is off the bottom
 if (circle_y > height) {
   circle_speed_y=-9;
radius=80;
  noStroke();
  fill(random(43), random(203), random(175));

   
}

// if circle_x is off the left
if (circle_x < 0){
  circle_speed_x=15;
radius=80;
noStroke();
fill(random(117), random(234), random(54));

}

//if circle_x is off right
if (circle_x > width){
  circle_speed_x=-2;
  radius=80;
noStroke();
fill(random(54), random(185), random(234));
}
}

void mousePressed(){
circle_x=mouseX;
circle_y=mouseY;
noStroke();
fill(random(209), random(19), random(240));
}


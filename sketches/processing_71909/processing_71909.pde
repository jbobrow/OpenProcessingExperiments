
//JanLuca Berger
//Creative Computing
//Bouncing Assignment
//September 24th
int circle_x = 220;
int circle_y = 120;
int circle_radius = 40;
int circle_x_speed = 30;
int circle_y_speed = 20;


int circle2_x = 210;
int circle2_y = 300;//
int circle2_radius = 60; 
int circle2_x_speed = 20;
int circle2_y_speed = 40;

float r = 40;
float angle = 0.0;



PShape network;

void setup() {
size(500, 500, P2D);
smooth();
network = loadShape("network.svg");
}
void draw() {
//background(75);
smooth();
shape(network, 0, 000,500 ,500);


noStroke();
//fill(221,229,210);
fill(133,132,155);

ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  circle_x = circle_x + circle_x_speed;
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) {
    circle_x_speed = circle_x_speed * -1;   
  };
  circle_y = circle_y + circle_y_speed;
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {

    circle_y_speed = circle_y_speed * -1;
  }


//fill(229,212,167);
fill(211,232,228);

ellipse(circle2_x, circle2_y, circle2_radius*2, circle2_radius*2);
  circle2_x = circle2_x + circle2_x_speed;
  if ((circle2_x + circle2_radius > width) || (circle2_x - circle2_radius < 0)) {
    circle2_x_speed = circle2_x_speed * -1;   
  };
  circle2_y = circle2_y + circle2_y_speed;
  if ((circle2_y + circle2_radius > height) || (circle2_y - circle2_radius < 0)) {

    circle2_y_speed = circle2_y_speed * -1;
  }

//fill(94,170,147);
//rotate(r);
//r = r + 0.2;
//rect(mouseX,mouseY,20,60);





//fill(94,170,147,20);

//fill(32,252,0,100);
fill(100,52,124,100);
translate(mouseX,mouseY);
rotate(angle);
angle +=0.07;
rect(-15,-15,1200,30);



}


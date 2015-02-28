
float e_x = 100;
float e_y = 350;

float e_x2 = 80;
float e_y2 = 300;

float e_x3 = 150;
float e_y3 = 200;

float e_x4 = 50;
float e_y4 = 100;

void setup(){
  size(400,700);
  background(0);
}

void draw() {
 
 fill(180,42,188,50); 
 ellipse(e_x,e_y,50,50);
 e_y = e_y + (mouseY - e_y)/25.0;
 e_x = e_x + (mouseX - e_x)/25.0;
 
 ellipse(e_x2,e_y2,25,25);
 e_y2 = e_y2 + (mouseY - e_y2)/55.0;
 e_x2 = e_x2 + (mouseX - e_x2)/55.0;
 
 ellipse(e_x3,e_y3,40,40);
 e_y3 = e_y3 + (mouseY - e_y3)/45.0;
 e_x3 = e_x3 + (mouseX - e_x3)/45.0;
 
  ellipse(e_x4,e_y4,30,30);
 e_y4 = e_y4 + (mouseY - e_y4)/35.0;
 e_x4 = e_x4 + (mouseX - e_x4)/35.0;
}

void mouseClicked(){
  background(0);
}


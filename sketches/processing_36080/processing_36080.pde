
float e_x = 100;
float e_y = 350;

float e_x2 = 80;
float e_y2 = 300;

float e_x3 = 150;
float e_y3 = 200;

float e_x4 = 50;
float e_y4 = 100;

float e_x5 = 100;
float e_y5 = 350;

float e_x6 = 80;
float e_y6 = 300;

float e_x7 = 150;
float e_y7 = 200;

float e_x8 = 50;
float e_y8 = 100;

void setup(){
  size(400,700);
  background(0);
}

void draw() {
  
 ellipse(e_x,e_y,50,50);
 e_y = e_y + (mouseY - e_y)/25.0;
 e_x = e_x + (mouseX - e_x)/25.0;
 
 ellipse(e_x2,e_y2,25,25);
 e_y2 = e_y2 + (mouseY - e_y2)/50.0;
 e_x2 = e_x2 + (mouseX - e_x2)/50.0;
 
 ellipse(e_x3,e_y3,15,15);
 e_y3 = e_y3 + (mouseY - e_y3)/15.0;
 e_x3 = e_x3 + (mouseX - e_x3)/15.0;
 
 ellipse(e_x4,e_y4,30,30);
 e_y4 = e_y4 + (mouseY - e_y4)/35.0;
 e_x4 = e_x4 + (mouseX - e_x4)/35.0;
 
 ellipse(e_x5,e_y5,5,5);
 e_y5 = e_y5 + (mouseY - e_y5)/55.0;
 e_x5 = e_x5 + (mouseX - e_x5)/55.0;
 
 ellipse(e_x6,e_y6,45,45);
 e_y6 = e_y6 + (mouseY - e_y6)/45.0;
 e_x6 = e_x6 + (mouseX - e_x6)/45.0;
 
 ellipse(e_x7,e_y7,18,18);
 e_y7 = e_y7 + (mouseY - e_y7)/5.0;
 e_x7 = e_x7 + (mouseX - e_x7)/5.0;
 
 ellipse(e_x8,e_y8,29,29);
 e_y8 = e_y8 + (mouseY - e_y8)/60.0;
 e_x8 = e_x8 + (mouseX - e_x8)/60.0;
}


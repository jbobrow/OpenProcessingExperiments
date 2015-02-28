
float e_x = 100;
float e_y = 350;

float e_x2 = 80;
float e_y2 = 300;

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
}


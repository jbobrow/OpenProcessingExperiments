
float ellx = 100;
float elly = 350;

float e_1width = 50;
float e_1height = 50;

float e_2width = 70;
float e_2height = 70;

void setup(){
  size(400,700);
}

void draw() {
  background(0);
  
   ellipse(ellx,elly,50,50);
 elly = elly + (mouseY - elly)/25.0;
 ellx = ellx + (mouseX - ellx)/25.0;
  
  if (mouseButton == LEFT) {
    ellipse(mouseX,mouseY,e_1width,e_1height);
  } else if (mouseButton == RIGHT) {
    ellipse(mouseX,mouseY,e_2width,e_2height);
  } else {
    fill(126);
  }
}

/*void mousePressed() {
  if (mouseButton == LEFT) {
    ellipse(50,50,50,50);
  } else if (mouseButton == RIGHT) {
    ellipse(70,70,70,70);
  } else {
    fill(126);
  }
}*/


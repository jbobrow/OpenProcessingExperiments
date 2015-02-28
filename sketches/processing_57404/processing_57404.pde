

float r = random(0, 255);
float g = random(0, 255);
float b = random(0,255);


void setup() {
  size(900, 200);
  background(70, 4, 137);
  smooth();

}

void draw() {
 noStroke();

  fill(r, g, b);
 //}
  quad(50, 50, 150, 150, 30, 150, 50, 170);
  
  quad(250, 50, 330, 130, 210, 130, 250, 170);    

  quad(450, 50, 510, 110, 390, 110, 450, 170);

  quad(650, 50, 690, 90, 570, 90, 650, 170);

  quad(850, 50, 870, 70, 750, 70, 850, 170);
 

  
}


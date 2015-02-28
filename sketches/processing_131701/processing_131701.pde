
void  setup() {
  
  size(400,400);

  
}

  int gatesOpen = 0;
  int plantAlpha = 0;
  int mouseR = 0;
  int mouseG = 0;
  int mouseB = 0;
  int plantHeight = 400;
  int plantR = 0;
  int plantG = 0;
  int plantB = 0;
  int plantGrowth = 0;
  
void draw() {
  
int gatespace1 = 200 + (gatesOpen/2);
int gatespace2 = 200 - (gatesOpen/2);
int mouseR = 255 - constrain(mouseX, 0, 137);
int mouseG = 255 - constrain(mouseX, 0, 203);
int mouseB = 255 - constrain(mouseX, 0, 241);
int plantR = 255 - constrain(mouseX - 150, 0, 242);
int plantG = 255 - constrain(mouseX - 150, 0, 158);
int plantB = 255 - constrain(mouseX - 150, 0, 242);

background(0,0,0);

//new background
fill(60, 13, 97, (mouseX - 245));
quad(0,0, 400, 0, 400, 400, 0, 400);

//plant
stroke(plantR, plantG, plantB);
fill(plantR, plantG, plantB);
triangle(400, 150, 400, 250, plantHeight, 200);
triangle(400, 150, 400, 250, plantHeight, 200 - plantGrowth);
triangle(400, 150, 400, 250, plantHeight, 200 + plantGrowth);

//flower pot
stroke(mouseR, mouseG, mouseB);
fill(mouseR, mouseG, mouseB);
line(200,0,gatespace1,gatespace2);
line(200,400,gatespace1,gatespace1);
quad(gatespace1, gatespace2, gatespace1, gatespace1, 400, 300, 400, 100);

if (mouseX >150){
  gatesOpen = (mouseX - 150) + 0;
  plantHeight = 400 - (mouseX - 100);
  plantGrowth = 0 + constrain(mouseX, 0, 30);
}

  
}


//Using static numbers - Simple
int x1;
int y1;
int x2;
int y2;

void setup() {
  size(500, 500);
  background(0);
  x1 = 50;
  y1 = 200;
  x2 = 50;
  y2 = 200;
  
}
void draw () {
  stroke (random (255), random (255), random (255)); // line changing colors
  line (50, random (x1, y1), 225, random (x2, y2)); // 1st top box
  line (50, random (x1 + 300, y2 + 275), 225, random (x2 + 300, y2 + 275)); // 3rd bottom box
  line (275, random (x1, y1), 450, random (x2, y2)); //2nd top box
  line (275, random (x1 + 300, y2 + 275), 450, random (x2 + 300, y2 + 275)); //4th bottom box

}




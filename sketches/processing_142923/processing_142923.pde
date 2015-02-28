
class Pac{
  float x;
  float y;
  color c;
  int radius = 100;
float rt = radians(45);
float rb = radians(315);
float mouth = radians(1);
  
  Pac(float pacx,float pacy, color paccolor){
    x = pacx;
    y = pacy;
    c = paccolor;
  }
  void drive(float speed){
    x = x+speed;
    fill(c);
      arc(x, y, radius, radius, rt, rb);
      if (x > width + radius || x < 0 - radius) {
    x= - radius;
}
}
void mouth(){
 rt -= mouth;
  rb += mouth;
 
  if ( rt < 0 || rt >= radians(45)) {
    mouth *= -1;
  } 
}
}
Pac pac1;
Pac pac2;
Pac pac3;

void setup(){
  size(700,500);
  pac1 = new Pac(20,100,#0AA8F5);
  pac2 = new Pac (20,250,#F5470C);
  pac3 = new Pac (20,400,#0DFF9C);
}
void draw(){
  background(0);
  pac1.drive(1);
  pac2.drive(1.2);
  pac3.drive(1.9);
  pac1.mouth();
  pac2.mouth();
  pac3.mouth();
}

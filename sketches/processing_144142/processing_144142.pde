
Melon melon1;
Melon melon2;
Melon melon3;
Melon melon4;
Melon melon5;
Melon melon6;
Melon melon7;
Melon melon8;
Melon melon9;
Melon melon10;
Melon melon11;
Melon melon12;
Melon melon13;
Melon melon14;
Melon melon15;
Melon melon16;
void setup() {
  size(400, 400);
  melon1= new Melon(50, 50, #54BBD6);
  melon2= new Melon(100, 100, #54BBD6);
  melon3= new Melon(150, 150, #54BBD6);
  melon4= new Melon(200, 200, #54BBD6);
  melon5= new Melon(250, 250, #54BBD6);
  melon6= new Melon(300, 300, #54BBD6);
  melon7= new Melon(350, 350, #54BBD6);
  melon8= new Melon(50, 400, #54BBD6);
  melon9= new Melon(100, 350, #54BBD6);
  melon10= new Melon(150, 300, #54BBD6);
  melon11= new Melon(200, 250, #54BBD6);
  melon12= new Melon(250, 200, #54BBD6);
  melon13= new Melon(300, 150, #54BBD6);
  melon14= new Melon(350, 100, #54BBD6);
  melon15= new Melon(400, 0, #54BBD6);
  melon16= new Melon(0, 400, #54BBD6);
}
void draw () {
  frameRate(10);
  background (random (0), random (0), random (200));
  melon1.jump();
  melon2.jump();
  melon3.jump();
  melon4.jump();
  melon5.jump();
  melon6.jump();
  melon7.jump();
  melon8.jump();
  melon9.jump();
  melon10.jump();
  melon11.jump();
  melon12.jump();
  melon13.jump();
  melon14.jump();
  melon15.jump();
  melon16.jump();
}

class Melon {
  int radius =10;
  float x;
  float y;
  color c;

  Melon (float melonx, float melony, color meloncolor) {
    x=melonx;
    y=melony;
    c=meloncolor;
  }
  void jump() {
    y=y+50;
    if (y > height+radius) {
      y=-radius;
    }
    fill(c);
    strokeWeight (0);
    ellipse(x, y, 20, 20);
  {
 if (key=='f' && keyPressed==true){
if (frameCount % 4 == 0 && frameCount < 121)
   saveFrame("image-######.gif");
 }}}}
 

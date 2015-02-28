
Cat a;
Cat b;
int btn_x = 150;
int btn_y = 150;
int btn_z = 130;
int btn_w = 185;
int btn_h = 175;
int btn_l = 185;
boolean btn_state = false;

void setup() {
  size (600, 250);
  a = new Cat ();
  b = new Cat ();
}

void draw () {
  background (255);
  a.displayCat();
  b.displayCat2();
}

class Cat {
  float x;
  float y;


  void displayCat() {
    fill(180);
    fill(255, 198, 198);
    triangle(btn_x, btn_y, btn_z, btn_w, btn_h, btn_l);

    line(50, 20, 85, 60);
    line(50, 20, 35, 60); 
    triangle(50, 20, 60, 60, 35, 60);
    line(250, 20, 215, 60);
    line(250, 20, 265, 60);
    triangle(250, 20, 240, 60, 265, 60);

    fill(0);
    ellipse(95, 110, 20, 20);
    ellipse(205, 110, 20, 20);

    line(115, 155, 50, 140);
    line(110, 165, 40, 160);
    line(115, 175, 50, 180);

    line(185, 155, 250, 140);
    line(190, 165, 260, 160);
    line(185, 175, 250, 180);
  }
  void displayCat2() {
    translate(width/2, height/100);
    fill(255, 198, 198);
    triangle(btn_x, btn_y, btn_z, btn_w, btn_h, btn_l);

    line(50, 20, 85, 60);
    line(50, 20, 35, 60); 
    triangle(50, 20, 60, 60, 35, 60);
    line(250, 20, 215, 60);
    line(250, 20, 265, 60);
    triangle(250, 20, 240, 60, 265, 60);

    fill(180,0,0);
    ellipse(95, 110, 20, 20);
    ellipse(205, 110, 20, 20);

    line(115, 155, 50, 140);
    line(110, 165, 40, 160);
    line(115, 175, 50, 180);

    line(185, 155, 250, 140);
    line(190, 165, 260, 160);
    line(185, 175, 250, 180);

}
}
void keyPressed() {
  saveFrame("PS2_06image.jpeg");
}


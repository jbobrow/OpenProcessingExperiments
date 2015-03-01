
float a = 0;

void setup() {
  size(400, 400);
  background(0);

}


void draw() {
  a = a +1;
      stroke(255);

    line(20, 2, 40, a);
    line(60, 2, 40, a);

    line(80, 2, 120, a);
    line(120, 2, 80, a);
    
     line(140, 2, 160, a);
    line(200, 2, 180, a);
    
      line(200, 2, 220, a);
    line(280, 2, 260, a);
    
          line(260, 2, 250, a);
    line(320, 2, 340, a);
}



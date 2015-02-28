
int z = 18;
boolean b_S;

void setup()
{
  size(400,400, P2D);
  frameRate(5);
}
 
void draw()
{
  background(0);
  for(int y = 0; y < height / z; y++) {
    for(int x = 0; x< width / z; x+=2) {
      Par p= new Par(x,y,z);
      p.create();
    }
  }   
}
 
class Par {
  int c_x, c_y, fz;
  Par (int x, int y, int z) { 
    c_x = x;
    c_y = y;
    fz= z;
  }

  void create() {
    color c1= color(20,30,40);
    color c2= color(80,60,40);
    color c3= color (200,140,60*millis()%255);

    int r=(int) random(3);
    switch (r) {
            case 1:  fill(c3); break;
            case 2:  fill(c2); break;
            case 3:  fill(c3); break;
    }
    rect(c_x * fz, c_y * fz, fz, fz);
    switch (r) {
            case 1:  fill(c3); break;
            case 2:  fill(c1); break;
            case 3:  fill(c2); break;
    }
    rect(c_x * fz + fz, c_y * fz, fz, fz);
  }
}


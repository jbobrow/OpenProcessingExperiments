
int counter;

int x = 0;
int y = 75;

void setup(){
  size(400, 280);
background(180, 210, 5);
stroke(255);
}

void draw(){
  line(x -10, y, x +40, y -75);

x = x+10;
y = y+0;
line(x -10, y -15, x +40, y +75);

x = x+10;
y = y+0;
line(x -10, y +150, x +40, y +60);
line(x -20, y +135, x +30, y +225);
}

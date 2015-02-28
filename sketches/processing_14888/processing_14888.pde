
int fux;
int tux;

void setup() {
  size(450,450);
  background(0);
}

void draw() {
background(0);
  fill(255,0,75);
  rect(fux+20,tux+20,50,50);
}
void keyPressed() {
 if (key == 'z') {
tux = tux-10;
}
 if (key == 's') {
tux = tux+10;
}
 if (key == 'd') {
fux = fux+10;
}
 if (key == 'q') {
fux = fux-10;
}
}                               

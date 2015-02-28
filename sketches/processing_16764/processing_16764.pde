
void setup (){
size(800, 600);
background(0, 0, 0);
}
void draw (){
noStroke();
fill(139, 58, 130);
rect(60, 40, 100, 100);
fill(74, 152, 150);
rect(120, 80, 200, 200);
fill(216, 57, 81);
rect(240, 160, 400, 400);
}
void mousePressed (){
  saveFrame ("1. JPG");
}


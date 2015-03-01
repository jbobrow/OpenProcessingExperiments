

//gluggastærð
void setup() {
  size (400,300);
  frameRate(1);
}

void draw() {
  andlit (40,50);
  andlit (80,140);
  andlit (111,240);
  andlit (160,180);
  andlit (220,120);
  andlit (285,120);
  andlit (350,120);
  
}

void andlit (int x, int y) {
fill (237,217,187);
ellipse (x,y,60,70);
fill (137,226,247);
ellipse (x,y-2,8,6);
ellipse (x-12,y-2,8,6);
fill (247,163,27);
ellipse (x-10,y+5,16,3);
fill (234,17,49);
ellipse (x-5,y+18,5,2);

//pípuhattur
fill (14,118,50);
rect (x-15,y-50,30,20);
fill (250,255,8);
rect (x-25,y-40,40,5);
}

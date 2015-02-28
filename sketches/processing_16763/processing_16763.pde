
void setup (){
size (800,600);
}
void draw (){
background (152, 52, 52);
strokeWeight (8);
line (150,100,150,500);
smooth ();
fill (33,58,108);
ellipse (250,300,123,76);
line (233,150, 0,150);
line (300,450,0,450);
line (600,443,90,400);
line (55,87,90,400);
line (900,200,600,45);
fill (35,116,81);
ellipse (300,500,90,76);
fill (97,152,151);
ellipse (300,100,90,76);
line (900,200,600,200);
line (900,200,600,400);
point (600,300);
point (600,100);
}
void mousePressed (){
  saveFrame ("1.JPG");
}



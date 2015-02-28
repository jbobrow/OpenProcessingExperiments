
//Monyse Takaki
void setup (){
  size (200,200);
  background (0);
  smooth ();
  noStroke ();
}
void draw (){
  int x = mouseX;
  int y = mouseY;
  background (0);
  fill (#E82FA4);
  ellipse (80, 40, 40, 40);
  fill (#E82FA4, 200);
  ellipse (100, 40, 40, 40);
  fill (#E82FA4, 40);
  ellipse (120, 40, 40, 40);
  fill (#E82FA4, 50);
  ellipse (140, 40, 40, 40);
  {
    if (x>=80 && x<=140 && y>=80 && y<=100)
    background (255);

for (int j=-90; j<100; j=j+8){
  noStroke();
  fill (255);
  ellipse (j+100,(j*j/140)+110,5,5);
}
  }
}



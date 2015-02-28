
int x=2;
int y=2;
float z=1.5;
int w =20;
int h = 10;

void setup (){
  size (600, 600);
  background (0);
  smooth();
  
}

void draw (){
  //strokeWeight (3);
  smooth();
  noStroke ();
   for (int xy = 0; xy < width; xy += 22/z) {
  for (int yy = 0; yy <height; yy +=80/z) {
    fill (245, 85, 22, 2);
    ellipse (xy, yy, h/z, h);
  }
}
  
  fill (209, 207, 139, 25);
  //stroke (0);
  ellipse (x, y, 75, 800);
  x = x*2;
  
  strokeWeight (.5);
  fill (245, 85, 22, 95);
  rect (y, y-z, 800, y*z);
  y = y*2;
}



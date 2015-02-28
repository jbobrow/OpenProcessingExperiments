
color [] c = new color [8];

void setup(){

  
size (200,200);

  c[0] = color(55, 32, 14);
  c[1] = color(69, 142, 1);
  c[2] = color(0, 167, 205);
  c[3] = color(19, 0, 0);
  c[4] = color(6, 112, 10);
  c[5] = color(11, 20, 20);
  c[6] = color(20, 154, 124);
  c[7] = color(26, 32, 207);
}

int value = 0;

void draw() {
   for (int y=20; y<height; y+=30) {
    for (int x=20; x<width; x+=30){
   fill(c[y/30]);
  noStroke();
  ellipse (x,y,20,20);
  
  }
  
  
  //fill (c[x]);

  
   }
    }


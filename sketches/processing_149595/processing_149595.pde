
void setup () {
size (500,500);
background (204,37,214);
noStroke();

}

void draw () {
 for (float i = 1.1; i < width ; i = i*1.1) {
  for (float j = 1.1 ; j< height ; j = j*1.1) {
   
   fill (214,199,37);
   ellipse ( i, j, 20, 20);
  }
 } 

}

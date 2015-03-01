
//row
int r = 8;
//column
int c = 5;

void setup() {
size(300, 300);
background(200);
}
void draw() {
stroke(0);
int i = 0;
while (i < height) {
  line(0, i, height, i);
  i = i + height/r;
 } 
int j = 0;
while (j < width) {
  line(j, 0, j, width);
  j = j + width/c;
 }
}

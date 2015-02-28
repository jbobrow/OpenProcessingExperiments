
void setup () {
  size (200,200);
}
void draw () {
background(255);
float w= 0;
while(w<height && w<width) {
  stroke(0);
  ellipse(w,w,width,height);
  w = w + 20;
}

}





/*void setup () {
  size (200,200);
}
void draw () {
background(255);
float w= 0;
while(w<height && w<width) {
  stroke(0);
  ellipse(w,w+1,10,100);
  w = w + 20;
}

}
*/


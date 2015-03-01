

void draw() {
 for(int i = 0; i<mouseX; i=i+4){
  println(i);
  ellipse(i,200,9,9);
}
background(255);
for(int a = width; a>mouseX; a= a-10){
ellipse(a,100,9,9);
  }
}

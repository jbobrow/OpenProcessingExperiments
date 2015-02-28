
void setup(){
size(300, 300);
background(0);
}
int spacing = 50;
int a = 25;
void draw(){
  noFill();
for (int y=a; y <height; y+=spacing) {
  for (int x=a; x < width; x+=spacing) {
    for (int z=a;z < width; z+=100){
      stroke(60,140,219,20);
    ellipse(x,y, z, z);
  }
}
}
}


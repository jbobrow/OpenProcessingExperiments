
void setup() {
  int x=80;
int spacing=1;
int endlegs = 150;
    size(800, 600);
    background(#0AF532);
    stroke(0);
    fill(#1BADE0);
    while (x <= endlegs){
      ellipse(150,x,150,x);
 x = x+ spacing;
}
}
     
  
void draw() {
 
float s = mouseX+random(1);
float w = mouseY+ random (1);
stroke(#0A6DF5);
if (mousePressed == true) {
fill(#0AD3F5, random(100),#0AD3F5,#0AD3F5+random(#0AD3F5));
ellipse(s+1, w, 33, 33);


}
}

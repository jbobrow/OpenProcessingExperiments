

void setup () {
size (500,500);
background (0);
}

void draw (){
  int maVariable ;
fill(random(188), random (13), random (67), random (89));

ellipse (mouseX, mouseY, 70, 70);
ellipse (mouseY, mouseY, mouseX, mouseY);

}




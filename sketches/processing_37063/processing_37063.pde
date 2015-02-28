
int x = 100;
int y = 200;
int z = 50;


void setup () {
  size (400,300);
  background(x+z);
  smooth();
  strokeWeight(z-48);
 ellipseMode (RADIUS);
}

void draw(){
  if (mousePressed) {
   fill(y+z-10);
stroke(z-45);
ellipse(z-20,mouseY,z-30,z-30);
fill(z-40);
stroke(x-21);
ellipse(mouseX,y+z,z,z);
fill(x+z-10);
stroke(x+z-30);
ellipse(y+z,z-10,z+10,mouseY);
fill(z+10);
stroke(z-10);
ellipse(y+z+10,mouseY,mouseX,z-20);
fill(y+z-20);
stroke(z-40);
ellipse(mouseX,x+z,z,mouseY);

} else{
  background(x+z);
}

}


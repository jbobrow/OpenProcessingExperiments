
PImage tri; //short for the triangle image//
PImage tri1; //2nd triangle image
float angle = 0.0;

void setup() {
 
  size(500, 500);
 
  background(245, 245, 245);

noStroke();


tri = loadImage("triangle.gif");
tri1 = loadImage("triangle2.gif");

}

void draw() {

if (mousePressed){
  
  translate(mouseX, mouseY);
  rotate(angle);
  angle += 0.1;
  
}  
  
  //triangles pointing up//
for (int i = -250; i < 1000; i += 350) {  
image(tri,i,100);
}

for (int i = -420; i < 1000; i += 350) {  
image(tri,i,-200);
}

for (int i = -420; i < 1000; i += 350) {  
image(tri,i,400);
}

//triangles pointing down//
for (int i = -75; i < 1000; i += 350) {  

  image(tri1,i,100);

}

for (int i = -595; i < 1000; i += 350) {  
image(tri1,i,-200);
}

for (int i = -595; i < 1000; i += 350) {  
image(tri1,i,400);
}

 
}




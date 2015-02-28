
void setup() {
background(102,51,153);
size(400,400);
}


void draw() {
  if (mouseY < 100) {
  fill(51,20,83);  
  noStroke();
  triangle(0,100,50,0,100,100);
  triangle(100,100,150,0,200,100);
  triangle(200,100,250,0,300,100);
  triangle(300,100,350,0,400,100);
  } else if (mouseY < 200) {
  fill(70,32,109);
  noStroke();
  triangle(-50,200,0,100,50,200);
  triangle(50,200,100,100,150,200);
  triangle(150,200,200,100,250,200);
  triangle(250,200,300,100,350,200);
  triangle(350,200,400,100,450,200);
  } else if (mouseY < 300) {
  fill(77,34,119);
  noStroke();
  triangle(0,300,50,200,100,300);
  triangle(100,300,150,200,200,300);
  triangle(200,300,250,200,300,300);
  triangle(300,300,350,200,400,300); 
  } else {
  fill(94,47,140);
  noStroke();
  triangle(-50,400,0,300,50,400);
  triangle(50,400,100,300,150,400);
  triangle(150,400,200,300,250,400);
  triangle(250,400,300,300,350,400);
  triangle(350,400,400,300,450,400);
 }
}



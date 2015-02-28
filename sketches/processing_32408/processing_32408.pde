
void setup() {
size(400,400);
}

void draw() {
  background(102,51,153);
  if (mouseY < 100 && mouseX < 100) {
  fill(51,20,83);  
  noStroke();
  triangle(0,100,50,0,100,100);
  } else if (mouseY < 100 && mouseX < 200) {
  triangle(100,100,150,0,200,100);
  } else if (mouseY < 100 && mouseX < 300) {
  triangle(200,100,250,0,300,100);
  } else if (mouseY < 100 && mouseX < 400) {
  triangle(300,100,350,0,400,100);
  
  } else if (mouseY < 200 && mouseX < 50) {
  fill(70,32,109);
  triangle(-50,200,0,100,50,200);
  } else if (mouseY < 200 && mouseX < 150) {
  triangle(50,200,100,100,150,200);
  } else if (mouseY < 200 && mouseX < 250) {
  triangle(150,200,200,100,250,200);
  } else if (mouseY < 200 && mouseX < 350) {
  triangle(250,200,300,100,350,200);
  } else if (mouseY < 200 && mouseX < 450) {
  triangle(350,200,400,100,450,200);
  
  } else if (mouseY < 300 && mouseX < 100) {
  fill(77,34,119);
  triangle(0,300,50,200,100,300);
  } else if (mouseY < 300 && mouseX < 200) {
  triangle(100,300,150,200,200,300);
  } else if (mouseY < 300 && mouseX < 300) {
  triangle(200,300,250,200,300,300);
  } else if (mouseY < 300 && mouseX < 400) {
  triangle(300,300,350,200,400,300); 
  
  } else if (mouseY < 400 && mouseX < 50) {
  fill(94,47,140);
  triangle(-50,400,0,300,50,400);
  } else if (mouseY < 400 && mouseX < 150) {
  triangle(50,400,100,300,150,400);
  } else if (mouseY < 400 && mouseX < 250) {
  triangle(150,400,200,300,250,400);
  } else if (mouseY < 400 && mouseX < 350) {
  triangle(250,400,300,300,350,400);
  } else {
  triangle(350,400,400,300,450,400);
 }
}


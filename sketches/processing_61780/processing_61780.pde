
 
int a = 0;      // Create a variable "a" of the datatype "int"
float b = 1.1;

void setup () {
  size(400, 400);
  background(0);
  smooth();

}
  
void draw() {
  fill (0, 50);
  noStroke();
  noCursor();
  rect(0,0, width, height);
if (mousePressed) {
  frameRate(10);
   a = a + 1;
  b = b + 0.2; 
  fill (random(255));
  ellipse(a, 0, a, height/4);
  fill (random(255),50);
  ellipse(b, height/8, b, height/8);
  
  a = a + 1;
  b = b + 0.8; 
   ellipse(a -50, 200, a +15, height/4);
   fill (random(255));
  ellipse(b+ 200, height/12, b, height/12);
  
  a = a + 1;
  b = b + 0.8; 
   ellipse(a -50, 390, a /6, height/6);
   fill (random(255-20));
  ellipse(b+ 200, height/12, b, height/12);
 
  
    if(a > width) {
    a = 0;
  }
  if(b > width) {
    b = 0;
}

fill (random(255-10));
ellipse(mouseX, mouseY, 50,50);
ellipse(mouseX, mouseY, 35, 35);
ellipse(mouseX, mouseY, 20, 20);
}
else{
  frameRate(120);
  background (random(255));
  noStroke();
  noCursor();
 fill (random(255-1));
  ellipse(200,200,510,510);
 fill (random(255-5));
  ellipse(200,200, 430,430);
   fill (random(255));
  ellipse(200,200, 350,350);
   fill (random(255-10));
  ellipse(200,200, 250,250);
  fill (random(255));
  ellipse(200,200, 150,150);
  
 
}
}






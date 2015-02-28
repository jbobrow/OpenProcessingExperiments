

 PImage img;
float space =  5;
 
void setup(){
  
  
size(400, 400);
background(255);
smooth();

img = loadImage("Inge_Morath.jpg");
img.resize(0,300);
}

void draw(){
  
  
for (float y = 0; y < height; y = y + random(0,2)) {
  for (float x = 0; x < width; x = x + random(0,50)) {
   noStroke();
    fill(random(255),random(255),random(255),100);
    rect(x, y,random(0,30),random(0,30));
  
  stroke(35,30,214);
  strokeWeight(10);
  noFill();
  rect(50,50,300,300);

  }
}
}

void mousePressed(){
image(img,50,50);
  
   saveFrame("punkt.png");
 
}




float posX, posY, velX, velY;
int sz = 25;

int A;

float fillballoon;

PImage img;

void setup() {
  size(400, 500);
  posX = random (50,350);
  posY = (300);
  
  velY = 3;
  fill(255, 255, 192);
  smooth();
  stroke(255);
  strokeWeight(4);
  img = loadImage("boom.jpg");
}

void draw() {
  
  if (posY < 440){
  background(#7EDEFF);
velX = random(-2,2);
A = 26;


//puas del piso
fill(#BFC1C1);
triangle(00, 500, 18, 470, A, 500);
triangle(A, 500, 46, 470, 52, 500);
triangle(A*2, 500, 74, 470, A*3, 500);
triangle(A*3, 500, 102, 470, A*4, 500);
triangle(A*4, 500, 130, 470, A*5, 500);
triangle(A*5, 500, 158, 470, A*6, 500);
triangle(A*6, 500, 186, 470, A*7, 500);
triangle(A*7, 500, 214, 470, A*8, 500);
triangle(A*8, 500, 242, 470, A*9, 500);
triangle(A*9, 500, 262, 470, A*10, 500);
triangle(A*10, 500, 282, 470, A*11, 500);
triangle(A*11, 500, 302, 470, A*12, 500);
triangle(A*12, 500, 322, 470, A*13, 500);
triangle(A*13, 500, 342, 470, A*14, 500);
triangle(A*14, 500, 362, 470, A*15, 500);
triangle(A*15, 500, 382, 470, A*16, 500);

// balloon

  strokeWeight(0.5);
  stroke(185,58,169, 90);
  fill(#FA0D20);
  ellipse(posX,posY ,45 ,70 );
  
  // brillo de la bomba
  noStroke();
  strokeWeight(1);
  stroke(255, 50);
  fill(247,240,246);
  ellipse(posX - 5,posY - 15 ,15,18);
  

  posY = posY+velY;
  posX= posX+velX;
  }
else {image(img, 0, 0);

} 
  
}


// al clickar el mouse se sube un poco la bomba
void mousePressed(){
  posY = posY-35;
}





// Design & Computers 4
// Project One: 
// Feeding Raph
// Raph love his pizza, but becareful don't shove it in his face!!
// Instructions: Raph's eyes follow the pizza slice, click it on face or mouth.

void setup(){
  size(717, 678);
  background(0);
  smooth();
}

void draw(){
  background(255);

// Raph's Torso

PImage torso;
torso = loadImage("torso.png");
image(torso, 0, 478, 718, 200);


// Raph's Head

PImage head;
head = loadImage("raph head.png");
image(head, 0, 0, 717, 481);

// Raph's Hungry Eyes

int eyeX = mouseX;
int leyeX = mouseX;
int reyeX = mouseX;
int eyeY = mouseY;

leyeX = constrain(leyeX, 168, 251);
reyeX = constrain(reyeX, 389, 472);
eyeY = constrain(eyeY, 152, 188); 

strokeWeight(10);
ellipse(215, 150, 130, 100); 
ellipse(500, 150, 130, 100); 

for(int i =0; i <50; i +=5) 
{ 
  stroke(0); 
  ellipse(leyeX+5, eyeY-20, 30 -i, 30 -i); 
  ellipse(reyeX+70, eyeY-20, 30 -i, 30 -i); 
} 
  
// Raph's Angry Face

if(mousePressed) {
  PImage angryhead;
  angryhead = loadImage("raph angry head.png");
  image(angryhead, 0, 0, 717, 481);
}

// Ralph's Mouth

if(mouseY >220) {
  PImage mouth;
  mouth = loadImage("raph mouth.png");
  image(mouth, -0.5, 261, 718, 220);
}

// Ralph's Open Mouth

if(mouseX>100 && mouseY >290) {
  PImage openmouth;
  openmouth = loadImage("raph open mouth head.png");
  image(openmouth, -0.5, 261, 718, 220);
}

// Pizza Slice

PImage pizza;
pizza = loadImage("pizza.png");
image(pizza, mouseX, mouseY, 221, 102);
noCursor();
}
  


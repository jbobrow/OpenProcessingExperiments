
//imatge

PImage Grumpy;

//Bola
float posX = 150;
float posY = 200;
float sz = random(20, 50);

//velocitats
float velX = random(-10, 20);
float velY = random(-10, 20);

void setup () {
  size (500, 500);
  Grumpy = loadImage ("GrumpyCat.jpg");
}

void draw () {
  
  background(0);
  image (Grumpy, 0, 0, width, height);
  
  textSize (22);
  text ("Grumpy Cat is not amused", 100, 450);
 
  ellipse(posX, posY, sz, sz);

  posX = posX + velX;
  posY = posY + velY;

  if (posX <= 0 ||posX >= width) {
    velX = - velX;
  } 

  if (posY<= 0 ||posY>= height) { 
    velY = - velY;
  }
}

void mousePressed () {

  fill (random (255), random (255), random(255));
  sz = random (20, 50);
  posX = mouseX;
  posY = mouseY;
}

// Intent de que la velocitat segueixi el mouse ( no està 100% aconseguit però sembla que agafa direcció...)
void mouseReleased(){
  
  velX = pmouseX/50;
  velY = pmouseY/50;
  
  print (pmouseX); 
  print (pmouseY);
}





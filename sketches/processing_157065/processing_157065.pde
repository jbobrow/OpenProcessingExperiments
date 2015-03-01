
float posX;
float posY;
int speedX = 0;
int speedY = 0;

float amp = 0;
float vel = 0.05;


void setup() {
  size(800, 400);
}

void draw() {
  //background(200);
  fill(200, 20);
  rect(0, 0, width, height);
  
  noStroke();
  fill(100);

  for (int i = 0; i < 2000; i++) {
    posX = i;
    //y = A * sin (kx) + B
    posY = amp * sin(0.05 * (posX + frameCount)) + 200; //add frame count to (posX) Only the Y coordinate changes
    ellipse(posX, posY, 10, 10);
  }
  for (int i = 0; i < 200; i++) {
    posX = i;
    //y = A * sin (kx) + B
    posY = amp * sin(0.05 * (posX + frameCount)) + 200; //add frame count to (posX) Only the Y coordinate changes
    ellipse(posX, posY, 10, 10);
  }
  for (int i = 0; i < 200; i++) {
    posX = i;
    //y = A * sin (kx) + B
    posY = amp * sin(0.05 * (posX + frameCount)) + 20; //add frame count to (posX) Only the Y coordinate changes
    ellipse(posX, posY, 10, 10);
  }
    for (int i = 0; i < 200; i++) {
    posX = i;
    //y = A * sin (kx) + B
    posY = amp * sin(0.07 * (posX + frameCount)) + 100; //add frame count to (posX) Only the Y coordinate changes
    ellipse(posX, posY, 10, 10);
  }
//  for (int i = 0; i < 1000; i++) {
//    posX = i;
//    //y = A * sin (kx) + B
//    posY = mouseY/2 * sin(0.04 * (posX + frameCount)) + 200; //add frame count to (posX) Only the Y coordinate changes
//    ellipse(posX, posY, mouseX/40, mouseX/40);
//  }

  if(amp > 20 || amp < 0){
    vel *= -1;
  }
  
  amp += vel;
}




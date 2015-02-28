
float xPos = 0;
int yPos = 0;
float speed = 2;
int ySpeed = 25;
float size = 50;
float r = 120;
float accel = 0.8;

void setup(){
  size(500,500); 
  smooth();
  background(10,122);
  colorMode (RGB, 255, 255, 255, 100);

}

void draw () {
  xPos = xPos + speed;
  if (xPos >=width || xPos < 0) {
   speed = speed * (-1);
  }
  speed = speed + accel;
  yPos = yPos + ySpeed;

  if (yPos >= height || yPos < 0) {
   ySpeed = ySpeed * (-1);
  }
   size = random(55);
   r = random(100,255);
   fill (r, random(255),random(255), 88);
   ellipse(xPos, yPos, size ,size );
  
}

void keyPressed(){
  saveFrame ("zeichenapparat_enes.png");
}


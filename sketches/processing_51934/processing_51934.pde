

PImage face;
PImage mouthWheel;
PImage eyeWheel;


void setup() {
  
  size(900,900);
  face = loadImage("ExquisiteFace.png");
  mouthWheel = loadImage("mouthWheel.png");
  eyeWheel = loadImage("eyeWheel.png");
  imageMode(CENTER); 
  
  
  
}
void draw() {
  image(face, width/2, height/2);
   
   pushMatrix();
   translate(width/2, -1700);
   
   if (mousePressed == true && mouseButton == LEFT) {
     float x = map(mouseX, 10, width, 250, 375);
     rotate(HALF_PI*(x/10));
     image(eyeWheel, 0, 0);
   }
   popMatrix();
   
   pushMatrix();
   
   if (mousePressed == true && mouseButton == RIGHT) {
     translate(width/2, height+1900);
     float y = map(mouseY, 10,height, 250, 375);
     rotate(HALF_PI*(y/10));
     image(mouthWheel, 0, 0);
   }
   
   popMatrix(); 
}


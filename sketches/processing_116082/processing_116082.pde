

PImage[] img = new PImage[14]; 
int copy = 50 ; 
float a = 0;

void setup() {
  size(700 , 400); 
  background(0);
  for (int i = 0; i < 14; i ++) {
    img[i] = loadImage( i+".jpg");
  }
}

void draw() {

       pushMatrix();
  translate(width/3, height/3);
  rotate(a);
  
  image(img[6], 0, 0);
 
  popMatrix();  

  
   pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  
  image(img[5], 0, 0);
 
  popMatrix();  


    a+= 0.2;
  
  float r = random(0, 500); 
  for (int i = 0; i < 14; i ++) {
    image(img[i], copy*i, r);
  }

  image(img[12], mouseX, mouseY);
}

void keyPressed() {
  saveFrame("_######.png");
}




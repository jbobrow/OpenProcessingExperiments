
PImage[] img = new PImage[20]; 
int copy = 50 ; 
float a = 0;
float b = 0;
float c = 0;

void setup() {
  size(800, 500); 
  background(255);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
}

void draw() {
  float r = random(0, 500); 
 
  for (int i = 0; i < 20; i ++) {
    tint(255, 50);  
     if (i< 7) { 
     tint(255, 100);  
  }  
    image(img[i], copy*i, r, 100, 100);
         
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  image(img[3], 0, 0);
   popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(b);
  image(img[5], 0, 0,150,150);
     popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(c);
  image(img[7], 0, 0,150,150);
   popMatrix();
   
   

  a = a + 0.01;
 b = b - 0.01;
 c = c + 0.03;
 
  image(img[10], mouseX-200, mouseY-100);

}

void keyPressed() {
  saveFrame("_######.png");
}




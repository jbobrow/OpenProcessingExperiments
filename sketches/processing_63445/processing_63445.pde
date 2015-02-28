
PImage bild2, bild4, bild1, bild3, bild5, bild6, bild7;
int BLUR = 11;
 
void setup() {
  size(800, 300);
  bild2 = loadImage("bild2.jpg");
  bild4 = loadImage("bild4.jpg");
  bild1 = loadImage("bild1.jpg");
  bild3 = loadImage("bild3.jpg");
  bild5 = loadImage("bild5.jpg");
  bild6 = loadImage("bild6.jpg");
  bild7 = loadImage("bild7.jpg");
}
 
void draw() {
  image(bild4, 0, 0 );
  image(bild2, 400, 0);
  
  if (mousePressed) {
  if (mouseX < 400 && mouseY < 300 && mouseButton == LEFT) {
    image(bild5, 400, 0);
    bild5.filter(GRAY);
    bild5.filter(ERODE);
   }
    if (mouseX < 400 && mouseY < 300 && mouseButton == RIGHT) {
    image(bild7, 0, 0, 400, 400);
  }
  
   if (mouseX > 400 && mouseY < 300 && mouseButton == RIGHT) {
  image(bild1, 0, 0);
  image(bild2, 400, 0);
    bild1.filter(BLUR, 0.5);
    bild1.filter(ERODE);
   }
 
  if (mouseX > 400 && mouseY < 300 && mouseButton == LEFT) {
    image(bild6, 0, 0, 800, 800);
    bild6.filter(BLUR, 0.5);
    bild6.filter(DILATE);
    

  }
   
    }
    
    else {
      noTint();
      image(bild4, 0, 0 );
  image(bild2, 400, 0);
      
     setup();
      }
 
    
     //black grid
  strokeWeight(25);
  fill(0);

  line(0, 10, width, 10);
  line(0, height-10, width, height-10);
  line(width/2, 0, width/2, height);
  line(10, 0, 10, height);
  line(width-10, 0, width-10, height);
 

}

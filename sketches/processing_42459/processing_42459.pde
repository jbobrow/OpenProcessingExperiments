









PImage img;
PImage img2;
PImage img3;
PImage img4;


void setup() {
  
  size (600, 600);

  img = loadImage("MStank.png");
  img2 = loadImage("MStank - Copia.png");
  img3 = loadImage("MStank - Copia - Copia.png");
  img4 = loadImage("MStank - Copia - Copia - Copia.png");
} 


void draw () {
   fill(255,255,0);
  rect(0, 0,300,300);
  fill(255,0,255);
  rect(300,0,300,300);
   fill(0,255,0);
  rect(300, 300,300,300);
    fill(0,0,255);
  rect(0, 300,300,300);
  
  
  
  line(300, 0, 300, 600);
  line(0, 300, 600, 300);  

  image(img, 0, 0);
  image(img2, 0, 300);
  image(img3, 300, 300);
  image(img4, 300, 0);




  tint (mouseX, mouseY, 15);
  image(img, 0, 0);

  tint (mouseX, mouseY, 100);  
  image(img2, 0, 300);
  tint (mouseX, mouseY, 255);  
  image(img3, 300, 300);

  tint (mouseX, mouseY, 175);
  image(img4, 300, 0);
}



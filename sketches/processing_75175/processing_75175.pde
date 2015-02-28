
PFont font;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
float col = 0;
float d = 0;
String txt = "NO ALBUM FOUND HERE";

void setup() {
  background(255);
  size(600, 600, P2D);
  font = loadFont("AvantGarde-30.vlw");
  textFont(font);
  
  img1 = loadImage("b_white.jpeg");
  img2 = loadImage("b_sale.jpeg");
  img3 = loadImage("b_rub.jpeg");
  img4 = loadImage("b_rev.jpeg");
  img5 = loadImage("b_rev_inv.jpg");
  
}

void draw() {
  
  if(mouseX <= 300 && mouseY <= 300) {
  image(img1, 0, 0, mouseX, mouseY);
  }
  
  if(mouseX >= 300 && mouseY <= 300) {
  image(img2, 300, 0, 300, 300);
   
   if(mouseX >= 300 && mouseY <= 300 && mousePressed) {
    fill(255);
     rect(300, 0, 300, 300) ;
     fill(200);
    text(txt, 340, 150);
    textSize(20);
    }
  
  } 
  
  image(img3, 0, 300, 300, 300);
  
  if(mouseX <= 300 && mouseY >= 300 && mousePressed) {
    rect(0, 300, 300, 300) ;
    fill(random(col), random(col), random(col), 200) ;
    col = col + 1;
    }
    
    image(img4, 300, 300, 300, 300);
    
    if(mouseX >= 300 && mouseY >= 300 && mousePressed) {
  image(img5, 300, 300, 300, 300);
  }
    
}


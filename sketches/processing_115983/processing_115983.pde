
PImage[] img = new PImage[20];
PImage img1;
 float angle = 0;
  
  
  
void setup() {
  size(700, 700);
  background(250,155,3);
 img1 = loadImage("4.png");
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage( i+".png");
  }
}
void draw() {
   
       
    image(img[15], mouseX, mouseY);
  println(mouseX +":"+ mouseY);
   
   
  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  image(img1,0,0);
  popMatrix();
   
  frameRate(6);
  tint(200,85);
  
 
   
  for (int i = 0; i < 20; i ++) {
    image(img[i], random(-200, 800), random(-200, 800));
 
 
  angle += 0.01;
 
  }    
}
  




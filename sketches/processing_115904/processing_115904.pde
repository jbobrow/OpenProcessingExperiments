
PImage[] img = new PImage[20];
PImage img1;
 float angle = 0;
 
 
 
void setup() {
  size(1000, 700);
  background(0);
 img1 = loadImage("3.png");
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
  
  frameRate(8);
  tint(255,50);
 

  
  for (int i = 0; i < 20; i ++) {
    image(img[i], random(-100, 1500), random(-200, 700));


  angle += 0.01;

  }
  
  
   
}
 
void keyPressed() {
  saveFrame("_######.png");
}



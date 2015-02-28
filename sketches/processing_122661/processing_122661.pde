
PImage img;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
  int x = 0;


void setup() {
  size (660, 60);
 
 
 
  background(255);
  size (1800, 1800);
  

}

       void draw() {
 
}
  

       void keyPressed() {
 
 
  if (x == 0) {
    fill(255);
    img = loadImage("H.jpg");
    image(img,400,570);
    //rect(x, 0, width/10, height);  
  }
 
  if (x == 60) {
    fill(255);
    img1 = loadImage("E.jpg");
    image(img1,460,570);
    //rect(x, 0, width/10, height);
  }
 
  if (x == 120) {
    fill(255);
    img1 = loadImage("L.jpg");
    image(img1,520,570);
    //rect(x, 0, width/10, height)
  }
 
   if (x == 180) {
    fill(255);
    img1 = loadImage("L.jpg");
    image(img1,570,570);
    //rect(x, 0, width/10, height)
  }
 
  if (x == 240) {
    fill(255);
    img1 = loadImage("O.jpg");
     image(img1,615,570);
    //rect(x, 0, width/10, height)

  }
 
  if (x == 360) {
    fill(255);
    img1 = loadImage("W.jpg");
    image(img1,740,570);
    //rect(x, 0, width/10, height)
  }
 
  if (x == 420) {
    fill(255);
     img1 = loadImage("O.jpg");
    image(img1,822,570);
    //rect(x, 0, width/10, height)
  }
 
  if (x == 480) {
    fill(255);
    img1 = loadImage("R.jpg");
    image(img1,890,570);
    //rect(x, 0, width/10, height)
  }
 
  if (x == 540) {
    fill(255);
    img1 = loadImage("L.jpg");
    image(img1,950,570);
    //rect(x, 0, width/10, height)
  }
 
  if (x == 600) {
    fill(255);
    img1 = loadImage("D.jpg");
    image(img1,1000,570);
    //rect(x, 0, width/10, height)
  }
 
  if (x== 660) {
    fill (255);
    x = -60;
    rect(0, 0, width, height);
  }   
   
  x = x+60;
   
  }


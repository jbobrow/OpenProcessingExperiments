
PImage img2, img3, img4, img5;
float angle = 0;

void setup () {
  size(800,500);

  
 
  img2 = loadImage("13.png");
  img3 = loadImage("01.png");
  img4 = loadImage("06.png");
  img5 = loadImage("12.png");
  
  
   background(img2);
}

void draw(){
    

  
  image(img4,200,3,120,120);
  image(img5,710,14,70,70);
 
  
  pushMatrix();
  translate(390, 350);
  rotate(angle);
  image(img3,60,60,50,120);
  popMatrix();
 
  
  angle += 13;
  
   image(img5,0,552);
  
 
  
}



void keyPressed() {
  saveFrame("_######.png");
}



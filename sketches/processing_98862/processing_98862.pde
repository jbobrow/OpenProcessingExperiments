
/* @pjs preload="img.jpg,img2.jpg,img1.jpg,img3.jpg,img4.jpg,img5.jpg,img6.jpg,img7.jpg,img8.jpg"; */
PImage img,img2,img3,img4,img5,img1,img6,img7,img8;
int i = 0;
void setup(){
  size(800, 500, P3D);
  img = loadImage("img.jpg");
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  img4 = loadImage("img4.jpg");
  img5 = loadImage("img5.jpg");
  img6 = loadImage("img6.jpg");
  img7 = loadImage("img7.jpg");
  img8 = loadImage("img8.jpg");
}

void draw(){
  background(0);
  translate(width / 2, height / 2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  
  
  
  pushMatrix();
    rotateY(TWO_PI/8);
    beginShape();
    texture(img);
    vertex(-50, -100, 0, 0,   0);
    vertex( 50, -100, 0, 400, 0);
    vertex( 50,  100, 0, 400, 400);
    vertex(-50,  100, 0, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img1);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img2);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img3);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img4);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img5);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img6);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img7);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
    
    rotateY(TWO_PI/8);
    beginShape();
    texture(img8);
    vertex(-50, -100, -220, 0,   0);
    vertex( 50, -100, -220, 400, 0);
    vertex( 50,  100, -220, 400, 400);
    vertex(-50,  100, -220, 0,   400);
    endShape();
  popMatrix();  
}





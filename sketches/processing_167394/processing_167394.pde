
float spinspin;
float clr;
PImage img;
PImage bg;
PImage pic;
int cellsize = 15;
int cols, rows;
 
void setup() {
  size(634, 367);
  tint(255, 125);
  img = loadImage("wafflez2.png");
  background(img);
  cols = width/cellsize;
  rows = height/cellsize;
}


void draw() {
  //yeaton start//
      spinspin = spinspin + 0.5;
  
  translate(height/10,width/50,0);
    if (mouseX > 250) {
   rotateY(spinspin);
  }else if (mouseX <250) {
    clr = 0; 
    rotateY(cos(spinspin));
  } else {
   rotateX(-spinspin);
   clr = 255;
  } 
 
  
  ///yeaton end//
  
  //tang start//
  loadPixels();
//  for ( int i = 0; i < cols;i++) {
//    for ( int j = 0; j < rows;j++) {
//      int x = i*cellsize + cellsize/15;
//      int y = j*cellsize + cellsize/15;
//      int loc = x + y*width;          
      color c = img.pixels[loc];      
////    
      float z = (mouseX/(float)width) * brightness(img.pixels[loc]) - 100.0;
    
      pushMatrix();
      translate(x,y,z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();
//    }
//      
      //tang end//
      
      //sagaser start//
     
       if (mousePressed && (mouseButton == LEFT)) {
    fill(255,20,20,255);
  } else if (mousePressed && (mouseButton == RIGHT))
    fill(214,180,0,255);
    
  else {
  stroke(255);
  fill(255);
  }

  
  float d = dist(700,740, mouseX, mouseY);
  
  //sagaser end//
      ellipse(mouseX, mouseY, 80, 80);
    }
//    stroke(255);
//  }
//    line(150, 25, mouseX, mouseY);
//  }
  void mousePressed() {
    background(img);
//image(pic,0,400);
 fill(0,0,0);
    line(150, 25, mouseY, mouseX);
  }




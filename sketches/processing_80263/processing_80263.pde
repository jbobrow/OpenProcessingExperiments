
/* 
@pjs preload="sketch03a.jpg,sketch03b.jpg,sketch03c.jpg,sketch03d.jpg,sketch03e.jpg,sketch03f.jpg,sketch03mask.jpg";
*/


PImage img1, img2, img3, img4, img5, img6, maskImg;
PGraphics pg1, pg2, pg3, pg4, pg5, pg6;
float seq; //What image is currently showing
float y1, y2, y3, y4, y5, y6; //Y value of mask
float my; // How far the mouse has moved up or down;
float sy; // Selected Mask's Y

void setup(){
  size(500, 375);
  seq = 1;
  y1 = 0;
  y2 = 0;
  y3 = 0;
  y4 = 0;
  y5 = 0;
  y6 = 0;
  my = 0;
  img1 = loadImage("sketch03a.jpg");
  img2 = loadImage("sketch03b.jpg");
  img3 = loadImage("sketch03c.jpg");
  img4 = loadImage("sketch03d.jpg");
  img5 = loadImage("sketch03e.jpg");
  img6 = loadImage("sketch03f.jpg");
  maskImg = loadImage("sketch03mask.jpg");
  img1.loadPixels();
  img2.loadPixels();
  img3.loadPixels();
  img4.loadPixels();
  img5.loadPixels();
  img6.loadPixels();
  pg1 = createGraphics(500, 375, P2D);
  pg2 = createGraphics(500, 375, P2D);
  pg3 = createGraphics(500, 375, P2D);
  pg4 = createGraphics(500, 375, P2D);
  pg5 = createGraphics(500, 375, P2D);
  pg6 = createGraphics(500, 375, P2D);
  
}

void draw(){
  background(0);
  pg1.beginDraw();
  pg1.background(0);
  pg1.fill(255);
  pg1.image(maskImg, 0, y1);
  pg1.endDraw();
  
  pg2.beginDraw();
  pg2.background(0);
  pg2.fill(255);
  pg2.image(maskImg, 0, y2);
  pg2.endDraw();
  
  pg3.beginDraw();
  pg3.background(0);
  pg3.fill(255);
  pg3.image(maskImg, 0, y3);
  pg3.endDraw();
  
  pg4.beginDraw();
  pg4.background(0);
  pg4.fill(255);
  pg4.image(maskImg, 0, y4);
  pg4.endDraw();
  
  pg5.beginDraw();
  pg5.background(0);
  pg5.fill(255);
  pg5.image(maskImg, 0, y5);
  pg5.endDraw();
  
  pg6.beginDraw();
  pg6.background(0);
  pg6.fill(255);
  pg6.image(maskImg, 0, y6);
  pg6.endDraw();
  
  img1.mask(pg1);
  img2.mask(pg2);
  img3.mask(pg3);
  img4.mask(pg4);
  img5.mask(pg5);
  img6.mask(pg6);
  image(img6, 0, 0);
  image(img5, 0, 0);
  image(img4, 0, 0);
  image(img3, 0, 0);
  image(img2, 0, 0);
  image(img1, 0, 0);
  
  if(seq == 1){
    y1 = sy;
  } else if (seq == 2){
    y2 = sy;
  } else if (seq == 3){
    y3 = sy;
  } else if (seq == 4){
    y4 = sy;
  } else if (seq == 5){
    y5 = sy;
  } else if (seq == 6){
    y1 = sy;
  }
  
}
  
  
void mouseDragged(){
  if(mouseY > pmouseY) {
    my += 1;
  }
  
  if(my > 15){
    if(mouseY > pmouseY){
      sy += 12;
    }
  }
  
  if(sy > 400){ // If Selected image is off-screen
   if (seq == 1) {
     seq = 2;
      sy = 0;
      my = 0;
   } else if (seq == 2) {
     seq = 3;
      sy = 0;
      my = 0;
   } else if (seq == 3) {
     seq = 4;
      sy = 0;
      my = 0;
   } else if (seq == 4) {
     seq = 5;
      sy = 0;
      my = 0;
   } else if (seq == 5) {
     seq = 6;
      my = 0;
   }
  }
  
}

void mouseReleased(){
  my = 0;
}





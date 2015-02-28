
int p=255;
int b=255;
float y = 0;
int numFrames = 12;
int frame = 0;
int paperFrames = 8;
//add still animations
//add snow/rain/sunshine/smoke
//add globe

int paperframe = 0;
PImage[] images = new PImage [numFrames];
PImage standing;
PImage globe;
PImage[] papertexture = new PImage [paperFrames];

void setup(){
  size(600,600);
ellipseMode (CENTER);
imageMode (CENTER);
frameRate (10);
images[0] = loadImage ("a1.gif");
images[1] = loadImage ("a2.gif");
images[2] = loadImage ("a3.gif");
images[3] = loadImage ("a4.gif");
images[4] = loadImage ("a5.gif");
images[5] = loadImage ("a6.gif");
images[6] = loadImage ("a7.gif");
images[7] = loadImage ("a8.gif");
images[8] = loadImage ("a9.gif");
images[9] = loadImage ("a10.gif");
images[10] = loadImage ("a11.gif");
images[11] = loadImage ("a12.gif");
standing = loadImage ("standingstill.gif");
globe = loadImage ("globe2.gif");
papertexture[0] = loadImage ("paper1.gif");
papertexture[1] = loadImage ("paper1.gif");
papertexture[2] = loadImage ("paper2.gif");
papertexture[3] = loadImage ("paper2.gif");
papertexture[4] = loadImage ("paper3.gif");
papertexture[5] = loadImage ("paper3.gif");
papertexture[6] = loadImage ("paper4.gif");
papertexture[7] = loadImage ("paper4.gif");
}

void draw() {                 //trying to rotate only the ellipse
  background(255);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames 
  paperframe = (paperframe+1) % paperFrames;
  image(papertexture[paperframe % paperFrames], 300,300);
   
  fill(b);
  rect(545,20,20,20);
  fill(p);
  rect(570,20,20,20);
  if (mousePressed){
   if(mouseX>570 && mouseX <590 && mouseY>20 && mouseY<40){
     p=150;
     y--;
      for (int x = -100; x < width; x += images[0].width) { 
    image(images[frame % numFrames], 300, 190);
  }
   }
  if(mouseX>545 && mouseX <565 && mouseY>20 && mouseY<40){
     b=150;
     y++;
     for (int x = -100; x < width; x += images[0].width) {
      pushMatrix(); 
      scale(-1.0,1.0);
    image(images[frame % numFrames], -300, 190);
    popMatrix();
  }
  }
  
  
  }
 else{ 
  image(standing,300,190);
if(mouseX>570 && mouseX <590 && mouseY>20 && mouseY<40){
     p=200;

  }
  else{
if(mouseX>545 && mouseX <565 && mouseY>20 && mouseY<40){
    b=200;
 }
else{
  p=255;
  b=255;
}
}
 }
pushMatrix();
translate (300,600);
  rotate(radians(y));
  image(globe,0,0);
  popMatrix();

}

void mouseReleased() {
  if(mouseX>545 && mouseX <565 && mouseY>20 && mouseY<40){
     b=200;
  }
  if(mouseX>570 && mouseX <590 && mouseY>20 && mouseY<40){
     p=200;
  }
}




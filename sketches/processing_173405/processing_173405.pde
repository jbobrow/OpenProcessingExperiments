
//BODY 
//The code generates a canvas of between 2700 and 3500 pixels 
//(reduced by a Scale variable only accessible in the code... at the void setup) 
//and picks at ramdomly from a database of images 6 cropped pictures forming an abstract man and a frame with a color gradient at the background. 
//*When any key is pressed the code calculates new positions of new loaded pictures.
//*When mouse pressed saves a TIFF

//Written by Paco Rico with Processing. 
//http://pacorico.com

PImage imgBack;
PImage imgBack2;
float gScale;
int maxSizeX;
int maxSizeY;

// body
float imageNumber;
PImage img1;
PImage img1Copy;
PGraphics mask1;
float img1w, img1h;
float mask1x, mask1y;
float mask1w, mask1h;
float mask1xTotal, mask1yTotal;
//head

PImage img2;
PImage img2Copy;
PGraphics mask2;
float img2w, img2h;
float mask2x, mask2y;
float mask2w, mask2h;
float mask2xTotal, mask2yTotal;
// right arm

PImage img3;
PImage img3Copy;
PGraphics mask3;
float img3w, img3h;
float mask3x, mask3y;
float mask3w, mask3h;
float mask3xTotal, mask3yTotal;
// left arm

PImage img4;
PImage img4Copy;
PGraphics mask4;
float img4w, img4h;
float mask4x, mask4y;
float mask4w, mask4h;
float mask4xTotal, mask4yTotal;
// left leg

PImage img5;
PImage img5Copy;
PGraphics mask5;
float img5w, img5h;
float mask5x, mask5y;
float mask5w, mask5h;
float mask5xTotal, mask5yTotal;
// right leg 

PImage img6;
PImage img6Copy;
PGraphics mask6;
float img6w, img6h;
float mask6x, mask6y;
float mask6w, mask6h;
float mask6xTotal, mask6yTotal;

void setup()
{
  maxSizeX=int(random (2700,3300));
  maxSizeY=int(random (2900,3500));
  gScale =.2;//general scale for reduction of everything
  size(int(maxSizeX*gScale), int(maxSizeY*gScale));// CANVAS SIZE
  }

void draw()
{ 
  // body
  imageNumber = random (1,90);
  int bodyNumber = int (imageNumber);
  img1 = loadImage(bodyNumber +".jpg");
  img1w = img1.width;
  img1h = img1.height;
  mask1 = createGraphics(int(img1w), int(img1h), JAVA2D);//maximun possible size of clipped image??
  mask1x = random(img1w*.1, img1w*.5);//coordinate of mask from image1 origin
  mask1y = random(img1h*.1, img1h*.5);
  mask1w = random(img1w*.3, img1w*.7);//width of mask
  if (mask1w>img1.width-mask1x) {;
    mask1w=img1.width-mask1x;
    };
  mask1h = random(img1h*.3, img1h*.7);
  if (mask1h>img1.height-mask1y) {;
    mask1h=img1.height-mask1y;
    };
  mask1xTotal=maxSizeX/2+random(-mask1w*.6, mask1w*.2);//desired coordinates of final mask on screenfrom canvas origin (attention: the coordinates are from the hidden image corner of image1... not from he mask1)
    if (mask1w>width*.33) {;
    mask1yTotal=mask1yTotal-mask1yTotal*.33;
    };
  mask1yTotal=maxSizeY/2+random(-mask1h*.6, mask1h*.2);
    if (mask1h>height*.33) {;
    mask1yTotal=mask1yTotal-mask1yTotal*.33;
    };
  //head
  imageNumber = random (1,90);
  int headNumber = int (imageNumber);
  img2 = loadImage(headNumber+".jpg");
  img2w = img2.width;
  img2h = img2.height;
  mask2 = createGraphics(int(img2w), int(img2h), JAVA2D);//maximun possible size of clipped image??
  mask2x = random(img2w*.1, img2w*.5);//coordinate of mask from image1 origin
  mask2y = random(img2h*.1, img2h*.5);
  mask2w = random(img2w*.3, img2w*.7);//width of mask
  if (mask2w>img2.width-mask2x) {;
    mask2w=img2.width-mask2x;
    };
  mask2h = random(img2h*.3, img2h*.7);
  if (mask2h>img2.height-mask2y) {;
    mask2h=img2.height-mask2y;
    };
  mask2xTotal=mask1xTotal+random(100, 300);//desired coordinates of final mask on screen 
    if (mask2xTotal>mask1xTotal+mask1w) {;
    mask2xTotal=mask1xTotal-random (mask1w*.1,mask1w*.3);
    } else if (
      mask2w>mask1w*.6) {
      mask2xTotal=mask1xTotal-random (mask2w*.1,mask2w*.3);
    }


  mask2yTotal=mask1yTotal-mask2h;
  // right arm
  imageNumber = random (1,90);
  int rArmNumber = int (imageNumber);
  img3 = loadImage(rArmNumber +".jpg");
  img3w = img3.width;
  img3h = img3.height;
  mask3 = createGraphics(int(img3w), int(img3h), JAVA2D);//maximun possible size of clipped image??
  mask3x = random(img3w*.1, img3w*.5);//coordinate of mask from image1 origin
  mask3y = random(img3h*.1, img3h*.5);
  mask3w = random(img3w*.3, img3w*.7);//width of mask
  if (mask3w>img3.width-mask3x) {;
    mask3w=img3.width-mask3x;
    };
  mask3h = random(img3h*.3, img3h*.7);
  if (mask3h>img3.height-mask3y) {;
    mask3h=img3.height-mask3y;
    };
  if (mask3h>mask1h) {;
    mask3h=mask1h*random(.9, .7);
    };
  if (mask3h>mask1h) {;
    mask3h=mask1h-random (mask1h*.1,mask1h*.2);
    };
  mask3xTotal=mask1xTotal+mask1w;//desired coordinates of final mask on screen 
  mask3yTotal=mask1yTotal;
  // left arm
  imageNumber = random (1,90);
  int lArmNumber = int (imageNumber);
  img4 = loadImage(lArmNumber +".jpg"); 
  img4w = img4.width;
  img4h = img4.height;
  mask4 = createGraphics(int(img4w), int(img4h), JAVA2D);//maximun possible size of clipped image??
  mask4x = random(img4w*.1, img4w*.5);//coordinate of mask from image1 origin
  mask4y = random(img4h*.1, img4h*.5);
  mask4w = random(img4w*.3, img4w*.7);//width of mask
  if (mask4w>img4.width-mask4x) {;
    mask4w=img4.width-mask4x;
    };
  mask4h = random(img4h*.3, img4h*.7);
    if (mask4h>mask1h) {;
    mask4h=mask1h*random(.9, .7);
    };
    if (mask4h>img4.height-mask4y) {;
    mask4h=img4.height-mask4y;
    };
    if (mask4h>mask1h) {;
    mask4h=mask1h-random (mask1h*.1,mask1h*.2);
    };
  mask4xTotal=mask1xTotal-mask4w;//desired coordinates of final mask on screen 
  mask4yTotal=mask1yTotal;
  // left leg 
  imageNumber = random (1,90);
  int lLegNumber = int (imageNumber);
  img5 = loadImage(lLegNumber +".jpg");
  img5w = img5.width;
  img5h = img5.height;
  mask5 = createGraphics(int(img5w), int(img5h), JAVA2D);//maximun possible size of clipped image??
  mask5x = random(img5w*.1, img5w*.5);//coordinate of mask from image1 origin
  mask5y = random(img5h*.1, img5h*.5);
  mask5w = random(img5w*.3, img5w*.5);//width of mask
  if (mask5w>img5.width-mask5x) {;
    mask5w=img5.width-mask5x;
    };
  mask5h = random(img5h*.6, img5h*.9);
  if (mask5h>img5.height-mask5y) {;
    mask5h=img5.height-mask5y;
    };
  mask5xTotal=mask1xTotal-mask5w+random (mask1w*.2,mask1w*.6);//desired coordinates of final mask on screen 
    
  mask5yTotal=mask1yTotal+mask1h;
  // right leg 
  imageNumber = random (1,90);
  int rLegNumber = int (imageNumber);
  img6 = loadImage(rLegNumber +".jpg");
  img6w = img6.width;
  img6h = img6.height;
  mask6 = createGraphics(int(img6w), int(img6h), JAVA2D);//maximun possible size of clipped image??
  mask6x = random(img6w*.1, img6w*.5);//coordinate of mask from image1 origin
  mask6y = random(img6h*.1, img6h*.3);
  mask6w = random(img6w*.3, img6w*.5);//width of mask
  if (mask6w>img6.width-mask6x) {;
    mask6w=img6.width-mask6x;
    };
  mask6h = random(img6h*.6, img6h*.9);
  if (mask6h>img6.height-mask6y) {;
    mask6h=img6.height-mask6y;
    };
  mask6xTotal=mask5xTotal+mask5w+random(mask1w*.1, mask1w*.5);//desired coordinates of final mask on screen 
    if (mask6xTotal>mask1xTotal+mask1w) {;
    mask6xTotal=mask5xTotal+mask5w+random(mask1w*.1, mask1w*.3);
    };
  mask6yTotal=mask1yTotal+mask1h;

// The real Draw loop starts here

//the background
  //a gradient
  int x1 = int(random(img1.width));
  int y1 = int(random(img1.height));
  int x2 = int(random(img1.width));
  int y2 = int(random(img1.height));
  color cSample1 = img1.get(x1, y1);
  color cSample2 = img1.get(x2, y2);

  noStroke();
  
  setGradient1(0, 0, width, height, cSample1,cSample2,1);
  fill(255, 40);
  rect(0, 0, width, height);
  //and a picture
  imgBack=loadImage("cuadricula_milimetrada.png");
  blend(imgBack, 0, 0, int(imgBack.width), int(imgBack.height),int(random(40,60)), int(random(40,60)), int(imgBack.width*gScale), int(imgBack.height*gScale), OVERLAY); 

// body
  mask1.beginDraw();  
  mask1.background(0);
  mask1.fill(255);// Erase graphics 
  mask1.noStroke();
  mask1.rect(mask1x, mask1y, mask1w, mask1h);//x,y meaning coordinates relatives to original image
  mask1.endDraw();
  img1Copy = img1.get();// Copy the original image (kept as reference)
  img1Copy.mask(mask1);// Apply the mask
  image(img1Copy, (mask1xTotal-mask1x)*gScale, (mask1yTotal-mask1y)*gScale, img1.width*gScale, img1.height*gScale);// Display the final result mask+img1Copy from canvas origin to hidden image origin
  //head
  mask2.beginDraw();  
  mask2.background(0);
  mask2.fill(255);// Erase graphics 
  mask2.noStroke();
  mask2.rect(mask2x, mask2y, mask2w, mask2h);//x,y meaning coordinates relatives to original image
  mask2.endDraw();
  img2Copy = img2.get();// Copy the original image (kept as reference)
  img2Copy.mask(mask2);// Apply the mask
  image(img2Copy, (mask2xTotal-mask2x)*gScale, (mask2yTotal-mask2y)*gScale, img2.width*gScale, img2.height*gScale);// Display the final result mask+img1Copy from canvas origin to hidden image origin
  // right arm
  mask3.beginDraw();  
  mask3.background(0);
  mask3.fill(255);// Erase graphics 
  mask3.noStroke();
  mask3.rect(mask3x, mask3y, mask3w, mask3h);//x,y meaning coordinates relatives to original image
  mask3.endDraw();
  img3Copy = img3.get();// Copy the original image (kept as reference)
  img3Copy.mask(mask3);// Apply the mask
  image(img3Copy, (mask3xTotal-mask3x)*gScale, (mask3yTotal-mask3y)*gScale, img3.width*gScale, img3.height*gScale);// Display the final result mask+img1Copy from canvas origin to hidden image origin
  // left arm
  mask4.beginDraw();  
  mask4.background(0);
  mask4.fill(255);// Erase graphics 
  mask4.noStroke();
  mask4.rect(mask4x, mask4y, mask4w, mask4h);//x,y meaning coordinates relatives to original image
  mask4.endDraw();
  img4Copy = img4.get();// Copy the original image (kept as reference)
  img4Copy.mask(mask4);// Apply the mask
  image(img4Copy, (mask4xTotal-mask4x)*gScale, (mask4yTotal-mask4y)*gScale, img4.width*gScale, img4.height*gScale);// Display the final result mask+img1Copy from canvas origin to hidden image origin
  // left leg 
  mask5.beginDraw();  
  mask5.background(0);
  mask5.fill(255);// Erase graphics 
  mask5.noStroke();
  mask5.rect(mask5x, mask5y, mask5w, mask5h);//x,y meaning coordinates relatives to original image
  mask5.endDraw();
  img5Copy = img5.get();// Copy the original image (kept as reference)
  img5Copy.mask(mask5);// Apply the mask
  image(img5Copy, (mask5xTotal-mask5x)*gScale, (mask5yTotal-mask5y)*gScale, img5.width*gScale, img5.height*gScale);// Display the final result mask+img1Copy from canvas origin to hidden image origin
  // right leg 
  mask6.beginDraw();  
  mask6.background(0);
  mask6.fill(255);// Erase graphics 
  mask6.noStroke();
  mask6.rect(mask6x, mask6y, mask6w, mask6h);//x,y meaning coordinates relatives to original image
  mask6.endDraw();
  img6Copy = img6.get();// Copy the original image (kept as reference)
  img6Copy.mask(mask6);// Apply the mask
  image(img6Copy, (mask6xTotal-mask6x)*gScale, (mask6yTotal-mask6y)*gScale, img6.width*gScale, img6.height*gScale);// Display the final result mask+img1Copy from canvas origin to hidden image origin
  
  //frame
  //inner frame
  fill(255);
  noStroke();
    //horizontal
  rect(0,0, width,random(.14*height,.17*height));
  rect(0,height-random(.14*height,.17*height), width,.17*height);
  //middle frame
  fill(cSample2);
  noStroke();
    //horizontal
  rect(0,0, width,random(.09*height,.13*height));
  rect(0,height-random(.09*height,.13*height), width,.13*height);
    //vertical
  rect(0,0, random(.09*width,.13*width), height);
  rect(width-random(.09*height,.13*height),0,.13*height, height);
  //outer frame
  fill(255);
  noStroke();
    //horizontal
  rect(0,0, width,random(.02*height,.08*height));
  rect(0,height-random(.02*height,.08*height), width,.08*height);
    //vertical
  rect(0,0, random(.02*width,.08*width), height);
  rect(width-random(.02*height,.08*height),0,.08*height, height);

  noLoop();
  
}

void keyPressed() {
    if (keyPressed == true) {redraw();
    }
}

void mousePressed() {
  if (mousePressed) {
  noLoop ();
  saveFrame();} 
}

//function for creating a color gradient in the rectangle x,y,w,h. Funtion thanks to http://processing.org/examples/lineargradient.html
void setGradient1(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == 1) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);//value i that is between y and y+h is converted between 0 and 1
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == 2) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

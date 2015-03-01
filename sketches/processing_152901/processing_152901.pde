
PImage myImg;
color[] pixCol;
int Pix;

void setup() {
  
  size(500,500);
  background(255);
  myImg = loadImage("Cloud Tree.jpg");
  
  pixCol = new color[11];
  Pix = 0;

}

void draw() {
  
  // read the colours for the current scanLine
  for (int i=10; i>=0; i--) {
    pixCol[i] = myImg.get(width/2, Pix*i);
    
     if (Pix*i > height) {
        Pix = 0;
        }
    
  }
  
    // increment scan line position every second frame  
    // start back from top once at the bottom
    
  if (frameCount % 8 == 0) {
    Pix ++;
    }
 
    
  // draw the image
  image(myImg, 0-width/8,0-height/8);

  for (int i=10; i>=0; i--) {
  blendMode(BLEND);
    if (i<8) {
    stroke(pixCol[i+2]);
    }
    else {
    stroke(pixCol[i-1]);
    }
  fill(pixCol[i]);
  ellipse(width/2, height/2, i*45, i*45);
  }
  
  
  // draw circles over where the "scanner" is currently reading pixel values
  for (int i=10; i>=0; i--) {
    stroke(pixCol[i]);
    noFill();
    ellipse(width/2, Pix*i, 5, 5 );
  }

}

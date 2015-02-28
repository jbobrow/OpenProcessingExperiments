
/*
 Tile Maker II / Tom Heath 2009
 continuously variable remix
 
 Click and hold left button to show source image
 c = page through source images
 s = save to disk
 +/- change tile size
 SPACE changes drawing mode
*/

int cs=64;
int mode=0;

String[] images = {"majorelle.jpg","minster.jpg","hongkong.jpg","alnwick.jpg","hoverfly.jpg","souter.jpg","glastonbury.jpg"}; 
int src=0; 

PImage srcImg;

void setup() {
  size(640,640,P2D);
  srcImg=loadImage(images[src]);
}

void draw() {
  if (mousePressed) {
    background(0);
    image(srcImg,(width-srcImg.width)/2,(height-srcImg.height)/2,srcImg.width,srcImg.height);      
  }
  else { // mouseNOTpressed
    for (int x=0; x<width; x+=cs) {
      for (int y=0; y<height; y+=cs) {
        float x_co = (srcImg.width-cs-(width/cs))*((float)mouseX/width);
        float y_co = (srcImg.height-cs-(height/cs))*((float)mouseY/height);
        image(makeTile(srcImg.get(int(x_co+((x-x_co)/cs)),int(y_co+((y-y_co)/cs)),cs,cs)),x,y); 
      }
    }
  }
  noLoop(); // no need to redraw without input
}

PImage makeTile(PImage b) {
  color c = color(0);
  int s=b.height-1;
  for (int x=0; x<=b.width/2; x++) {
    for (int y=0; y<=b.height/2; y++) {
      switch(mode) { // sources from...
      case 0: 
        c = b.get(x,y); 
        break; // top left
      case 1: 
        c = b.get(s-x,y); 
        break; // top right
      case 2: 
        c = b.get(s-x,s-y); 
        break; // bottom right
      case 3: 
        c = b.get(x,s-y); 
        break;
      }
      b.set(x,y,c);
      b.set(s-x,y,c);
      b.set(x,s-y,c);
      b.set(s-x,s-y,c);

    }
  }
  return b;
}

// interaction stuff

void keyReleased() {
  switch(key) {
  case ' ':
    mode = (mode+1)%4; 
    break;
  case 'c':
  case 'C':
    src = (src+1) % images.length;
    srcImg=loadImage(images[src]);
    break;
  case 's':
  case 'S':
    //saveFrame(images[src]+"_"+cs+"_"+mode+"_###.png"); 
    break;
  }
  loop();
}

void keyPressed() {
 switch(key) {
  case '-':
  case '_': 
    cs = constrain(cs-1,16,256); 
    break;
  case '=':
  case '+':  
    cs = constrain(cs+1,16,256); 
    break;
  }
  loop();
}

void mouseMoved() {
  loop();
}
void mousePressed() {
  loop();
}
void mouseReleased() {
  loop();
}






/* Tile Maker / Tom Heath 2009
 inspired by Hexagon Stitchery by Devon Eckstein (http://www.openprocessing.org/visuals/?visualID=1288)
 though not in the same league!
 
 Click and hold left button to tile selected element across canvas
 Click and hold right button to show source image
 +/- change tile size
 SPACE changes drawing mode
 
 Appropriately enough, the photo is of the Museum of Islamic Art at Majorelle Gardens in Marrakech
 */

int cs=64;
int mode=0;
String src = "IMG_0107.JPG";

PImage srcImg;

void setup() {
  size(384,512,P2D);
  srcImg=loadImage(src);
}

void draw() {
  if (mousePressed) {
    if (mouseButton == CENTER) { // show original image
      image(srcImg,0,0,width,height);      
    } 
    else {
      int x_co = (mouseX/cs)*(cs);
      int y_co = (mouseY/cs)*(cs);
      for (int x=0; x<width; x+=cs) {
        for (int y=0; y<height; y+=cs) {
          if (mouseButton == LEFT) {  // paint selected tile
            image(get(x_co,y_co,cs,cs),x,y);
          }
          else if (mouseButton == RIGHT) { // paint selected tile with variations
            image(makeTile(srcImg.get(x_co+((x-x_co)/cs),y_co+((y-y_co)/cs),cs,cs)),x,y); 
          }
        }
      }
    }


  } 
  else { // mouseNOTpressed
    image(srcImg,0,0,width,height); // draw all tiles
    for (int x=0; x<width; x+=cs) {
      for (int y=0; y<height; y+=cs) {
        image(makeTile(get(x,y,cs,cs)),x,y); 
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
        break; // bottom left
        /*      case 4: // ... interpolates the verticals
         c = lerpColor(b.get(x,y),b.get(x,s-y),0.5);
         break;
         case 5: // ... interpolates the horizontals
         c = lerpColor(b.get(x,y),b.get(s-x,y),0.5);
         break;
         case 6: // ... interpolates opposite corners
         c = lerpColor(b.get(x,y),b.get(s-x,s-y),0.5);
         break;
         case 7: // ... or the other opposite corners
         c = lerpColor(b.get(s-x,y),b.get(x,s-y),0.5);
         break;
         case 8: // ... oh .. or the other horizontals
         c = lerpColor(b.get(x,s-y),b.get(s-x,s-y),0.5);
         break;
         case 9: // ... the other verticals
         c = lerpColor(b.get(s-x,y),b.get(s-x,s-y),0.5);
         break;
         case 10: // ... or (finally) averages all four corners
         c = lerpColor(lerpColor(b.get(x,y),b.get(s-x,y),0.5),lerpColor(b.get(x,s-y),b.get(s-x,s-y),0.5),0.5);
         break; */
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
  case '-':
  case '_': 
    cs = constrain(cs/2,16,256); 
    break;
  case '=':
  case '+':  
    cs = constrain(cs*2,16,256); 
    break;
  case ' ':
    mode = (mode+1)%4; 
    break;
  case 's':
  case 'S':
//    saveFrame(src+"_"+cs+"_"+mode+"_###.png"); 
    break;
  }
  loop();
}

void mouseReleased() {
  loop();
}

void mousePressed() {
  loop();
}













//Click '1' & '2' for different modes
//Mode 1 = click mouse to change speed of stop motion animation
//Mode 2 = move mouse around to see changes in filtering for a portion of the image, click and drag mouse to see filter change for entire image.
//References: 1) Processing: A Programming Handbook for Visual Designers and Artists, pages 315-317 & 2) http://processing.org/learning/topics/convolution.html

int numFrames = 53;
int frame = 0;
int mode = 1;
int numLoops;
int w = 80;
PImage[] images = new PImage[numFrames];
PImage hall;

 float[][] matrix = { { -1, -1, -1 },
                       { -1,  9, -1 },
                       { -1, -1, -1 } }; 
float x,y,dX,dY,easing;

void setup(){

  size(800,533);
  frameRate(10);
  images[0] = loadImage("1.jpg");
  images[1] = loadImage("2.jpg");
  images[2] = loadImage("3.jpg");
  images[3] = loadImage("4.jpg");
  images[4] = loadImage("5.jpg");
  images[5] = loadImage("6.jpg");
  images[6] = loadImage("7.jpg");
  images[7] = loadImage("8.jpg");
  images[8] = loadImage("9.jpg");
  images[9] = loadImage("10.jpg");
  images[10] = loadImage("11.jpg");
  images[11] = loadImage("12.jpg");
  images[12] = loadImage("13.jpg");
  images[13] = loadImage("14.jpg");
  images[14] = loadImage("15.jpg");
  images[15] = loadImage("16.jpg");
  images[16] = loadImage("17.jpg");
  images[17] = loadImage("18.jpg");
  images[18] = loadImage("19.jpg");
  images[19] = loadImage("20.jpg");
  images[20] = loadImage("21.jpg");
  images[21] = loadImage("22.jpg");
  images[22] = loadImage("23.jpg");
  images[23] = loadImage("24.jpg");
  images[24] = loadImage("25.jpg");
  images[25] = loadImage("26.jpg");
  images[26] = loadImage("27.jpg");
  images[27] = loadImage("28.jpg");
  images[28] = loadImage("29.jpg");
  images[29] = loadImage("30.jpg");
  images[30] = loadImage("31.jpg");
  images[31] = loadImage("32.jpg");
  images[32] = loadImage("33.jpg");
  images[33] = loadImage("34.jpg");
  images[34] = loadImage("35.jpg");
  images[35] = loadImage("36.jpg");
  images[36] = loadImage("37.jpg");
  images[37] = loadImage("38.jpg");
  images[38] = loadImage("39.jpg");
  images[39] = loadImage("40.jpg");
  images[40] = loadImage("41.jpg");
  images[41] = loadImage("42.jpg");
  images[42] = loadImage("43.jpg");
  images[43] = loadImage("44.jpg");
  images[44] = loadImage("45.jpg");
  images[45] = loadImage("46.jpg");
  images[46] = loadImage("47.jpg");
  images[47] = loadImage("48.jpg");
  images[48] = loadImage("49.jpg");
  images[49] = loadImage("50.jpg");
  images[50] = loadImage("51.jpg");
  images[51] = loadImage("52.jpg");
  images[52] = loadImage("53.jpg");
  
  hall = loadImage("hall.jpg");
 
  
}

void draw(){
  if(mode == 1){
  frame++;
  if (frame == numFrames) {
    frame = 0;
  }
  image(images[frame], 0, 0);
}else if(mode == 2){
 
  image(hall,0,0);
   dX = mouseX - x;
  dY = mouseY - y;
   x = x + dX*easing;
  y = y + dY*easing;
 
  int xstart = constrain(mouseX-w/1,0,hall.width);
  int ystart = constrain(mouseY-w/1,0,hall.height);
  int xend = constrain(mouseX+w/1,0,hall.width);
  int yend = constrain(mouseY+w/1,0,hall.height);
  int matrixsize = 3;
  loadPixels();
  
  for (int x = xstart; x < xend; x++) {
    for (int y = ystart; y < yend; y++ ) {
      color c = convolution(x,y,matrix,matrixsize,hall);
      int loc = x + y*hall.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
}
}
color convolution(int x, int y, float[][] matrix,int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
   
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + hall.width*yloc;
      
      loc = constrain(loc,0,hall.pixels.length-1);
  
      rtotal += (red(hall.pixels[loc]) * matrix[i][j]);
      gtotal += (green(hall.pixels[loc]) * matrix[i][j]);
      btotal += (blue(hall.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal,0,255);
  gtotal = constrain(gtotal,0,255);
  btotal = constrain(btotal,0,255);
  // Return the resulting color
  return color(rtotal,gtotal,btotal);
}

void keyPressed(){
  if(key == '1'){
    mode = 1;
  }else if(key == '2'){
    mode = 2;
   
  }
}

void mouseReleased(){
  if(mode == 1){
  frameRate(random(1,30.0));
  }
} 
 void mouseDragged(){
   if(mode == 2){
     image(hall,0,0);
     filter(POSTERIZE,4);
   }
 }



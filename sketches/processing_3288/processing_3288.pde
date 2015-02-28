
/**
 *  Pulsing spheres 
 * Expansion of Fire Cube demo effect done by luis2048.
 * 

 */
 
// This will contain the pixels used to calculate the fire effect
int[][] fire;

// Flame colors
color[] palette;
color[] palette2;
color[] palette3;
color[] palette4;
color[] palette5;
color[] palette6;
color[] palette7;
color[] palette8;
color[] palette9;
color[] palette10;
color[] palette11;
color[] palette12;
color[] palette13;
color[] palette14;

float angle;
int[] calc1,calc2,calc3,calc4,calc5;
float sizegraphics = 5.5;
int direction = 1;
int pulsecolor=1;

float iter =0.124;
float iter_orig = iter;
int fixedX =0;
int fixedY =0;
int isFixed=0;

PGraphics pg;

void setup(){
  size(800, 600, P2D);
  
  // Create buffered image for 3d cube
  pg = createGraphics(width, height, P3D);

  calc1 = new int[width];
  calc3 = new int[width];
  calc4 = new int[width];
  calc2 = new int[height];
  calc5 = new int[height];

  colorMode(HSB);

  fire = new int[width][height];
  palette = new color[255];
  palette2 = new color[255];
  palette3 =  new color[255];
  palette4 = new color[255];
  palette5 = new color[255];
  palette6 = new color[255];
  palette7 = new color[255];
  palette8 = new color[255];
  palette9 = new color[255];
  palette10 = new color[255];
  palette11 = new color[255];
  palette12 = new color[255];
  palette13 = new color[255];
  palette14 = new color[255];
  

  // Generate the palette
  for(int x = 0; x < palette.length; x++) {
    //Hue goes from 0 to 85: red to yellow
    //Saturation is always the maximum: 255
    //Lightness is 0..255 for x=0..128, and 255 for x=128..255
    
    palette[x] = color(x/3, 255, constrain(x*3, 0, 255));
    palette2[x] = color(x/3, 255, constrain(x*3, 0, 255));
    palette3[x] = color(constrain(x+80,0,255), 255, constrain(x*3, 0, 255));
    
    palette4[x] = color(constrain(x*2,0,255), 255, constrain(x*2, 0, 255));
    palette5[x] = color(constrain(x+30,0,255), 255, constrain(x*6, 0, 255));
    palette6[x] = color(constrain(x*4,0,255), 255, constrain(x*4, 0, 255));
    palette7[x] = color(constrain(x/2,0,255), 255, constrain(x*5, 0, 255));
    
    palette8[x] = color(constrain(x-10,0,255), 255, constrain(x*2, 0, 255));
    palette9[x] = color(constrain(x-20,0,255), 255, constrain(x*5, 0, 255));
    palette10[x] = color(constrain(x-30,0,255), 255, constrain(x*7, 0, 255));
    palette11[x] = color(constrain(x-40,0,255), 255, constrain(x*5, 0, 255));
    palette12[x] = color(constrain(x-50,0,255), 255, constrain(x*4, 0, 255));
    palette13[x] = color(constrain(x-80,0,255), 255, constrain(x*8, 0, 255));
    palette14[x] = color(constrain(x-100,0,255), 255, constrain(x*3, 0, 255));
    
  
    
  }

  // Precalculate which pixel values to add during animation loop
  // this speeds up the effect by 10fps
  for (int x = 0; x < width; x++) {
    calc1[x] = x % width;
    calc3[x] = (x - 1 + width) % width;
    calc4[x] = (x + 1) % width;
  }
  
  for(int y = 0; y < height; y++) {
    calc2[y] = (y + 1) % height;
    calc5[y] = (y + 2) % height;
  }
}

void keyTyped() {
  if (int(key) ==32){  // if someone presses space
  println("typed " + int(key) + " " + keyCode);
  
    
  fixedX = mouseX;
  fixedY = mouseY;
  
  if(isFixed==0){
   isFixed=1; 
  }else{
   isFixed=0; 
  }
  
  }
}

void draw() {
  angle = angle + 0.008;

  if(angle >7.05){
   angle = 4.5; 
  }
  


  // Rotating wireframe cube
  pg.beginDraw();
//  pg.translate(width >> 1, height >> 1);

 if(isFixed==0){
pg.translate(  mouseX,  mouseY);

 }
  if(isFixed==1){
pg.translate(  fixedX,  fixedY);

 }
 
 
//mouseX
//  pg.rotateX(sin(angle/2.5));
//  pg.rotateY(tan(angle/4));
  
  pg.rotateX((sin(angle/2.5)) * QUARTER_PI);
  pg.rotateY((tan(angle/4)) );
  pg.rotateZ((cos(angle/1.5)) - QUARTER_PI);
  pg.background(0);
  pg.stroke(128);
  pg.scale(25);
  pg.noFill();
  pg.sphereDetail(10);
  
  //println ("angle= "+angle + " rotateX= "+ sin(angle/2.5) +" rotateY= "+ tan(angle/4)) ;

  
    if ((mousePressed == true)&& mouseButton== LEFT) {
  iter = iter + 0.001;
  println("iter = "+ iter);
  }
  
  if ((mousePressed == true)&& mouseButton== CENTER) {
  iter =iter_orig;
 
    println("iter = "+ iter);
  }
  
  
if ((mousePressed == true)&& mouseButton== RIGHT) {
  
  iter = iter - 0.001;
  
  if (iter<0){
   iter =0; 
  }
    println("iter = "+ iter);
  }
   
   if(direction == 1){
    sizegraphics = sizegraphics + iter; 
   }
   if(direction == -1){
    sizegraphics = sizegraphics - iter; 
   }
   
   
 if(sizegraphics >15){
  direction = -1; 
 }
 if(sizegraphics < 0.5){
  direction = 1; 
   
  pulsecolor++;
  if(pulsecolor >13){
  pulsecolor=1;
  }
  println("pulsecolor= "+pulsecolor);
  
 }
  
  pg.sphere(sizegraphics);
  
  
  pg.sphere(abs(sizegraphics -15));
  
  pg.endDraw();

  // Randomize the bottom row of the fire buffer
  for(int x = 0; x < width; x++)
  {
    fire[x][height-1] = int(random(10,250)) ;
  }

  loadPixels();

  int counter = 0;
  // Do the fire calculations for every pixel, from top to bottom
  for (int y = 0; y < height; y++) {
    for(int x = 0; x < width; x++) {
      // Add pixel values around current pixel

      fire[x][y] =
          ((fire[calc3[x]][calc2[y]]
          + fire[calc1[x]][calc2[y]]
          + fire[calc4[x]][calc2[y]]
          + fire[calc1[x]][calc5[y]]) << 5) / 129;

      // Output everything to screen using our palette colors
      if(pulsecolor==1){
            pixels[counter] = palette2[fire[x][y]];
      }
      if(pulsecolor==2){
            pixels[counter] = palette3[fire[x][y]];
      }
            if(pulsecolor==3){
            pixels[counter] = palette4[fire[x][y]];
      }
            if(pulsecolor== 4){
            pixels[counter] = palette5[fire[x][y]];
      }
            if(pulsecolor== 5){
            pixels[counter] = palette6[fire[x][y]];
      }
            if(pulsecolor== 6){
            pixels[counter] = palette7[fire[x][y]];
      }
            if(pulsecolor== 7){
            pixels[counter] = palette8[fire[x][y]];
      }
            if(pulsecolor== 8){
            pixels[counter] = palette9[fire[x][y]];
      }
            if(pulsecolor== 9){
            pixels[counter] = palette10[fire[x][y]];
      }
            if(pulsecolor== 10){
            pixels[counter] = palette11[fire[x][y]];
      }
            if(pulsecolor== 11){
            pixels[counter] = palette12[fire[x][y]];
      }
            if(pulsecolor== 12){
            pixels[counter] = palette13[fire[x][y]];
      }
            if(pulsecolor== 13){
            pixels[counter] = palette14[fire[x][y]];
      }
           

      // Extract the red value using right shift and bit mask 
      // equivalent of red(pg.pixels[x+y*w])
      if ((pg.pixels[counter++] >> 16 & 0xFF) == 128) {
        // Only map 3D cube 'lit' pixels onto fire array needed for next frame
        fire[x][y] = 128;
      }
    }
  }
  updatePixels();
}


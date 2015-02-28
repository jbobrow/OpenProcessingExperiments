
PImage a;
int half_w = 30;

void setup()
{
  
/*  //load an image from your computer
  String imgName = selectInput();
  if(imgName!=null){
    a = loadImage(imgName);
  }
  else{
  a = loadImage("caity_inking.jpg");
  }
*/  
  
  //load a demo image
  a = loadImage("bugnfrog.jpg");
   
  size(560, 760);  //demo size
//  size(screen.width, screen.height);
  noStroke();
  smooth();
  imageMode(CENTER);
}

void draw() {

  background(0,0,0);
  float widthscale = (float)(width-20)/a.width;
  float heightscale = (float)(height-20)/a.height;
  float scaleamount = min(widthscale, heightscale);
  scale(scaleamount);

  int x = 0;
  int y = 0;


  int half_h = int(half_w*sqrt(3)/2);
  int hex_offset = int(1.5*half_w);

  int w = 2*half_w;
  int h = 2*half_h;

  //create a mask
  PGraphics wedge_mask;
  wedge_mask = createGraphics(w, h, JAVA2D);
  wedge_mask.beginDraw();
  wedge_mask.background(0);
  wedge_mask.triangle(half_w-1,0,1.5*half_w+1,0,half_w-1,half_h+3);
  wedge_mask.endDraw();

  //move in a hex grid around the image

  for (int i = w; i < a.width-2*w; i += 1.5*w) {
    for (int j = h; j < a.height-2*h; j += 1*h) {
      x = i;
      y = j;

      PImage block = createImage(w, h, RGB);
      block = a.get(x, y, w, h); 
      block.mask(wedge_mask);

      image(block, x, y);
      kalify(block, x, y);

      int x_mid;
      int y_mid;

      x_mid = x + hex_offset;
      y_mid = y + half_h;

      PImage block_mid = createImage(w, h, RGB);
      block_mid = a.get(x_mid, y_mid, w, h); 
      block_mid.mask(wedge_mask);
      image(block_mid, x_mid, y_mid);
      kalify(block_mid, x_mid, y_mid);

    }//end j
  }//end i
}
void kalify(PImage working_wedge,int cent_x,int cent_y){
  int x=cent_x;//x coordinate of center of hexagon
  int y=cent_y;//y coordinate of center of hexagon

  //complete rotations
  pushMatrix();
  translate(x,y);
  for(int k = 0; k<=5 ;k++){
    rotate(PI/3);
    image(working_wedge, 0, 0);
  }
  popMatrix();
  
  //complete reflected rotations
  pushMatrix();
  translate(x,y);
  //reflect first
  working_wedge.loadPixels();
  // Begin loop for width
  for (int i = 0; i < working_wedge.width; i++) {
    // Begin loop for height
    for (int j = 0; j < working_wedge.height; j++) {      
      working_wedge.pixels[j*working_wedge.width+i] = 
        working_wedge.pixels[(working_wedge.width - i - 1) + j*working_wedge.width]; // Reversing x to mirror the image
    }
  }
  working_wedge.updatePixels(); 

  //turn next
  for(int k = 0; k<=5 ;k++){
    rotate(PI/3);
    image(working_wedge, 0, 0);
  }
  popMatrix();
}
 
 void mouseClicked(){
   if(mouseY<=height/2 && half_w>10){
    half_w -= 5;
   }
   else if(half_w<min(height/2,width/2)){half_w += 5;}
 }
 
 //saving by pressing "s"
/*
 void keyPressed(){ 
 if (key=='s' || key =='S'){
   String savePath = selectOutput("Choose a filename, sucka.");  // Opens file chooser

  if (savePath!=null) {
    save(savePath +".png");
  }// If a destination was chosen, save the current image as a png file where chosen. 

 }

 }

*/




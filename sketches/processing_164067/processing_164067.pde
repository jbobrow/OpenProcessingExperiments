
/* @pjs preload="timthumb.jpg"; 
 */




PImage img; 

boolean[] invert;
int stagewidth; 
int stageheight;

void setup() {
 img = loadImage("timthumb.jpg");
 stagewidth=img.width;
 stageheight=img.height;
  size(800,600,P2D);
 colorMode(RGB);

 
  background(img);
frameRate(30);
  loadPixels();
  img.loadPixels();
  smooth();
  invert=new boolean[pixels.length];
  for(int z=0;z<invert.length;z++)
  invert[z]=true;


}

void draw(){
updatePixels();
if(keyPressed){
if(key==' '){
img=loadImage("timthumb.jpg");
image(img,0,0);
img.loadPixels();
loadPixels();
img.updatePixels();
updatePixels();
}
}
  }
    


void mouseClicked(){
  if(mouseButton==LEFT){
  for(int m = 0; m <height;m++){
    for(int n=0;n <width;n++){
   if(dist(mouseX,mouseY,n,m)<200){
  
   pixels[m*width+n]=color(255-red(pixels[m*width+n]),255-green(pixels[m*width+n]),255-blue(pixels[m*width+n]));
  img.pixels[m*width+n]=pixels[m*width+n];
   }
   }
  
}
  }
  if(mouseButton==RIGHT){
    for(int m = 0; m <height;m++){
    for(int n=0;n <width;n++){
   if(dist(mouseX,mouseY,n,m)<200){
  if(m*width+n>0+n && m*width+n<height*width+n){
   pixels[m*width+n]=img.pixels[(height-m)*width-n];
   pixels[(height-m)*width-n]=img.pixels[m*width+n];
   
   img.pixels[m*width+n]=pixels[m*width+n];
  img.pixels[(height-m)*width-n]=pixels[(height-m)*width-n];
  }
   }
   }
  
} 
  }
 
  
 img.updatePixels();
}

void mouseDragged(){
 if(mouseButton==LEFT){
  for(int m = 0; m <height;m++){
    for(int n=0;n <width;n++){
   if(dist(mouseX,mouseY,n,m)<200){
  if(invert[m*width+n]){
   pixels[m*width+n]=color(255-red(pixels[m*width+n]),255-green(pixels[m*width+n]),255-blue(pixels[m*width+n]));
  img.pixels[m*width+n]=pixels[m*width+n];
  }
  invert[m*width+n]=false;
  }
   }
  
}
  }
  if(mouseButton==RIGHT){
  
    for(int m = 0; m <height;m++){
    for(int n=0;n <width;n++){
   if(dist(mouseX,mouseY,n,m)<200){
     if(invert[m*width+n]){
  if(m*width+n>0+n && m*width+n<height*width+n){
   pixels[m*width+n]=img.pixels[(height-m)*width-n];
   pixels[(height-m)*width-n]=img.pixels[m*width+n];
   
   img.pixels[m*width+n]=pixels[m*width+n];
  img.pixels[(height-m)*width-n]=pixels[(height-m)*width-n];
  }
     }
     invert[m*width+n]=false;
   }
   }
  
} 
  }
  if(mouseButton==CENTER){
 float d;
float red;
float green;
float blue;
//radius of the mouse...will explain more later
int rad =7;

  //loop to go through every pixel, i=y value, j=x value
  for(int i=0;i<height;i++){
    for(int j=0;j<width;j++){
      
        
        //grabs pixel's current color
        color c = pixels[i*width+j];
        if(dist(mouseX,mouseY,j,i)<150){
        //the actual glitch! <<number and & 0xff mess 
        //with the binary code and completely destroy the colors
        //very fun to mess around with. dont be afraid to tweak!        
        red = c <<2 & 0xff;
        green = c <<4 & 0xaa;
        blue = c  & 0xff;
        
        //gets distance from mouse to pixel
      //the *.4 at the end changes the "saving" area of effect:
      //when the mouse is at rest and the colors dont change.
      //higher value = smaller area
        d =dist(mouseX,mouseY,j,i)*.4;
       
       //make the colors change depending on distance to mouse       
        //rad = radius of the innermost circle
      //  red += 50/d-rad;
      //  green += 50/d-rad;
      //  blue += 155/d-rad;
          
        //changes the pixel to the glitched pixel
        pixels[i*width+j]=color(red,green,blue);
        img.pixels[i*width+j]=color(red,green,blue);
        }
       
    }
  }
 
  }
  updatePixels();
 img.updatePixels();
}
void mouseReleased(){
for(int l=0;l<invert.length;l++)
invert[l]=true;
}
void keyPressed(){
if(key!=' ')
saveFrame("asdf.png");
}



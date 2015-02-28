
//Romina de Grote
//Image Sketch with for loop to break the image and blend function with lightest mode
void setup(){
size(800,600); 


}
void draw(){
  PImage img1 = loadImage("otoño.jpg"); 
  PImage img2 = loadImage("butterfly.png"); 
  int w = width/24;
  int h = height/32;
  
  for (int i=0; i<width; i+=w){ 
  for (int j=0; j<height; j+=h){
    int srcX = int(random(width-w)); 
    int srcY = int(random(height-h)); 
    int srcW = int(random(w));
    int srcH = int(random(h));
    img1.blend(img2, srcX, srcY, srcW, srcH, i, j, w, h, LIGHTEST);
  }
 } 
image(img1, 0, 0); 
}


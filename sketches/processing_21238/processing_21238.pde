
PImage img;

void setup(){
size(639, 478);
img = loadImage("img.png");
}


void draw() {
  background(img);

  
  loadPixels();  


for (int i = 0; i < width*height; i++) {
 color p = pixels[i ];
 float b = blue(p);
 float r =  200 - red(p);
 float g = 100 + green(p);
 float s = (r+g+b)/6.0;
 s = constrain(mouseX + mouseY,0,255);
 pixels[i] = color(r,g,b);
 
 
   
  

}
updatePixels(); 

}






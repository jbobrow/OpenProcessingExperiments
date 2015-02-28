
float d;
float red;
float green;
float blue;
//radius of the mouse...will explain more later
int rad =3;
void setup(){
 //colorMode(HSB, 255);
  size(400,400);  
  background(0);
 // smooth();
  
}

void draw(){
  loadPixels();
  //loop to go through every pixel, i=y value, j=x value
  for(int i=0;i<height;i++){
    for(int j=0;j<width;j++){
      
        
        //grabs pixel's current color
        color c = pixels[i*width+j];
        
        //the actual glitch! <<number and & 0xff mess 
        //with the binary code and completely destroy the colors
        //very fun to mess around with. dont be afraid to tweak!        
        red = c <<4 & 0xff;
        green = c << 3 & 0xaa;
        blue = c  & 0xff;
        
        //gets distance from mouse to pixel
      //the *.4 at the end changes the "saving" area of effect:
      //when the mouse is at rest and the colors dont change.
      //higher value = smaller area
        d =dist(mouseX,mouseY,j,i)*.4;
       
       //make the colors change depending on distance to mouse       
        //rad = radius of the innermost circle
        red += 50/d-rad;
        green += 50/d-rad;
        blue += 155/d-rad;
          
        //changes the pixel to the glitched pixel
        pixels[i*width+j]=color(red,green,blue);
       
    }
  }
  
   updatePixels();

}


//ICE #19 for April 15, 2013

// jpg practice
// Swapping colors



PImage pic;
float r,g,b;

void setup(){
  size(640,480);
  pic=loadImage("Flower1.jpg");
}

void draw(){
  image(pic,0,0);
} 

void keyPressed(){
   pic=loadImage("Flower1.jpg");
   pic.loadPixels();
   float r,g,b;
   for(int i=0; i<pic.pixels.length; i++){
     color c=pic.pixels[i];
     r=red(c);
     g=green(c);
     b=blue(c);
     if (key=='1'){
       r=green(c);
       g=blue(c);
       b=red(c);
     }  
     if (key=='2'){
       r=blue(c);
       g=red(c);
       b=green(c);
     }    
     if (key=='3'){
       r=blue(c);
       g=green(c);
       b=red(c);
     }   
   pic.pixels[i]=color(r,g,b);
   }
   pic.updatePixels( );
}







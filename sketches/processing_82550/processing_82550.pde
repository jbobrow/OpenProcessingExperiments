
import processing.video.*;
Movie movie; 
PImage img;
float pointillize = 600;
float angle = PI/2;
 int x,y;
 
 

void setup() {
  size(900, 900,P2D);
  img = loadImage("om.jpg");
  background(0);
  smooth();
  movie = new Movie(this, "cat.mov"); 
   movie.loop();
  
  
  loadPixels();
    for (int i = 0; i < pixels.length; i++ ) { 
    float rand = random(80);   
    color c = color(rand);   
    pixels[i] = c; 
}

updatePixels();

}

void movieEvent(Movie movie) {
  movie.read();
}


void draw() {

 
  
  float myRotate = radians (   (int) random(360)  );
  float myScale = 0.8 + (int)(random(4) +1);
  
   
     x = int(random(movie.width));
      y = int(random(movie.height));
      int loc = x + y*movie.width;
 
      loadPixels();
      float r = red(movie.pixels[loc]);
      float g = green(movie.pixels[loc]);
      float b = blue(movie.pixels[loc]);
      noStroke();
      float ratio = mouseX / (float) width;
      
   
  
  
  
    
   translate(width/2, height/2);  
    rotate(radians(angle)*2);  
    scale(0.55);
      
    for(int y = 0; y < 8; y++)
        {
          for(int x = 0; x < 8; x++)
          {  
      movie.jump(ratio*movie.duration()); 
      
      tint(#ffbd4b,130);
      image(movie,x * 320, y * 240);
    }
  }  
         
    
 angle = angle + 5;
  
           
        
}



void mousePressed() {

  loadPixels();


for (int i = 0; i < pixels.length; i++ ) { 
  
  
  float rand = random(80);
  
  
  color c = color(rand);
  
  
  pixels[i] = c; 
  
}


updatePixels();
}



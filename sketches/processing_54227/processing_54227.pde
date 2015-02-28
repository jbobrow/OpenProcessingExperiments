
import processing.video.*;

int videoScale = 14;
int cols, rows;

int fontsize = 15;
int fontmax = 100;
int fontmin = 0;


Capture video;


String chars = "Press Up and Down";
PFont f;
float theta;

void setup(){
  size(640,480);

  cols = width/videoScale;
  rows = height/videoScale;
  video = new Capture(this, cols,rows,100);
  
  f = createFont("Ariel",15,true);
  
  }


void draw(){
background(0);
   if(video.available()){
    video.read();
   }
   video.loadPixels();
   
   int charcount = 0;
   
   for (int j = 0; j < rows; j++){
     for (int i = 0; i < cols; i++){
       int x = i*videoScale;
       int y = j*videoScale;
       
       color c = video.pixels[i+j*video.width];
     


      
       textFont(f,fontsize);
       text(chars,0,0);
       textAlign(CENTER);
       fill(c);
       text(chars.charAt(charcount),x,y);
       charcount = (charcount + 1) % chars.length();
     }
   }

}

void keyPressed(){
  switch(keyCode){
     case UP:
     if(fontsize < fontmax){
        fontsize++;
        break;
      }
      case DOWN:
      if( fontsize > fontmin){
        fontsize--;
        break;
      }
    }
}


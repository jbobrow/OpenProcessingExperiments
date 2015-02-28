
import processing.video.*;

Capture video;
int camw = 80;
int camh = 60;
int fps = 15;
int newx = 0; 
int newy = 0;
int xjump = 14;
int yjump = 14;


void setup(){
  background(0);
 // noCursor();
  size(camw*xjump,camh*yjump);
  smooth();
  
  video= new Capture (this, camw, camh, fps);
  
}

void draw(){
  //image(video, 0, 0);
  
  video.loadPixels();
  for(int y = 0; y <video.height; y++){
    for(int x = video.width-1; x>=0; x--){
      int location = x+y * video.width;
      color c = video.pixels[location];
  
      drawPoints(c, newx, newy);
     
    
     
     
      newx+=xjump;
      
    }
    
    newx = 0;
    newy+=yjump;
  }
  
  newy=0;
  
  video.updatePixels();
  
  
}



void drawPoints(color c, int newx, int newy){
  
  strokeWeight(4);
  float r =red(c);
  float g=green(c);
  float b = blue(c);
 
  stroke(r, g, b);
    if((mouseX>=newx-20 ||mouseX<=newx+20 )&& (mouseY>=newy-20 || mouseY<=newy+20)){
    fill(random(255),random(255),random(255));
  }
    else
    {
      fill(r,g,b);}
 
  ellipse(newx, newy, xjump, yjump);
  


  
  
  
}

void captureEvent(Capture v){
  v.read();
}




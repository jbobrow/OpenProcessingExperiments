
import gifAnimation.*;

String[] headlines = {
  "IT'S THE JOURNEY, NOT THE DESTINATION",
  "ENJOY THE RIDE",
};

PFont f;
GifMaker gifExport;
float x;
float xSpeed = 0.20;
int index=0;

public void setup(){
  size(512,160);
  frameRate(8);
  gifExport = new GifMaker(this, "export.gif");
    gifExport.setRepeat(0);             // make it an "endless" animation
    gifExport.setTransparent(0,0,0);    // black is transparent
  
  
     
f = loadFont("Futura-CondensedExtraBold-30.vlw");
x = width;



 



}

void draw(){
  
  background(0); 
  stroke(255,0,0); 
  fill(255,0,0);  




textFont(f,30);
textAlign(LEFT);
text(headlines[index],x,90);

x =x-3;

float w = textWidth(headlines[index]);
if(x<-w){
  x=width;
  index = (index + 1) % headlines.length;
  }

 gifExport.setDelay(1);
    gifExport.addFrame();
}
void mousePressed() {
    gifExport.finish();                 // write file
}


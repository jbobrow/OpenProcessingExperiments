
PImage source;
int lineSpace;
int fiddle;
float darkValLimit;
boolean render;
import ddf.minim.*;
Minim minim;
Minim minim2;
AudioPlayer soundbackground;
AudioPlayer soundbackground2;

void setup(){
  size(800,600);
  source = loadImage("matt.jpg");
  background(source);
  smooth();
  lineSpace = 10;
  fiddle = lineSpace/2;
  stroke(100);
  darkValLimit = 0;
  render = false;
  
 minim=new Minim (this);
 soundbackground=minim.loadFile ("Track02.mp3");
 


 
}




void draw(){ 
 
   soundbackground.play();
  if(mousePressed){
    background(255);
    darkValLimit = float(mouseX)/width; 
    lineSpace = max(1,int(20*float(mouseY)/height));
    fiddle = lineSpace/2;
    println("mouse pressed, x = " + mouseX + ", y = "+ mouseY);
    println("lineSpace = " + lineSpace);
    println("darkValLimit = " + darkValLimit);
    render = true;
    
  }


  if(render){
    //background(255);
    int h = height;
    int w = width;
    float darkVal = 0;
    for(int y = lineSpace/2; y < h; y = y + lineSpace){
      for(int x = 0; x < w; x++){

        darkVal = getAverageAmbientBrightness(x,y);
         
  
        if(darkVal > darkValLimit){
          line(x,y + int( lineSpace * darkVal)/2 ,x, y - int( lineSpace * darkVal)/2);
        }
      }
    }
  render = false;

  }

}

float getAverageAmbientBrightness(int x, int y){
  float bright = 0;

  int lim = y + fiddle;
  for(int curY = y - fiddle; curY < lim; curY++){
    bright += brightness(source.get(x,curY));
  }
  //actually, let's return darkness...
  return (255 - (bright/lineSpace))/255;
}




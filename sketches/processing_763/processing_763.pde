
/*
 * Engraver
 * by Matt Katz
 * Simulates a verrrrry basic engraving based on brightness values.
 * click with the mouse on the canvas to try engraving
 * mouse x controls the cuttoff after which we stop engraving
 * mouse y controls the thickness of our engraving blade
 */


PImage source;
int lineSpace;
int fiddle;
float darkValLimit;
boolean render;
void setup(){
  size(500,375);
  source = loadImage("matt.jpg");
  //comment out the previous size and uncomment this
  //if you are playing with various photos in 
  //processing ide
  //size(source.width, source.height);
  background(source);
  smooth();
  lineSpace = 10;
  fiddle = lineSpace/2;
  stroke(100);
  darkValLimit = 0;
  render = false;
}
void keyPressed(){
  println("pressed " + key);
  if(key == 'g'){
   render = !render; 
   if(render){background(255);}else{background(source);}
   println("render is " + render);
  }

}

void draw(){
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
        //println("x = " + x + ", y =" + y);
        //get the brightness at this pixel in the picture
        darkVal = getAverageAmbientBrightness(x,y);
         
         // float darkVal = 255 - brightVal;
        if(darkVal > darkValLimit){
          line(x,y + int( lineSpace * darkVal)/2 ,x, y - int( lineSpace * darkVal)/2);
        }
      }
    }
  render = false;
  //this is good to uncomment if you are in a non-web environment
  //saveFrame("seriousbusiness-####.jpg");
  }

}

float getAverageAmbientBrightness(int x, int y){
  float bright = 0;
  //don't ever optimize unless you notice slowdown
  //I noticed slowdown
  int lim = y + fiddle;
  for(int curY = y - fiddle; curY < lim; curY++){
    bright += brightness(source.get(x,curY));
  }
  //actually, let's return darkness...
  return (255 - (bright/lineSpace))/255;
}




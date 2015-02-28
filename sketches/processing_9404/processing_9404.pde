
import gifAnimation.*;

float slope = 1;
int weight = 10;
int x_offset = 0;
int height = 220;
int width = 220;
PGraphics pg;
GifMaker gifExport;

void setup(){
  size(width, height);
  strokeWeight(weight);
  background(255);
  pg = createGraphics(width, height,P3D);
  if( ! online){
    gifExport = new GifMaker(this, "export.gif");
    gifExport.setRepeat(0);				// make it an "endless" animation
    //gifExport.setTransparent(0,0,0);	// black is transparen
  }
}

void draw(){
  x_offset +=1;
  x_offset %= 3 * weight;

  pg.beginDraw();
  pg.strokeWeight(weight);
  pg.background(255);
  for( int i = -width + x_offset; i < 2 * width; i += (3 * weight))
  {
   pg.line(i, -weight, i + (height/ slope), height); 
  }
  pg.endDraw();
  pg.loadPixels();
  
  image(pg,0,0);
  for( int x = 20 ; x < width; x +=40){
    for( int y = 20; y < height ; y +=40){
      PImage ig = pg.get(x,y,20,20);
      ig.filter(INVERT);
      image(ig, x,y);
    }
    
  }
  if( ! online){
    gifExport.addFrame();
  
    if (x_offset == 0){
      gifExport.finish();
    }
  }
}





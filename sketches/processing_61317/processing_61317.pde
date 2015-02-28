
//project 1 rwandrew
//copyright russell andrews 2012

//slider code is adapted from Jim Roberts

int sliderX, sliderY, sliderWidth, sliderHeight;
int threshHold;

PImage beyonce;

void setup(){
  size(600,600);
  beyonce = loadImage("beyonce.jpg");
   sliderX = 20;
   sliderY = height-50;
   sliderWidth = width - sliderX*2;
   sliderHeight = 10;
   
   threshHold = 100;
}

void draw(){
  background(0);
  drawCircle();
  drawSlider();
}

void drawCircle(){
  for(int x = 0; x < width; x += threshHold){
    for(int y = 0; y < height; y += threshHold){
      int i = beyonce.width*y + x;
      
      color target = beyonce.pixels[i];
      noStroke();
      ellipseMode(CENTER);
      fill(target);
      ellipse(x, y, threshHold, threshHold);
    }
  }
}

void drawSlider(){
   fill( 255 );
   rectMode(CORNER);
   rect( sliderX, sliderY, sliderWidth, sliderHeight);
   ellipseMode(CORNER);
   ellipse(sliderX-5, sliderY, sliderHeight, sliderHeight);
   ellipse(width-25, sliderY, sliderHeight, sliderHeight);
   int barX = int( map( threshHold, 0, 100, sliderX, sliderX+sliderWidth) );
   rectMode(CENTER);
   fill( 200, 0, 0 );
   stroke(255);
   smooth();
   strokeWeight(3);
   ellipseMode(CENTER);
   ellipse( barX, sliderY+sliderHeight/2, sliderHeight +10, sliderHeight +10 );
}

void mouseDragged( )
{
   threshHold =  int(constrain( map( mouseX, sliderX, sliderX + sliderWidth, 1, 100 ) , 1, 100) );
   
}


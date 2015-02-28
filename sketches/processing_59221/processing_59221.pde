
PImage lenna;
PImage zaloha;
PGraphics polar;

float diagonal;

void setup() {
  size(600,300,P2D);
  
  lenna = loadImage("lenna.jpg");
  zaloha = loadImage("lenna.jpg"); 
  polar = createGraphics(lenna.width, lenna.height, P2D);
  
  lenna.loadPixels();
  zaloha.loadPixels(); 
  background(0);
  
  textFont(loadFont("SempliceRegular-8.vlw"));
  textMode(SCREEN);
  cursor(CROSS);
  

}


void draw() {




  noStroke();
  fill(#ff0000);
//background(0);

  polar = cartesianToPolar(zaloha);
  
  image(polar, width/2, 0);
  fastblur(polar,5);
  
  lenna = polarToCartesian(polar);
 // fastblur(g,2);


  image(lenna,0,0);

  
  fill(#FFFFFF);
  
  textAlign(LEFT);
  text("cartesian coordinates",10,height-10);

  textAlign(RIGHT);
  text("log-polar projection",width-10,height-10);

}


PGraphics cartesianToPolar(PImage input) {
  int step = 1;

  PGraphics output = createGraphics(input.width, input.height,P2D);
  output.loadPixels();

  for (int y = 0 ; y<input.height;y+=step) {
    for (int x = 0 ; x<input.width;x+=step) {
      float x2 = mouseX+(cos(y/(input.height*PI/20.0))*x/2.0);//+width/2;
      float y2 = mouseY+(sin(y/(input.width*PI/20.0))*x/2.0);//+height/2;




      if (x2>0 && x2 < input.width && y2>0 && y2 < input.height) {
        output.pixels[y*input.width+x] = input.pixels[(int)y2*input.width+(int)x2];
      }
      
    }
  }

  output.updatePixels();
  return output;
}

PGraphics polarToCartesian(PImage input) {
  int step = 1;

  PGraphics output = createGraphics(input.width, input.height,P2D);
  output.loadPixels();

  for (int y = 0 ; y<input.height;y+=step) {
    for (int x = 0 ; x<input.width;x+=step) {
      float x2 = mouseX+(cos(y/(input.height*PI/20.0))*x/2.0);
      float y2 = mouseY+(sin(y/(input.width*PI/20.0))*x/2.0);

      if (x2>0 && x2 < input.width && y2>0 && y2 < input.height) {
        output.pixels[(int)y2*input.width+(int)x2] = input.pixels[y*input.width+x];
      }
      
    }
  }

  output.updatePixels();
  return output;
}


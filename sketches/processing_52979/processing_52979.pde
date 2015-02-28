

PFont font;
float lineSep = 100;
int nLines = 0;
float ypos;
PImage img;       
String phrase = "";
color fakeCol = color(100,100,100);
int loc;
float maxSize;
float gradient;

void setup() 
{
  smooth();  

  font = loadFont("DejaVuSans-Bold-120.vlw");
  textFont(font,120);
  textAlign(CENTER);
  textLeading(lineSep);

  // Picture by Petras Gagilas
  // http://www.flickr.com/photos/gagilas/4495968987
  img = loadImage("http://farm3.staticflickr.com/2713/4495968987_6e546b3d55_z.jpg"); 
  size(img.width, img.height); 
  maxSize = 0.95*width;
  ypos = 0.5*height;
}

void draw() {
  image(img,0,0,width,height);
  fill(fakeCol);
  text(phrase,0.5*width,ypos);

  loadPixels(); 
  for (int x = 0; x < width; x++){
    for (int y = 0; y < height; y++){
      loc = x + y*width;
      if (pixels[loc] == fakeCol){
        pixels[loc] = img.pixels[loc];
      } 
      else{          
        gradient = map(sqrt(sq(x-0.5*width) + sq(y-0.5*height)),0,0.7*width,220,0);
        pixels[loc] = color(gradient,0,0);
      }
    }
  }
  updatePixels(); 
}

void keyReleased() { 
  if(key != CODED) {
    if(textWidth(phrase + key) > maxSize) {
      phrase = phrase + "\n";
      nLines++;
      ypos = 0.5*height - nLines*lineSep*0.5;
    }
    phrase = phrase + key;
    if(key == ENTER) {
      nLines++;
      ypos = 0.5*height - nLines*lineSep*0.5;
    }      
  }
}

void mousePressed() {
  if(mouseButton == RIGHT){
    lineSep = lineSep*0.8;
  }
  if(mouseButton == LEFT){
    lineSep = lineSep/0.8;
  }
  textLeading(lineSep);
  ypos = 0.5*height - nLines*lineSep*0.5;

  //if(mouseButton == CENTER){
  //  save("pic.jpg");
  //}
}




import processing.video.*; 
PImage img;
MovieMaker mm;
Capture video;

int posx;
int posy;
int r;
int s;

void setup () {
  size (640,478);
  mm = new MovieMaker(this, width, height,"sparkle"+timeStamp()+ ".mov", 10, 
                     MovieMaker.ANIMATION, MovieMaker.HIGH);
  img = loadImage("IMG_6388.jpg");
 image(img,0,0);
  noStroke ();
  smooth ();
  //noLoop ();
  //background (255);
  colorMode(HSB);
}
 
void draw () {
loadPixels();
  color pixel = get(mouseX,mouseY);
  //pixels[i]= pixel;
  noStroke();
  fill(pixel);
 
  if(mousePressed == true) {
  posx=mouseX-(mouseX%20);
    posy=mouseY-(mouseY%20);
    r= abs(mouseX-pmouseX);
    s=abs(mouseY-pmouseY);
    rect(posx,posy,r,s);
    
  }
  mm.addFrame();
}
 
void drawCircle (float x, float y, float radius, int num) {
  float r = random (255);
  float b = random (255);
  fill (r,b,10,170);
  ellipse (x, y, radius, radius);
  if (num > 1) {
    num = num - 1;
    for (int i = 0; i < 4; i++) {
      float a = random (0, TWO_PI);
      float newx = x + cos(a) * 100.0*i;
      float newy = y + sin(a) * 100.0*i;
      drawCircle (newx, newy, radius/2, num);
    }
  }

}
void keyPressed(){
  if(key =='s'){
    saveImage();}
    if(key =='b'){
      filter(BLUR);
      
}
  if (key==' '){
   
     mm.finish();
    // Quit running the sketch once the file is written
   
  exit();

}
}


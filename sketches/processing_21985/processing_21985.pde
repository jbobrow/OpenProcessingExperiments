
PImage rasp;

void setup(){
    size(416,328);
    colorMode(HSB,360,100,100);
    rasp = loadImage("TWS.png");
    photoFilter();
//calls a new function named photoFilter()
    }
  void draw(){
  }
//content of photoFilter()
void photoFilter(){
  rasp.loadPixels(); //brings up the pixel array
  int raspSize = rasp.width * rasp.height;
  //using a name.variable format calculates the width and height of an 
  //image rather than the background, which is the default
  for(int i = 0; i < raspSize; i++){
      color cp = rasp.pixels[i];
      float h = hue(cp);
      float s = saturation(cp);
      float b = brightness(cp);
      if (b < 90){
        b += 10;
        fill(h,s,b);
        strokeWeight(.25);
        ellipse(i%width, i/width,10,10); 
      }
      
      if (h > 200){
        h += 10;
        fill(h,s,b);
        noStroke();
        ellipse(i%width, i/width,10,10);

        
      }
      if (h < 75){
        fill(h,s,b);
        noStroke();
        rect(i%width,i/width,10,10);
      }
      if (s < 10 && s < 75){
        s =500;
      }
      rasp.pixels[i] = color(h,s,b);
  }
      rasp.updatePixels();
      image(rasp,0,0);
}



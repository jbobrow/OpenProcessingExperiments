
int frames = 96; 
int panel = 0;
PImage[] images = new PImage[frames];

//==========================================================
void setup(){
  size(256,192);
  frameRate(24);
     for(int N=0; N<images.length; N++){
      images[N] = loadImage ("frame" + N + ".gif");
  }

}
//==========================================================
void draw(){
  panel = panel + 1;
//  if (frame>=numFrames){
//   frame=0;
//  }
 image(images[panel % frames],0,0);
 if(keyPressed){
     noLoop();
   }
}

//==========================================================

void keyReleased() {
  loop(); 
}




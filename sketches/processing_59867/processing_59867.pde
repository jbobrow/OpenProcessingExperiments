
//int numFrames = 12;  // The number of frames in the animation
int numFrames = 16;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(600,400);  
  frameRate(1000);
  smooth();
  
  
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
  }}); 
  for (int i = 0; i<numFrames; i++) {
    println("images["+i+"]="+"IMG_"+str(i+1)+".jpg");
    images[i]  = loadImage("IMG_"+str(i+1)+".jpg");
  }

}
 
void mouseWheel(int delta) {
  frame=frame+delta;
  if(frame>numFrames-1){
    frame=0;
  }else 
  if(frame<0){
    frame=numFrames-1;
  }
  
  
   println(frame);
}
 
void draw() {
 image(images[frame],0, 0);
}


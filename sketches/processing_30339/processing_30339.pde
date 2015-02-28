
//int numFrames = 12;  // The number of frames in the animation
int numFrames = 25;  // The number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() {
  size(800,600);  
  frameRate(30);
  smooth();
  
  
  addMouseWheelListener(new java.awt.event.MouseWheelListener() { 
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) { 
      mouseWheel(evt.getWheelRotation());
  }}); 
  for (int i = 0; i<numFrames; i++) {
    println("images["+i+"]="+"IMG_"+str(i+1242)+".jpg");
    images[i]  = loadImage("IMG_"+str(i+1242)+".jpg");
  }
/*
  images[0]  = loadImage("PT_anim0000.gif");
  images[1]  = loadImage("PT_anim0001.gif"); 
  images[2]  = loadImage("PT_anim0002.gif");
  images[3]  = loadImage("PT_anim0003.gif"); 
  images[4]  = loadImage("PT_anim0004.gif");
  images[5]  = loadImage("PT_anim0005.gif"); 
  images[6]  = loadImage("PT_anim0006.gif");
  images[7]  = loadImage("PT_anim0007.gif"); 
  images[8]  = loadImage("PT_anim0008.gif");
  images[9]  = loadImage("PT_anim0009.gif"); 
  images[10] = loadImage("PT_anim0010.gif");
  images[11] = loadImage("PT_anim0011.gif"); 
*/
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
 image(images[frame], 0, 0);
}


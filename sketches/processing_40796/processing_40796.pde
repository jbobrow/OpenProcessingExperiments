
//Amater loads sequence of png files
class Amater2 {
  //main animation vars
  int numFrames; //number of images to load
 PImage[]family;
  //frames
  int frame;
  //vars to control placement & size of figures
  float x;
  float y;
  float w;
  float h;
  //var for fade at the end of animation
  float v;
   //controls stop point
 int s;
  int i;
  int j;
  //vars for pixel test @end
  int position;
  color black;
  color white;
   float px = 0;
      float py = 0;
 
  //constructor
  Amater2() {
    numFrames =151;
    family = new PImage [151];
   // Initialize array values
  for (int i = 0; i < numFrames; i++) {
    String name = nf(2, 2)+"_"+ nf(i, 4) + ".png";
      family[i] = loadImage(name);
  }
  
    x=-340;
   y=-165;
    w=6;
    h=3;
    v=100;
    s=580;
    position = 0;
    white = color(255);
    black = color(0);
  } 
  
  void display() {
    //loops until reaches y mark
    if(y <s) {
      frame++;
    }
    if (frame==numFrames) {
      frame=0;
    }
    if(y<s){
         image(family[frame], x, y, w, h);
     }
     //fills last frame of animation with points and fades
  if (y>s&&frameCount<1350){
     image(family[frame], x, y, w, h);
 //delay(1000);
black = color(random(150, 250), v);
      position = int((width * y) + x);
      int threshold = 180;//brightness threshold
      float pixelBrightness;//to store the pixel's color
      for(int j = 0; j < family[frame].height; j += int(random(7))) {
        for(int i = 0; i < family[frame].width; i += int(random(7))) {
           pixelBrightness = family[frame].get(i,j); 
          if (pixelBrightness < threshold) {
            stroke(black, 175);
            px = map(i, 0, family[frame].width, x, x + w);
            py = map(j, 0, family[frame].height, y, y + h);
            point(px, py);
           tint(200, v);
           v=v-.0001;
}
          }
          }
      }
   
    //moves the animation toward viewer
    if(y<s) {
       x=x+1.0004;
      y=y+1.0004;
      w=w*1.004;
      h=h*1.004;
    }
  } 
}


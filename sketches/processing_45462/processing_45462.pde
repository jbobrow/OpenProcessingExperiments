
/* 
 This example needs a folder named "data" 
 inside data, the name of the images are fy000.jpg 
 fy005.jpg
 if you change the code to work with your images
 you will have to change line 18 to make it work 
 
 
 */



int frame = 0;
int numFrames = 10;
int opacity= 0;
PImage[] images = new PImage[numFrames];

int n = 2500;
float s = 0.07;
float w, h, t, px, py;


void setup() {
  size(640,480, P2D);
    w = width/2;
  h = height/2;
  smooth();

  frameRate(20);


  for (int i = 0; i<images.length; i++) {
    //change the line below to the name of the images in your data folder
    String imageName = "cof" + nf(i,3) + ".jpg";
    println("imageName" + imageName);
    images[i] = loadImage(imageName);
    println(numFrames);
  }
}

void draw() {
  /* changed where the next frame changes - used to be 
   frame++; */
   background (opacity);
  if (opacity == 100) {
    opacity=0;
    frame++;
  }
  if(frame == numFrames) {

    frame=0;
  } 
  image(images[frame], 0, 0);
  opacity += 50;
   translate(w,h);
  scale(w/6.);
  for(int i=0; i<n; i++) {
    float x = noise(t+40, i*.07) * 2 - 1;
    float y = noise(t, i*.01) * 2 - 1;
    if(i>0)  {
      line(f(x, y), f(px, py));
      line(f(x, y), f(x+s, y));
      line(f(x+s, y), f(px+s, py));      
    }
    px=x;
    py=y;
  }
  t += .004;
}
 
void line(float[] p1, float[] p2) {
  float c =  dist(p1[0], p1[1], p2[0], p2[1])  * 128;
  if(c<200) {
    stroke(250+c, 64);
    line(p1[0], p1[1], p2[0], p2[1]);
  }
}
 
float[] f(float x, float y) {
  float a = (mouseX-w)/(w+h);
  float b = (mouseY-h)/(w+h);
  float d = x*x + y*y;
  return new float[] { (x*a + y*b)/d, (x*b - y*a)/d };
}





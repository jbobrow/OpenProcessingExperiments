


PImage back, middle, front, back2, eye, lid ;
PVector vback, vmiddle, vfront, vback2, veye,vlid;
int backgroundHue = 0;

void setup(){
  eye = loadImage("6.png");
  back2 = loadImage("4.png");
  back = loadImage("3.png");
  middle = loadImage("2.png");
  front = loadImage("1.png");
  lid = loadImage("5.png");
  imageMode (CORNER);
  colorMode (HSB);
  size(900, 600);
  veye = new PVector(0,0);
  vback2 = new PVector(0,0);
  vback = new PVector(0, 0);
  vmiddle = new PVector(0, 0);
  vfront = new PVector(0, 5); 
  vlid = new PVector(0,0);
  
  frameRate(150);
}

void paraDraw(PImage img, PVector pos, float vel){
  pos.sub(vel, 0, 0);
  
  int r = (int)pos.x+img.width;

  if(r < width) image(img, r, pos.y);
  if(pos.x < width) image(img, pos.x-img.width, pos.y);  
  if(pos.x < -img.width) pos.x = width;
  //println("r: " + r + ", pos.x: " +pos.x);
  
  image(img, pos.x, pos.y);
  
}

void draw(){
  background(backgroundHue, 120, 244);
  
  
  backgroundHue+=2;
  if(backgroundHue>=255) {
    backgroundHue = 0;
  }
  

  
  paraDraw(eye, veye, 0);
  float ax = map (mouseX, 0, width, 430, 470);
  float ay = map (mouseY, 0, height, 70, 100);
   
  fill(0,0,0);
   ellipse (ax,ay,40,40);
   
  float bx = map (mouseX, 0, width, 445, 460);
  float by = map (mouseY, 0, height, 290, 310);
  paraDraw(back2, vback2,.1);
  paraDraw(back, vback, .25);
  paraDraw(middle, vmiddle, .5);
  paraDraw(front, vfront, .75);
  
}

  void mouseDragged (){
   smooth();
   paraDraw(lid, vlid,0);
  
   frameRate(150);
    
  }




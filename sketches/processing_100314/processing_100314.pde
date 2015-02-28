
int oldX;

PImage img;
 
void setup() {
  size(624, 489);
  img = loadImage("push.png");
  imageMode(CENTER);
  noStroke();
  background(255);
   
}

void draw() { 
  if ( oldX != mouseX ){
 image(img,width/2,height/2);
 int stepper = int( mouseX / 10);
  for ( int i=0;i<width;i+=stepper)
   for ( int j=0;j<width;j+=stepper){
   color pix = img.get(i, j);
   fill(255,0,0);
   text(int(red(pix)/25), i,j);
     fill(0,255,0);
     text(int(green(pix)/25), i+5,j+5);
       fill(0,0,255);
       text(int(blue(pix)/25), i+10,j+10);
   }
  }
  oldX = mouseX;
 
}



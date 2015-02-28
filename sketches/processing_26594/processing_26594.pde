
int time1=0;
int time2=30000;


float x;
float y;
float px;
float py;
float easing = 0;
PImage spaceshipfire2;
PImage controls;

PImage start;

PImage [] images = new PImage[15];
 int currentFrame =0; 
PImage gameover;



void setup () {
size(400,400);
  start=loadImage("start.png");
  for (int i=0; i<images.length; i++) {
    images [i] = loadImage ("planet panorama"+(i+1)+".png");
  }
  println(images);
 size(images[0].width,images[0].height);

spaceshipfire2=loadImage("spaceshipfire2.png");
controls = loadImage ("controls.png");
gameover= loadImage ("gameover.png");
}


void draw () {

  image (start, 0, 0);
     if (key =='c') {
           image (controls, 0, 0);
     }       
           image(spaceshipfire2,0,mouseY);

  println(key);

  int currentTime=millis();
  if (key == CODED) {
    if (keyCode == RIGHT){
    image (images[currentFrame],0,0);
  currentFrame++;
       image(spaceshipfire2,0,mouseY);
     
    if (currentFrame >= images.length){
    currentFrame=0;
    frameRate(2.5);
   
   
   
    } else if ( currentTime>time2) {
    image(gameover, 0, 0);
  }
  
  
    
    }
  }
}




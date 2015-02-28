

float fade = 0;
int passedTime = 0;
boolean boolFade = false;
PImage img;


void setup(){
   img = loadImage("img1.JPG");
  size(400,270); 

}


void draw(){


  img = loadImage("img1.JPG");

  
  rectFade();
}


void mousePressed(){
  image (img, 0, 0);
    boolFade = !boolFade;
  tint (random (0,255), random (0,255),random (0,255));
}


void rectFade(){
  if (boolFade==true) {
    passedTime = passedTime + 1;
    if (passedTime > 0) {
      fade = map(passedTime, 0, 20, 0, 255);
      fill(0, fade);
    rect (0,0,800,540);
    }  
    } else {
      passedTime = 0;

      boolFade = !boolFade;
    }
  }  





float x = 0.1;

PImage photo1, photo2;


void setup(){
  size(800, 600);

  photo1 = loadImage("mayweather.jpg");
  photo2 = loadImage("Picture 1.png"); 

}


void draw(){

  image(photo1, mouseX-(photo1.width/2+50),mouseY-(photo1.height/2+50));
  image(photo2, mouseX-(photo2.width/4),mouseY-(photo2.height/4));
  photo2.filter(BLUR, x);

  if (x < 15 && x> 0) {
    x = x + .001;
  }

}




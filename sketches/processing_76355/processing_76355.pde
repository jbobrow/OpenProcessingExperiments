
int value = 0;
PImage myImage;
PImage myImage2;

void setup(){
  size(450,600);
  myImage=loadImage("4.jpg");
  myImage2=loadImage("2.jpg");
}

  void draw(){
  background(255);
  if (value == 0) {
    image(myImage,0,0,450,600);
  }
  else image(myImage2,0,0,450,600);
  }

  void mousePressed(){
   value = 1;
  }




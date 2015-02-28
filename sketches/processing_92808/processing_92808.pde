
boolean stopped = false;
PImage myImage; 
PImage myImage2; 
PImage myImage3; 
PImage myImage4; 
PImage myImage5;

void setup() {size(500,500);

frameRate(15);
myImage = loadImage("Motif01.png");
myImage2 = loadImage("Motif03.png");
myImage3 = loadImage("Motif02.png");
myImage4 = loadImage("Motif04.png");
myImage5 = loadImage("Motif05.png");
}


void draw(){
  if(stopped == false){
    background(0);
     
   image(myImage3, random (-50, 500), random (-50, 500), random(50,150), random(50,150));

  image(myImage4, random (-50, 500), random (-50, 500), random(50,150), random(50,150));
 
  image(myImage5, random (-50, 500), random (-50, 500), random(50,150), random(50,150));

  image(myImage2, random (-50, 500), random (-50, 500), random(50,150), random(50,150));
 
  image(myImage, random (-50, 500), random (-50, 500), random(50,150), random(50,150));


  
   variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
  }
}

void variableEllipse(int x, int y, int px, int py) {
  float speed = abs(x-px) + abs(y-py);
  noStroke();
  ellipse(x, y, speed, speed);
  fill(random(0,255),random(0,255),200,180);
}

  void keyPressed() {
  if (key == 'p') {
    if(stopped == true){
      stopped = false;
     
    }
    else {
    stopped = true;
  } 

 }
  }



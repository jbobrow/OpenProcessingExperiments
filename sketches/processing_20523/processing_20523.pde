
PImage myPic;

void setup(){
  size(400,400);
  myPic = loadImage("color.jpg");
  noStroke();
  smooth();
  background(0);
  for(int y=cell; y <= 399; y+=cell){    
   for(int x=cell; x <= 399; x+=cell){
     color myFill = color(myPic.pixels[x + (y * 400)]);
     fill(myFill);
     float radius = cell * (brightness(myPic.pixels[x + (y * 400)]) / 255);
     ellipse(x,y,radius,radius);
    }
  }
}

int cell = 3;

void draw(){
}

void mousePressed(){
   background(0);
   for(int y=cell; y <= 399; y+=cell){    
    for(int x=cell; x <= 399; x+=cell){
      color myFill = color(myPic.pixels[mouseX + (mouseY* 400)]);
      fill(myFill);
      float radius = cell * (brightness(myPic.pixels[x + (y * 400)]) / 255);
      ellipse(x,y,radius,radius);
     }
    }
}


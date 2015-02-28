
//Adam Oaks

PImage myPic;

void setup() {
  size(600,600,P3D);
  smooth();
  lights();

  myPic = loadImage("logo.jpg");
}

int cell = 5;

void draw() {
  background(255);
  camera(mouseX,300,600,width/2,height/2,0,0,1,0);
  //rotateY (frameCount * 0.008);

  for(int x=cell; x<=599; x+=cell) {
    for(int y=cell; y<=599; y+=cell) {


      color myColor = myPic.get(x,y);
      stroke(myColor);
      strokeWeight(2);

      float z = cell * (brightness(myPic.pixels[(y*600)+x]));
      line(x,y,0,x,y,z/12);
    }
  }
}



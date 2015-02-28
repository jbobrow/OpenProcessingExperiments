

PImage myPic;

void setup(){
  size(300,300,P3D);
  myPic = loadImage("nick.jpg");

  frameRate(25);
  smooth();

  background(255);
}
float cameraX, cameraY;
int r,g,b = 0;
int count = 0;

void draw(){
 
  lights();
  camera(-30, 200, 400,width/2+50,height/2+50,0,0,1,0);

  
  translate(width/2 + random(25,75), height/2 + random(25,75), -50);
 
  r = int(red(myPic.pixels[count]));
  g = int(green(myPic.pixels[count]));
  b = int(blue(myPic.pixels[count]));

  noStroke();
  fill(r*2,20);
  box(g/2+random(1,20),g+random(1,10),b);
 


  count++;
 
  if(count >= myPic.pixels.length){
    count = 0; 
  }
}










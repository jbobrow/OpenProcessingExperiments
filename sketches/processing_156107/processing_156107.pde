
PImage bird;
PImage flower;
float birdPosX;
float birdPosY;
PFont myFont;
 
void setup() {
  size(600, 600);
  background(#D7FFFF);
 
  bird=loadImage("bird.png");
  birdPosX=100;
  birdPosY=100;
  myFont=createFont("Georgia",300);
  
  flower=loadImage("flower.png");
}
 
void draw() {
  background(#D7FFFF);
 float freq=map(mouseY,10,width,0.01,0.1);
 float scale=map(sin(mouseX*freq),-1,1,200,300);
 
  //text
  textFont(myFont, 300);
  textAlign(CENTER);
  fill(0,50);
  text("Fly",random(width),random(height));
  //bird
  pushMatrix();
  translate(300,300);
  rotate(radians(-frameCount*0.9));
  image(bird,0,0,scale-10,scale+20);
  //flower
  pushMatrix();
  translate(300,300);
  rotate(radians(frameCount*0.9));
  image(flower,0,0,scale+5,scale-5);
  popMatrix();
  popMatrix();
  
  if (keyPressed) {
    if (key == 's') {
      saveFrame();
    }
  }

}







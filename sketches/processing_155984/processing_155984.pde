
PImage Image;
PFont Font;

float speed;
float scale;
float scale2;

void setup(){
  size(500,500);
  Image = loadImage("blue-jellyfish.jpg");
  Font = loadFont("AvenirNext-DemiBoldItalic-48.vlw");
}

void draw (){
  background(0);
  //imageMode(CENTER);
  speed = 20;
  scale = sin(frameCount/speed);
  scale2 = map(sin(frameCount/speed),-1,1,1,1.2);
  image(Image, width/2, height/2, scale*Image.width, scale*Image.height);
  
  textAlign(CENTER);
  textFont(Font, scale2*50);
  fill(225,225,250);
  text("Crazy Jellyfish", width/2, height/2);
}



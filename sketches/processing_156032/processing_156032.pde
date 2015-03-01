
PImage boom;
PImage fire; 
PImage bear;
PFont f;

float tintR;
float tintG;
float tintB;

float headWidth;
float headHeight;

float bearX;
float bearY;



void setup() {
  size (600, 600);
  background(255);

  boom=loadImage("boom.jpg");
  fire=loadImage("fire.jpg");
  bear=loadImage("bear.png");
}

void draw() {

  tintR=map(mouseX, 0, width, 0, 255);
  tintG=map(mouseY, 0, width, 0, 255);
  tintB=map(mouseY, 0, width, 0, 255);

  headWidth = map(mouseX, 0, width, 0, 200);
  headHeight = map(mouseY, 0, height, 0, 250);

 // tint(tintR, tintG, tintB);
  // image(doge, 0, 0);

f = createFont("Impact",30,true);

  int random1 = int(random(-30, 30));
  float random2 = random(30);

  //floatRandom1 = float(random1);

  float frequency = map(frameCount, 0, 10000, 0.001, 1);

  float scale=map(sin(random(4)), -1, 1, 600, 1200);
  
  float boomAlpha=map(scale,600,1200,250,0);
  
  float boomSizeX=scale+1;
  float boomSizeY=scale+1;

  imageMode(CENTER);


//explosion

pushMatrix();
translate(width/2,height/2);
rotate(radians(random(10)));
tint(255,boomAlpha);
image(boom,0,0,boomSizeX,boomSizeY);

popMatrix();

bearX = 3/2*bearY*.988+random(3);
bearY = 3/2*bearX+random(3);


//bear



pushMatrix();
  translate(width/2,height/2);
  translate(bearX,bearY);
  rotate(radians(frameCount*.5));

  
  pushMatrix();
  rotate(radians(sin(frameCount*.9)));
    image(bear, bearX, bearY,80,80);
  
  textFont(f,30);
  fill(255);
  text("AAAAAAHH",bearX+20,bearY-10);
  
  popMatrix();

popMatrix();

/* pushMatrix();
  translate(width/2, height/2);
  rotate(radians(frameCount * frequency));

  image(boom, 0, 0, scale, scale);

  
  pushMatrix();
  translate(width/2,height/4);
  rotate(radians(frameCount *0.9));
  image(bear, 0, 0,80,80);
popMatrix();
    popMatrix(); */

}




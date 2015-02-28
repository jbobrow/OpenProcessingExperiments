
PImage bowser;
PImage mario;
void setup() {
  size(300, 300);
  bowser = loadImage("bowserface.png");
  mario = loadImage("Mario.png");
  background(0);
  //noLoop();
  noStroke();
  smooth();

  ellipseMode(CENTER);
}


int numObjects = 10;
int centerX = 150;
int centerY = 150;
float distance = 100;
float angle = 0;
float xoff=.01;
float angleObject = 360/numObjects;
int marX;
int marY;
float hopeX;
float hopeY;
float rando=1;

float noisemaker(int strength) {
  float g=strength*noise(xoff);
  xoff+=.001;
  return g;
}

int marioLocationX(int marioX){
  marioX=int( random(0, width-30));
  return marioX;
}

int marioLocationY(int marioY){
  marioY=int( random(0, width-30));
  return marioY;
}

float hopeLocationX(int i){
    float posX=10;
    for ( i=0;i<numObjects ;i++){
    angle = frameCount;
    distance=sin(radians(frameCount))*150;
    posX=centerX + distance *cos( radians(angleObject*i + angle) );
    }
    return posX;
}
float hopeLocationY(int i){
    float posY=10;
    for (i=i;i<numObjects ;i++){
    angle = frameCount;
    distance=sin(radians(frameCount))*150;
    posY=centerY + distance *cos( radians(angleObject*i + angle) );
    }
    return posY;
}




void draw() {
  //background(0);
  //fill(0,0,0,7);
  //rect(0,0,width,width);
  tint(255, 20);
  image(bowser, -45, -43, 405, 370);
  tint(255, 190);
  if(frameCount%60==0){
    marX=marioLocationX(marX);
    marY=marioLocationY(marY);
  }
  if (frameCount%60<30) {
    image(mario, marX,marY,(10+marY/2),10+marY/2);
  }
  
  for (int i=0;i<numObjects ;i++){
    angle = frameCount;
    distance=sin(radians(frameCount))*150;
    fill(200, noisemaker(100), 20);
    float posX=centerX + distance *cos( radians(angleObject*i + angle) );
    float posY=centerY + distance *sin( radians(angleObject*i + angle) );

    rando=noisemaker(2);
    if(rando<1.2){
    text("NO", posX, posY);
    }
    if(rando>1.2){
      text("HOPE",posX,posY);
    }
//    if(frameCount%100==0){
//      rando=int(random(100,100+numObjects));
//    }
    if(frameCount%20==0){
      hopeX=hopeLocationX(i+5);
      hopeY=hopeLocationY(i);
      System.out.println(i);
    }
    if (frameCount%18<10 ) {
      text("HOPE", hopeX, hopeY);
    }
  }
}




PImage[] bee = new PImage [5];
String[] loc = {"bee0001.png", "bee0002.png", "bee0003.png", "bee0004.png", "bee0005.png"};
int frame = 0;
int y = 0;

void setup(){
  size(500, 500);
  background(255);
  for(int i=0; i<bee.length; i++){
    bee[i] = loadImage(loc[i]);
  }
  frameRate(20);
}

void draw(){
  fill(255, 150);
  rect(0,0, width, height);
  image(bee[frame], 0, 500-y);
  if (frame<4){
  frame+=1;
  }
  else{
    frame=0;
  }
  if(y<800){
  y+=10;
  }
  else{
    y = 0;
  }
  
}


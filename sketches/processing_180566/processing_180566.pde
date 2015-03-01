
PImage bg;
PImage cloud;
PImage flower;
PImage bee;

void setup(){
  size(1400,848);
  smooth();
   bg = loadImage("bg.jpg");
   cloud = loadImage("cloud.png");
   flower= loadImage("flower.png");
    bee= loadImage("bee.png");
}
 
 
void draw(){
 imageMode(CORNER);
  image(bg, 0, 0);
  imageMode(CENTER);
  
  for (int i = 0; i < 60-second(); i ++){
   image(cloud,map(i,0,59,0,width),noise(i+frameCount/1000.0)*400);
 
  }
    for (int i = 0; i < minute(); i ++){
   image(bee,map(i,0,59,25,width-25),noise(i+frameCount/1000.0)*800);
 
  }
     for (int i = 0; i < hour(); i ++){
   image(flower,map(i,0,24,25,width-25),840);
 
  }
}



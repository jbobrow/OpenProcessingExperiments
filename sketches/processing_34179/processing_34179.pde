
PImage env;
PImage bush;
PImage dog;
PImage lamp;
PImage tree;
PImage tree2;
PImage busha;
PImage cloud;

//Image element[5];
int currElement=1;
int centerY;
PImage Image1;
PImage Image2;
PImage Image3;
PImage Image4;
PImage Image5;
PImage Image6;
PImage[] Images = new PImage[6];


void setup() {
  size(800, 500);
   background(255);
  
  centerY = 30;

  env = loadImage("environment.png");
  bush = loadImage("bush.png");
  dog = loadImage("dog.png");
  lamp = loadImage("lamp.png");
  tree = loadImage("tree.png");
  tree2 = loadImage("tree2.png");
//  busha = loadImage("busha.png");
  cloud = loadImage("Cloud.png");


  Image1 = loadImage("Clouda.png");
  Image2 = loadImage("busha.png");
  Image3 = loadImage("doga.png");
  Image4 = loadImage("lampa.png");
  Image5 = loadImage("treea.png");
  Image6 = loadImage("tree2a.png");

  Images[0]=Image1;
  Images[1]=Image2;
  Images[2]=Image3;
  Images[3]=Image4;
  Images[4]=Image5;
  Images[5]=Image6;

  image(env, 0, 30);
  image(cloud, 355, centerY);
  image(bush, 432, centerY);
  image(dog, 510, centerY);
  image(lamp, 585, centerY);
  image(tree, 663, centerY);
  image(tree2, 735, centerY);
}

void draw() {
  if (mousePressed) {
    if  (dist(mouseX, mouseY, 390, centerY+20) <=25) {
      currElement=0; 
      //if for bush
    }
   if (dist(mouseX, mouseY, 457, centerY+20) <=25){
      currElement=1;
      //if for dog
   }
   if (dist(mouseX, mouseY, 535, centerY+20) <=25){
      currElement=2;
      //if for lamp
   }
   if (dist(mouseX, mouseY, 610, centerY+20) <=25){
      currElement=3;
      //if for tree2
   }
   if (dist(mouseX, mouseY, 688, centerY+20) <=25){
      currElement=4;
      //if for tree
   }
   if (dist(mouseX, mouseY, 760, centerY+20) <=25){
      currElement=5;
      //if for cloud
   }
    
    
  // setting up the perameters to draw
    if ((mouseX >=0 && mouseX <= width) && (mouseY >= 125 && mouseY <= height)) {
      image(Images[currElement], mouseX-Images[currElement].width/2, mouseY-Images[currElement].height/2);
    }
  }
}

void keyTyped(){
if(key =='s' || key =='S'){
  save("LittleCity.tiff");
}
}



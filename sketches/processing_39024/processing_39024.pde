
ArrayList butterflies1 = new ArrayList();
ArrayList butterflies2 = new ArrayList();

PImage env;
PImage bush;
PImage dog;
PImage lamp;
PImage tree;
PImage tree2;
PImage busha;
PImage cloud;
PImage Bfly1;
PImage Bfly2;

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
  size(800, 500, P3D);
  background(255);
  for(int i=0; i<50; i++){
  butterflies1.add(new butterflies1());
  }
  for(int i=0; i<50; i++){
  butterflies2.add(new butterflies2());
  }
  
  centerY = 30;
  env = loadImage("environment.png");
  bush = loadImage("bush.png");
  dog = loadImage("dog.png");
  lamp = loadImage("lamp.png");
  tree = loadImage("tree.png");
  tree2 = loadImage("tree2.png");
//  busha = loadImage("busha.png");
  cloud = loadImage("Cloud.png");
  
  Bfly1 = loadImage("butterfly1.png");
  Bfly2 = loadImage("butterfly2.png");


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
 

  
}

void draw() {
  image(env, 0, 0);
  image(cloud, 355, centerY);
  image(bush, 432, centerY);
  image(dog, 510, centerY);
  image(lamp, 585, centerY);
  image(tree, 663, centerY);
  image(tree2, 735, centerY);
  //first set of butterflies
  for(int i=0; i<butterflies1.size(); i++){
    butterflies1 thisfly = (butterflies1) butterflies1.get(i);
    thisfly.drawBfly();
    thisfly.moveBfly();
  }
  //2nd set of butterflies
   for(int i=0; i<butterflies2.size(); i++){
    butterflies2 thisfly = (butterflies2) butterflies2.get(i);
    thisfly.drawBfly2();
    thisfly.moveBfly2();
  }
  
    
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

class butterflies2 {
  int xpos;
  int ypos;
  float xvel;
  float yvel;
  float spin = 0;

  
  
  butterflies2(){
    xpos = round(random(0,width));
    ypos = round(random(130,height));
    xvel = round(random(-1,1));
    yvel = round(random(-2, 2));
    spin = random(0,360);
    if(xvel == 0) xvel = 1;
    if(yvel == 0) yvel = 1;
   
  }  
  
  void moveBfly2(){
    xpos += xvel;
    ypos += yvel;
    spin +=1;
    if(xpos < 0) {
      xpos = 0;
      xvel *= -1;
      xvel += round(random(-1, 1));
      }
    if(xpos > width) {
      xpos = width;
      xvel *= -1;
      xvel += round(random(-1, 1));
      } 
     if(ypos < 100) {
      ypos = 100;
      yvel *= -1;
      yvel += round(random(-1, 1));
      }
     if(ypos > height) {
      ypos = height;
      yvel *= -1;
      yvel += round(random(-1, 1));
     }

       
  }
void drawBfly2(){
    pushMatrix();
      rotateX(radians(spin));
      image(Bfly2, xpos, ypos);
    popMatrix();
  }
 }

class butterflies1 {
  int xpos;
  int ypos;
  float xvel;
  float yvel;
  float spin = 0;

  
  
  butterflies1(){
    xpos = round(random(0,width));
    ypos = round(random(130,height));
    xvel = round(random(-1,1));
    yvel = round(random(-2, 2));
    spin = random(0,360);
    if(xvel == 0) xvel = 1;
    if(yvel == 0) yvel = 1;
   
  }  
    
void moveBfly(){
    xpos += xvel;
    ypos += yvel;
    spin +=1;
    if(xpos < 0) {
      xpos = 0;
      xvel *= -1;
      xvel += round(random(-1, 1));
      }
    if(xpos > width) {
      xpos = width;
      xvel *= -1;
      xvel += round(random(-1, 1));
      } 
     if(ypos < 100) {
      ypos = 100;
      yvel *= -1;
      yvel += round(random(-1, 1));
      }
     if(ypos > height) {
      ypos = height;
      yvel *= -1;
      yvel += round(random(-1, 1));
     }
}
    
void drawBfly(){
  pushMatrix();
      rotate(radians(spin));
      image(Bfly1, xpos, ypos);
    popMatrix();
  }
}

//void randomize(int x, int y) {
//    xpos = round(random(0, width));
//    ypos = round(random(0, height));
//    xvel = round(random(-2, 2));
//    yvel = round(random(-1, 1));
//    if (xvel == 0) xvel = 1;
//    if (yvel == 0) yvel = 1;
//  }

  



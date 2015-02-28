


//fly variables
  //fly 1
float flyX = 250;
float flyY = 160;
float flyW = 43;
float flyH = 51;
  //fly 2
float fly2X = 100;
float fly2Y = 20;
  //fly3
float fly3X = 400;
float fly3Y = 180;
  //fly4
float fly4X = 25;
float fly4Y = 150;
  //fly5
float fly5X = 280;
float fly5Y = 340;



//swarm variables are in the draw loop including "scatter"


//pie and fly and finger and poke
PImage pie;
PImage fly;
PImage finger;
PImage poke;

//finger variables
float fingerX;
float fingerY;
float fingerW = 154;
float fingerH = 219;

//poke hole variables
float pokeX = 1000;
float pokeY = 1000;
float pokeW = 138;
float pokeH = 124;
//poke action
float action;

//get pics ready in setup
void setup() {
size(500,375);
noCursor();
pie=loadImage("pie.jpg");
fly=loadImage("flygif.gif");
finger=loadImage("fingergif.gif");
poke=loadImage("poke.gif");
smooth();
}

void draw() {
  //create pie bg in draw block to overwrite trace images of flies
  background(pie);
  smooth();
  
  //load images in proper layers
  
  //poke holes
  image(poke,pokeX,pokeY,pokeW,pokeH);
  
  //swarm of flies 1
  float scatter = random(4,300); 
  for (float fliesX = 80; fliesX < width-80; fliesX+=60) {
    for (float fliesY = -60; fliesY < height; fliesY+=80) {
      image(fly,fliesX,fliesY,flyW,flyH);
        if (mouseX > 5 && mouseX < width-5 && mouseY > 5 && mouseY < height-5) {
          fliesX=fliesX+scatter;
          fliesY=fliesY+scatter;
      }
    }
  }
  
  
  //swarm of flies 2
  float scatter2 = random(30,300);
  for (float flies2X = width; flies2X > 15; flies2X-=50) {
    for (float flies2Y = height-160; flies2Y > 100; flies2Y-=70) {
      image(fly,flies2X,flies2Y,flyW,flyH);
        if (mouseX > 5 && mouseX < width-5 && mouseY > 5 && mouseY < height-5) {
          flies2X=flies2X-scatter2;
          flies2Y=flies2Y-scatter2;
      }
    }
  }
  
  
  //single flies
  image(fly, flyX, flyY, flyW, flyH);
  image(fly, fly2X, fly2Y, flyW, flyH);
  image(fly, fly3X, fly3Y, flyW, flyH);
  image(fly, fly4X, fly4Y, flyW, flyH);
  image(fly, fly5X, fly5Y, flyW, flyH);
  image(finger,fingerX,fingerY,fingerW,fingerH);
  //fly movement
  if (mouseX > flyX && mouseX < flyX+flyW && mouseY > flyY && mouseY < flyY+flyH) {
    flyX=random(40,460);
    flyY=random(40,335);
  }
  //fly2 movement
  if (mouseX > fly2X && mouseX < fly2X+flyW && mouseY > fly2Y && mouseY < fly2Y+flyH) {
    fly2X=random(40,460);
    fly2Y=random(40,335);
  }
  //fly3 movement
  if (mouseX > fly3X && mouseX < fly3X+flyW && mouseY > fly3Y && mouseY < fly3Y+flyH) {
    fly3X=random(40,460);
    fly3Y=random(40,335);
  }
  //fly4 movement
  if (mouseX > fly4X && mouseX < fly4X+flyW && mouseY > fly4Y && mouseY < fly4Y+flyH) {
    fly4X=random(40,460);
    fly4Y=random(40,335);
  }
  //fly5 movement
  if (mouseX > fly5X && mouseX < fly5X+flyW && mouseY > fly5Y && mouseY < fly5Y+flyH) {
    fly5X=random(40,460);
    fly5Y=random(40,335);
  }
  
  //poke holes and moving finger
  if(mousePressed) {
    pokeX=mouseX-60;
    pokeY=mouseY-54;
    fingerX = mouseX-125;
    fingerY = mouseY-190;
  } else {
    fingerX = mouseX-135;
    fingerY = mouseY-200;
  }
  
  
}
  


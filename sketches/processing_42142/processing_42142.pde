
//create arrays to remember poke holes
int[] pokeX = new int[1000];
int[] pokeY = new int[1000];

//fly variables
float flyX = 250;
float flyY = 160;
float flyW = 43;
float flyH = 51;


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
float pokeW = 138;
float pokeH = 124;
//poke action
float action;

//get pics ready in setup
void setup() {
size(500,375);
noCursor();
//send all the poke holes off screen
for (int i = 0; i < pokeX.length; i++) {
  pokeX[i] = 1000;
  pokeY[i] = 1000;
}
pie=loadImage("pie.jpg");
fly=loadImage("flygif.gif");
finger=loadImage("fingergif.gif");
poke=loadImage("poke.gif");
}

void draw() {
  //create pie bg in draw block
  background(pie);
  smooth();
  //load images in proper layers
      //load all 1000 pokes
  for (int i=0; i<pokeX.length; i++) {
    image(poke,pokeX[i],pokeY[i], pokeW, pokeH);
  }
  image(fly, flyX, flyY, flyW, flyH);
  image(finger,fingerX,fingerY,fingerW,fingerH);
  //fly movement
  if (mouseX > flyX && mouseX < flyX+flyW && mouseY > flyY && mouseY < flyY+flyH) {
    flyX=random(40,460);
    flyY=random(40,335);
  }
  //MULTIPLE!!! poke holes and moving pokefinger
  if(mousePressed) {
    for (int i = 0; i < pokeX.length-1; i++){
      pokeX[i] = pokeX[i+1];
      pokeY[i] = pokeY[i+1];
    }
    pokeX[pokeX.length-1] = mouseX-60;
    pokeY[pokeY.length-1] = mouseY-54;
    fingerX = mouseX-125;
    fingerY = mouseY-190;
  } else {
    fingerX = mouseX-135;
    fingerY = mouseY-200;
  }
  
  //make the pie nice again
  if(keyPressed) {
    for (int i=0; i < pokeX.length; i++){
      pokeX[i]=1000;
      pokeY[i]=1000;
    }
  }
}
  


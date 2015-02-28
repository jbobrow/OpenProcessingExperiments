
//This work try show, as would if we can see the space on the sky..
//Author:Alan Klinger Date: 01/03/2014

//Global variables
PImage campo;
PImage paron;
PImage porsol;
PImage space;
PImage temp;
int image = 1;

//setup
void setup() {
  size (800, 600);
  
  //Load 3 images
  paron = loadImage("paron.jpg");
  campo = loadImage("campo.jpg");
  porsol = loadImage("porsol.jpg");
  
  //Load the universe and other image to initialize temp
  space = loadImage("universo.jpg");
  temp = loadImage("campo.jpg");
  
  //resize images
  temp.resize(800,600);
  campo.resize(800,600);
  paron.resize(800,600);
  porsol.resize(800,600);
  
}

void draw() {
  //copy the chosen image
  if (image == 1){
    temp.copy(campo,0,0,800,600,0,0,800,600);
  } else 
  if (image == 2){
    temp.copy(paron,0,0,800,600,0,0,800,600);
  } else {
    temp.copy(porsol,0,0,800,600,0,0,800,600);
  }
  
  //blend with universe
  temp.blend(space, mouseX, 0, 800, 600, mouseX, 0, 800, 600, OVERLAY);
  image(temp, 0, 0);
  
  //Print instructions
  textSize(18);
  text("Press 1, 2 or 3", 10, 30);
}


//Wait the keypress
void keyPressed() {
  if (key == '1') {
      image = 1;
  }
  if (key == '2') {
      image = 2;
  }
  if (key == '3') {
      image = 3;
  }
}



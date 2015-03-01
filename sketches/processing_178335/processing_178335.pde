
PImage dogola; //declarations of global variables, such as the image objects!
PImage doge;
boolean end = false;
boolean dogolaAlive = false;
boolean dogolaSteal = false;
int tamanhoX = 30; //size for the dog picture that spawns!
int tamanhoY = 30;
int counter = 0; //responsable for the "growing up" of the image!
void setup(){
  size(1280,720);
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  dogola = loadImage("dogola-face.png");
  doge = loadImage("doge.jpeg");
  
}

void draw(){
  if(dogolaAlive == true)
  {
   background(360);
   image(dogola, mouseX, mouseY,tamanhoX,tamanhoY);//if dog has spawned, it follows up your mouse!
   if(tamanhoX > 650)//if the dog reaches a certain size, something happens
   {
     dogolaSteal = true;
     background(0);
     dogolaAlive = false;
   }
  }
  if(dogolaSteal == true && end == false)//this part is responsible for the blinking text and black background
  {
    background(0);
    textSize(32); 
    text("Dog wins", random(1280), random(720));
    fill(0,100,100,100);
  }
  
  
}

void mousePressed(){
  if(dogolaAlive == false && dogolaSteal == false){//spawns the dog and the fun!
    image(dogola, mouseX, mouseY,30,30);
    noCursor();//no mouse cursor for you
    dogolaAlive = true;
  }
  if(dogolaSteal == true && end == false){//spawns the final dog image and end the program, until reset by 'R' key
    image(doge, mouseX, mouseY,200,200);
    end = true;
  }
    
}

void mouseMoved(){
    if(dogolaAlive == true){//responsible for the slow "grow up" of the image
      counter += 1;
      if(counter > 8)
      {
         tamanhoX += 5;
         tamanhoY += 5;
         counter = 0;
      }
   }
}

void keyPressed(){
  if(key == 'r' || key == 'R')//resets the project!
  {
    dogolaAlive = false;
    dogolaSteal = false;
    end = false;
    background(360);
    tamanhoX = 30;
    tamanhoY = 30;
    counter = 0;
  }
  if(key == 's' || key == 'S') saveFrame("screenshot.png"); //basic screenshot saving feature
}




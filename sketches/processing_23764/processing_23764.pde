
void setup(){
  size(500, 600);
  
  //setting up the background
  PImage bg;
  bg = loadImage ("ingredients00.jpg");
  background(bg);
  
  //text coordinates
int textx = 20;
int texty = 30;

//setting up the text instructions
  fill(0);
  PFont font;
  font = loadFont("AmericanTypewriter-Light-12.vlw");
  textFont(font, 12);
  text("Press numbers 1 to 7 to get the ingredients on the list", textx, texty);
  
}


void draw(){
  if(keyPressed){
    if (key =='1'){
      PImage flour;
      flour = loadImage("ingredients01.png");
      image(flour,0,0);
      
    }
    if (key =='2'){
      PImage sugar;
      sugar = loadImage("ingredients02.png");
      image(sugar,0,0);
    }
    if (key =='3'){
      PImage eggs;
      eggs = loadImage("ingredients03.png");
      image(eggs,0,0);
    }
    if (key =='4'){
      PImage butter;
      butter = loadImage("ingredients04.png");
      image(butter,0,0);
    }
    if (key =='5'){
      PImage powder;
      powder = loadImage("ingredients05.png");
      image(powder,0,0);
    }
    if (key =='6'){
      PImage vanilla;
      vanilla = loadImage("ingredients06b.png");
      image(vanilla,0,0);
    }
    if (key =='7'){
      PImage salt;
      salt = loadImage("ingredients07b.png");
      image(salt,0,0);
    }
 
  }
  

}




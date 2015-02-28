
boolean button = false;

int x = 330;
int y = 0;
int w = 100;
int h = 200;
int value = 0;
int bookX = 300;
int bookY = 250;

PImage classroom;
PImage wand;
PImage book; 
PImage knight;
PImage knight2;
PImage cauldron;
PImage cauldron2;
PImage fruit;
PFont f;
float d,z;
float a;


void setup () {
  size(800,600);
  f = loadFont ("Garamond-Italic-20.vlw");
  classroom = loadImage("classroom.jpg");
  wand = loadImage("wand.png");
  knight2 = loadImage ("knight2.png");
  knight = loadImage ("knight.png");
  cauldron = loadImage ("cauldron.png");
  cauldron2 = loadImage("cauldron2.png");
  book = loadImage ("book.png");
  fruit = loadImage ("fruit.png"); 
 
  

}
void draw() {
  
   
  
  image(classroom,0,0);

  
  
  noCursor();


  
// LUMOS and NOX ------------------------------------------------------------  

 if (keyPressed == true) {
    noStroke();
    noFill();
    rect(0, 0,800,1000);
  } else {
    textFont (f,20);
    fill(255);
    text("For LUMOS SPELL, press and hold any key", 330, 570);
    
    noStroke();
    fill(0,0,0,170);
    rect(0, 0,800,1000);
  
  }
  // REDUCIO -----------------------------------------------------------------------
    if (mouseX > 20 && mouseX < 160 && mouseY > 30 && mouseY < 390 && mousePressed) {
    
    image(knight2, 30, 155);
    fill(0);
    text("REDUCIO!", 70, 400);
    
  }else{
   
    image(knight, 20, 60);
    
  }
  
  // ENGORGIO -----------------------------------------------------------------------
    if (mouseX > 450 && mouseX < 550 && mouseY > 240 && mouseY < 340 && mousePressed) {
    
    image(cauldron2, 400, 120);
    fill(0);
    text("ENGORGIO!", 70, 400);
    
  }else{
    
    image(cauldron, 450, 240);
    
  }

  // Apericium spell ---------------------------------------------------
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && mousePressed) {
    button = true;
  }
  else{
    button = false;
  }

  if (button) {
    textFont (f,20);
    fill (134,16,16);
    text ("I solmenly swear", 330, 130);
    text ("I am up to no good.", 325, 155);
    fill(0);
    text ("Transfiguration", 330, 50);
    text ("TEST TODAY!", 325, 85);
    text ("APERECIUM!", 50, 400);
  }else{
    textFont (f,20);
    fill(0);
    text ("Transfiguration", 330, 50);
    text ("TEST TODAY!", 325, 85);

  }
  
 image(wand, mouseX , mouseY);
 
 //Gemino -----------------------------------------------
 
 if (mouseX > 605 && mouseX < 730 && mouseY > 230 && mouseY < 320 && mousePressed) {
    
    image(fruit, 530, 260);
    fill(0);
    text("GEMINIO!", 70, 400);
 }
    
  
  //Wingardium Leviosa--------------------------------------


  if (mouseX > 300 && mouseX < 400 && mouseY > 220 && mouseY < 300 && mousePressed) {
    textFont (f,20);
    fill(0);
    text ("WINGARDIUM", 40, 400);
    text ("LEVIOSA!", 100, 420);

  }else{
    fill(255);
  }

  
  
  translate (z,d);
  image(book,300,250);
  //image(book, bookX, bookY);


  if (mouseX > 300 && mouseX < 400 && mouseY > 220 && mouseY < 300 && mousePressed) {
    d -= 1.0;
  }else{
    d=0;
  }


 
    
} // END DRAW
  





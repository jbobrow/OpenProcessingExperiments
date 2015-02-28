
Circle flatWhite;
Circle americano;
Circle latte;
Circle cappucino;
Circle espresso;
Circle christmas;
Circle gingerbread;
Circle whiteChoc;
Circle chocOrange;

// Simon: Took me ages to understand this whole circle thing! 
// really glad that you (Rachel) explained it in full, makes so much
// more sense now.

PImage img;
PImage Latte;
PImage FlatWhite;
PImage Espresso;
PImage Cappucino;
PImage Americano;
PImage Christmas;
PImage Gingerbread;
PImage WhiteChoc;
PImage OrangeMocha;
PImage GBrecipe;
PImage Lrecipe;
PImage COrecipe;
PImage Crecipe;
PImage CRrecipe;
PImage Erecipe;
PImage FWrecipe;
PImage Arecipe;
PImage WCrecipe;
PImage Background;

void setup(){
   size(960,672);
   img = loadImage("960x672.jpg");
   image(img, 0, 0);

  Background = loadImage("bgrnd.jpg");
  Latte = loadImage("NewLatte.png");
  FlatWhite = loadImage("Flatwhite.png");
  Espresso = loadImage("NewEspresso.png");
  Cappucino = loadImage("NewCappucino.png");
  Christmas = loadImage("ChristmasCircle.png");
  Americano = loadImage("NewAmericano.png");
  Gingerbread = loadImage("Gingerbreadlatte.png");
  WhiteChoc = loadImage("whitechoc.png");
  OrangeMocha = loadImage("ChocolateOrangeMocha.png");
  Crecipe = loadImage("Crecipe.jpg");
  GBrecipe = loadImage("GBrecipe.jpg");
  Lrecipe = loadImage("Lrecipe.jpg");
  COrecipe = loadImage("COrecipe.jpg");
  FWrecipe = loadImage("FWrecipe.jpg");
  Erecipe = loadImage("Erecipe.jpg");
  Crecipe = loadImage("Crecipe.jpg");
  CRrecipe = loadImage("CRrecipe.jpg");
  Arecipe = loadImage("Arecipe.jpg");
  WCrecipe = loadImage("WCrecipe.jpg");
  
  // Simon: encoundered a few problems here, including the names of 
  // certain things clashing as they were elsewere with the same name
  // just changed the capital letters at the start.
  
  flatWhite = new Circle("flatWhite", 255, 225);
  americano = new Circle("americano", 500,110);
  latte = new Circle("latte", 375,165);
  cappucino = new Circle("cappucino", 630,180);
  espresso = new Circle("espresso", 730,250);
  christmas = new Circle("christmas", 265,465);
  gingerbread = new Circle("gingerbread", 430,540);
  whiteChoc = new Circle("whiteChoc", 590,540);
  chocOrange = new Circle("chocOrange", 740,470);
}  
// Simon: using the circle class allowed us to have hidden circles 
// behind our image, giving the illusion of hovering over the image
// and the screen changing. much simpler than trying to use the
// image.

boolean mainScreen = false;

void draw(){
  
    if (mousePressed) {
    image(Background,0,0);
    //FIRST COFFEE CUP

  smooth();

  mainScreen = true;
  
    }
    
    if (mainScreen==true){
      
      drawCoffee();
      
//      americano.display();        // comment this out
      americano.checkHover();
      
//      flatWhite.display();        // comment this out
      flatWhite.checkHover();
      
//      latte.display();        // comment this out
      latte.checkHover();
      
//      cappucino.display();        // comment this out
      cappucino.checkHover();
      
//     espresso.display();        // comment this out
      espresso.checkHover();
      
//      christmas.display();        // comment this out
      christmas.checkHover();
      
//      gingerbread.display();        // comment this out
      gingerbread.checkHover();
      
//      whiteChoc.display();        // comment this out
      whiteChoc.checkHover();
      
//      chocOrange.display();        // comment this out
      chocOrange.checkHover();
      
    }
}


void drawCoffee(){
  image(Background,0,0);
  image(Christmas, 110, 320);
  image(Espresso, 610, 140);
  image(Cappucino, 440, -40);
  image(Americano, 355, -30);
  image(Latte, 165, -45);
  image(FlatWhite, 100, 60);
  image(Gingerbread, 310, 415);
  image(WhiteChoc, 460, 415);
  image(OrangeMocha, 615, 350);
}

// ****************************
//        CLASS: CIRCLE
// ****************************
class Circle{
  float x;
  float y;
  float e_width;
  float e_height;
  float radius;
  float dist;
  String typeOfCoffee; 
   
  // CONSTRUCTOR
  //
  Circle(String temp, int temp_x, int temp_y){
    x = temp_x;
    y = temp_y;
    e_width = 150;
    e_height = 150;
    radius = e_width/2;
    typeOfCoffee = temp;
  }

  // DISPLAY THE CIRCLE
  //
  void display(){
    ellipse(x,y,e_width, e_height);

  }
   
 
  // CHECK IF THE MOUSE IS OVER THE CIRCLE
  // 
  void checkHover(){
    
    // Use Pythagorus Theorum to check the distance from
    // mouse pointer to centre of the circle
    dist = (mouseX - x) * (mouseX - x) + (mouseY - y) * (mouseY - y);
    dist = sqrt(dist);
   
    // change the colour of the 'button' if the mouse hovers over it
    if (dist < radius){
      fill(255);
      if(typeOfCoffee == "flatWhite"){
        image(FWrecipe, 0, 00);
      }
      else if(typeOfCoffee == "americano"){
         image(Arecipe, 00, 0);
      }
      else if(typeOfCoffee == "latte"){
        image(Lrecipe,00,00);
      }
      else if(typeOfCoffee == "cappucino"){
        image(Crecipe,0,0);
      }
      else if(typeOfCoffee == "espresso"){
        image(Erecipe,00,00);
      }
       else if(typeOfCoffee == "christmas"){
        image(CRrecipe,00,00);
      }
      else if(typeOfCoffee == "gingerbread"){
        image(GBrecipe,00,00);
      }
      else if(typeOfCoffee == "whiteChoc"){
        image(WCrecipe,0,00);
      }
      else if(typeOfCoffee == "chocOrange"){
        image(COrecipe,00,00);
      }
      
      // all of this is to do with what comes up when 
      //you hover over a certain image, and what image
     // comes up when you do. It is all defined further up the code
     
    else{
      //drawCoffee();
    }
    }
    // display the circle with the chose fill colour
//    display();      // comment this out
     
  }
 
 
  }




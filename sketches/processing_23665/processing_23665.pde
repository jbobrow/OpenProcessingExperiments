
//declare button variables

//Standard button size is 240 by 80 pixels
 int bW = 150;
 int bH = 150;

//button  on page 1
 int x1 = 50;
 int y1 = 50;

//set the starting page to page 1 
 int page = 1;
 
 //button on page 2
  int x2 = 300;
   int y2 = 50;

//Image variables

PImage img1;
PImage img2;

//PImage = img2;
//Create a variable named "font" to store the font vlw file

PFont font;

// Initial set up only runs once 

 void setup ()
{
    size (500, 500);
      smooth();
      
      img1 = loadImage("redButton.png");
      img2 = loadImage("blueButton.png");
      
      //load font into the variable
  
          font = loadFont("AddElectricCity-48.vlw");
  }

//create the over button function which detects when mouse is inside rectangle
// note it will accept 4 variables as input to the function

 boolean overButton (int x, int y, int w, int h){
 if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
 return true;
 }
 else {
  return false;
 }
}

// logic for going to a page function based on value of the variable "page"

void draw (){
  if (page == 1){
 pageOne();
 }
 if (page == 2){
 pageTwo();
 }
 }

//all the code for page 1

void pageOne () {
    background(242,235,24);
 
//call the over button function and input variables x1, y2, bW and bH

     if (overButton (x1, y1, bW, bH) == true) {

       image(img1, x1, y1);

} else {
          image(img2, x1, y1);
} 
  textFont (font);
  textSize(30);
  text ("Page 2", 60, 120);
  textSize(60);
  text ("Page One", 80, 400);
}


//all the code for page 2

void pageTwo () {
    background(98, 206, 110);
     if (overButton (x2, y2, bW, bH) == true) {
  image(img2, x2, y2);
} else {
   image(img1, x2, y2);
}
   textFont (font);
  textSize(30);
  text ("Page 1", 310, 120);
  textSize(60);
  text ("Page Two", 80, 400);
}

//function for navigating between page functions

void mousePressed() {
  if(page==1) {
    if (overButton (x1, y1, bW, bH) == true){
      page=2;}
  }
  if(page==2) {
    if (overButton (x2, y2, bW, bH) == true){
      page=1;}
  }
}


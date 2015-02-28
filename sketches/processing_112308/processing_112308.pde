
/* @pjs font="ProstoOne-Regular.ttf"; */
/*@pjs preload="background01.png","background02.png";*/


PImage img, img1, imgswp, img1swp; //loads lables for images
PFont myFont;
float x,x1,x2,x3,textx,textx1,textx2,textx3; //storage lables

void setup() {
  size(500,500); //world size
  myFont = createFont("ProstoOne-Regular.ttf", 100); //load font
  textFont(myFont, 24); //font size  
  
  //load images
  img = loadImage("background01.png");
  imgswp = loadImage("background01.png");
  img1 = loadImage("background02.png");
  img1swp = loadImage("background02.png");
  
  x=0.00; //first background image mountains
  x1=1195.00; //2nd background image mountains
  x2=0.00; //first background image flower trees
  x3=1195.00; //2nd background image flower trees
  
  //text varibles
  textx=600;
  textx1=1200;
  textx2=2000;
  textx3=2600;
}

void draw() {
  noStroke();
  background(255);  //background color
  
  image(img, x=x-.25, 0); //first background image mountains
    if(x<width-1695) {x=1195;} //if image leaves background set so that it positions itself after the swpimg
  image(imgswp, x1=x1-.25, 0); //2nd background iamge mountains
    if(x1<width-1695) {x1=1195;} //if image leaves background set so that it positions itself after the img
   
      
  image(img1, x2=x2-.45,0); //first background iamge flower trees
    if(x2<width-1695) {x2=1195;} //if image leaves background set so that it positions itself after the swpimg
  image(img1swp, x3=x3-.45, 0); //2nd background iamge of flower trees
    if(x3<width-1695) {x3=1195;} //if image leaves background set so that it positions itself after the img
    
  text("A short summer night...",textx=textx-.75,435);
    if(textx<width-2000) {textx = textx+3000;}
  text("but in this solemn darkness", textx1=textx1-.75, 450);
    if(textx1<width-2000) {textx1 = textx1+3000;}
  text("one Peony bloomed", textx2=textx2-.75, 475);
    if(textx2<width-2000) {textx2 = textx2+3000;}
  text("by buson", textx3=textx3-.75,450);
    if(textx3<width-2000) {textx3 = textx3+3000;}
    
}




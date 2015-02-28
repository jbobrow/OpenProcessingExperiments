
/*@pjs font = "Hun Legion.ttf" ; */

int myState = 0 ;
PImage firstimg ;
PImage secondimg;
PImage thirdimg;
PImage fourthimg;
PImage blackwhite;
PFont africa;
void setup(){
  
size(700, 700);
africa = createFont("Hun Legion.ttf");
firstimg = loadImage("titlepage.jpg");
secondimg = loadImage("secondimg.jpg");
thirdimg = loadImage("thirdimg.jpg");
fourthimg = loadImage("fifthimg.jpg");
blackwhite = loadImage("blackwhite.jpg");
}

void draw() {
  textAlign(CENTER,CENTER);
switch (myState) {
  
  case 0:
  image(firstimg, 0, 0, 700, 700);
  fill(#ffffff);
  textFont(africa, 100);
  text("When I born", 275, 300);
  text("I Black", 250, 500);
  break;
  
  case 1:
  image(secondimg, 0, 0, 700, 700);
  fill(#000000);
  textFont(africa, 50);
  text("When I born I black", 400, 100);
  break;
  
  case 2:
  image(thirdimg, 0, 0, 700,700);
  fill(#000000);
  textFont(africa, 50);
  text("When you born you pink", 400, 100);
  break;
  
   case 3:
  image(blackwhite,0, 0, 700, 700);
  fill(0);
  textFont(africa, 50);
  text("When I grow up, I black", 300, 100);
  text("When you grow up, you white", 300, 190);
  break;
  
    case 4:
  image(fourthimg ,0, 0, 700, 700);
  fill(0);
  textFont(africa, 50);
  text("and yet you call me colored", 300, 100);
  break;
}
} 

void mousePressed() {
myState = myState + 1 ;
if (myState > 5) {
  myState = 0 ;
}
}



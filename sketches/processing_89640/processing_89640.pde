

/* @pjs font="Raleway-Heavy.ttf"; */
/* @pjs font="Raleway-Light.ttf"; */
PFont rh;
PFont lr;
PImage np1;

int x = 300;
int y = 400 ;
 


void setup() {
  
  frameRate(24) ;
  size(600, 400);
  rh = createFont("Raleway-Heavy.ttf", 240) ;
  lr = createFont("Raleway-Light.ttf", 240);
  
  np1 = loadImage("nippersink.jpg") ;

}

void draw() {
  
  background(100);
  
  image(np1, 0, 0, width, height) ;
  
  fill( 255, 80);
  textFont(rh, 200) ;
 // textAlign(CENTER. CENTER);
 stroke(0);
  text("Nippersink", x, height/2) ;
  text("Nippersink", 20, y) ;
  fill(255, 100);
  textFont(lr, 20);
  text("Residents in the watershed (your neighbors) believe that lawn ", 10, 370);
  text("and yard care practices can influence water quality", 30, 390);
  fill( 255, 80);
  textFont(rh, 15);
  text("Overall, residents show strong support for improving water quality despite potential downfalls. Residents also connect their actions to the welfare of the community and overall water quality. ", x, 260);
  

  x--;
  if (x < -400) {
    x = 300;
  }
  
     y--;
  if (y < 6) {
   y = 200 ;
  }

}



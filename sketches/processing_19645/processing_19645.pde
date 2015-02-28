
//GLOBAL VARIABLES
float colorWhite = 255;
float colorBlack = 0;
float grassR = 137;   
float grassG = 211;
float grassB = 68;

Tiger[] tiger = new Tiger[10];
Star[] star = new Star [100];

void setup() {
  size(350,350);
  smooth();
  
  for (int i = 0; i < star.length; i++) {
   star[i] = new Star(random(0,width),random(0,height/2),255,255,255);
 }
  
  for (int i = 0; i < tiger.length; i++) {
    tiger[i] = new Tiger(240,210,105,115,252,161,23);
  }
}
  
  
void draw() {
  //BACKGROUND
  backgroundColor();
  
  //STARS
  for (int j = 0; j < star.length; j++) {
    star[j].show();
    star[j].move();
    star[j].change();
  }

  //TIGERS
  for (int i = 0; i < tiger.length; i++) {
    tiger[i].display();
    tiger[i].move();
    tiger[i].change();
  }
}

 void mousePressed() {
   Tiger b = new Tiger(mouseX,constrain(mouseY,height/2,250),85,100,random(230,255),random(130,175),random(10,60));
   tiger = (Tiger[]) append(tiger,b);
 }

  


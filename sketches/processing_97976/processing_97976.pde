
/*@pjs font = "NotoSans-Regular.ttf, [z] Arista light.ttf, UnityDances.ttf, [z] Arista.ttf " ; */

PImage dna ;
PImage intro;
PFont noto;
PFont unity;
PFont arista;
PFont Arista;
int x = 1;
int x1 = 1;
int myCtr =5*24 ;
int myState = 0;

void setup() {
  noto = createFont("NotoSans-Regular.ttf", 72);
  size(1920, 1080);
  dna = loadImage("dnastrand.jpg");
  myCtr = 2*24 ;
  arista = createFont("[z] Arista light.ttf", 100);
  intro = loadImage("dnastrand-Recovered.jpg");
  unity= createFont("UnityDances.ttf", 200);
  Arista = createFont("[z] Arista.ttf", 100);
}

void draw() {
  
  switch(myState){
    case 0:
       image(intro, 0, 0);
       textFont(Arista, 150);
       fill(#02C65C);
       text("Underlying", width/2.9, height/2+180);
        text("Sustainability", width/3.55, height/2+350);
        textFont(arista, 10);
        fill(#0000FF);
        text("Cornelius Jordan", 1900, 1060);
          myCtr-- ;
      if(myCtr < 0) {
        myState = 1 ;
        myCtr = 60*24;
        
      }
      break;
      
    case 1: 
      image(dna,x,0);
    textFont(noto, 70);
    fill(#FFFFFF);
    textFont(arista, 50);
    text("49 male...", x+150, height/3);
    textFont(arista, 50);
    text("and 56 female (woooo! go women!)", x+200, height/2.2);
    textFont(arista, 125);
    text("Spanning the 18-65 age group", x+60, 665);
    textFont(arista, 30);
    text("24", x, 23);
    textFont(unity, 24);
    text("41", x+2640, 282);
    textFont(arista, 60);
    text("27", x+2500, 600);
    fill(#3F7468);
    textFont(arista, 150);
    text("25", x+2200, 400);
    text("39", x+2187, 139);
      fill(#3FFFF8);
    textFont(unity, 75);
    text("23", x+2100, 1145); 
    text("65", x+2210, 1075);
    text("21", x+3222, 2195);
    text("30", x+2040, 115);
    text("50", x+2834, 1300);
    textFont(arista, 400);
    text("PC", x+3108, height/4); 
    fill(#3F7916);
    textFont(arista, 250);
    text("Mac", x+3300, 1000);
   fill(#D33D06); 
     textFont(arista, 50);
    text("Mac", x+3000, 700); 
    x1 = x1 +1;
     x = x - 1;
    
     if(x < -1925) {
       x = 0;
      myState = 0 ; 
    myCtr = 10*24 ;
     }
       break;  
        
      }
}

 



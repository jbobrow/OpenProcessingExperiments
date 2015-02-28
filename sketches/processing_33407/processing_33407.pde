
//WenChing//

//HW6//
PImage bg;
PImage kiss;
int bview;
int nummiss;
int numwords;
int numhorse;
float xPos;
float yPos;
PFont font;

void setup() {
  size(600,500);
  font= loadFont("Serif-24.vlw");
  bg=loadImage("bg.jpg");
  
  kiss=loadImage("kiss.gif");
 //CREATE FONT, seriously//
  textFont(font, 16);
  
  //NOT ("CENTER")//
  textAlign(CENTER);
  nummiss=20;
  numwords=10;
  numhorse=5;
  //iswinner and lotternum are totally different condition//
}


void draw() {
  
  imageMode(CORNER);
  image(bg,0,0);
  
  imageMode(CENTER);
  image(kiss,600,500,10,10);

    

    for(int i = 1; i < numwords; i+=2) {
      text("miss you, Mackinac Island", width/2, 20 + 20*i);    
    }
    
        for(int i = 0; i < nummiss; i+=3){
        image(kiss,xPos + 400+i*(pow(-1, (i+2))), yPos+40+20*(i+1), 20, 20);
       
    }


        for(int i = 0; i < numhorse; i+=10){
        image(kiss,xPos + 400+i*(pow(-1, (i+2))), yPos+40+20*(pow(i,1)), 20, 20);
       
    }
    
    xPos = xPos + 1;
    
}



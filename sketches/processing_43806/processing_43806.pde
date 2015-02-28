
PFont font;

//variables x and y
int xMax = -220;
int yMax = 150;
int xFra = 500;
int yFra = 90;
int xStef = 90;
int yStef = 450;

//variables speed
int speedMax = 2;
int speedFra = 2;
int speedStef = 1;


void setup(){
  size(400, 400);
  font = loadFont("LeituraSans-Grot4-48.vlw");
  smooth();
}

void draw(){
  background(255);
  textFont(font);
  textSize(30);
  fill(9, 124, 222);
  text("massimochirico", xMax, yMax);
  fill(36, 147, 44);
  text("francescobrogi", xFra, yFra);
  textSize(20);
  fill(0);
  textAlign(CENTER);
  String Stef = "...they are doing exercises for Steffen Klaue"; //textbox
  text(Stef, xStef, yStef, 220, 200);
  
  //massimochirico cames back
  if (xMax > 500) {
      xMax = -220;
   }
   
   //francescobrogi cames back
   if (xFra < -270) {
      xFra = 500;
   } 
   //text stef cames back
   if (yStef < -200) {
      yStef = 450;
   } 
  
  //movements
  xMax = xMax + speedMax;
  xFra = xFra - speedFra;
  yStef = yStef - speedStef;
  
  
  
}


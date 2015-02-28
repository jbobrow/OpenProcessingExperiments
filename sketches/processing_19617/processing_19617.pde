
Avatar[] avatar = new Avatar [3];
int xPos = 1;
int yPos = 50;

void setup () {
  size (450,300);
  background (159,175,160);
  smooth();
  
  for (int i = 0; i< avatar.length; i++) {
  avatar[i] = new Avatar (xPos,yPos,1,1,1);
  xPos += 120;
  yPos += 1;
  }
}
  //background color variables
  float r = random (0,255);
  float g = random (0,255);
  float b = random (0,255);
  float a = random (0,255);
 
  void draw() {
    for (int j = 0; j < avatar.length; j++) {
      avatar[j].display();
    }
}
   
// background color shift when press mouse
  void mousePressed () {
  background (r,g,b,a);
  }
  void mouseReleased () {
  background (211,102,193);
  }
//GLOBAL VARIABLES
  int colorR = 173;
  int colorG = 141;
  int colorB = 149;
  
//CLASS
  class Avatar {
   
//FIELDS 
  float x;
  float y;
  int wide;
  int tall;
  int colorP;
 
//CONSTRUCTOR
  Avatar(float tempX, float tempY, int tempWide, int tempTall, int tempColorP) {
  x = tempX;
  y = tempY;
  wide = tempWide;
  tall = tempTall;
  colorP = tempColorP;
  }
  
//METHODS

//head
  void display () { 
  fill (colorP+126,colorP+44,colorP+242);
  stroke (colorP+126,colorP+44,colorP+242);
  ellipse (x+100,y+35,wide+60,tall+35);
  rect (x+70,y+40,wide+60,tall+30);
  
//balloons 
  fill (255,mouseX,mouseY);
  stroke (255,mouseX,mouseY);
  ellipse (x+57,y+50,wide+30,tall+38);
  triangle (x+57,y+70,x+60,y+73,x+54,y+73);
  fill (colorR,colorG,colorB);
  stroke (colorR,colorG,colorB);
  line (x+57,y+73,x+57,y+113);
   
//balloon 2
  fill (mouseX,mouseY,255);
  stroke (mouseX,mouseY,255);
  ellipse (x+50,y+40,wide+32,tall+38);
  triangle (x+50,y+60,x+53,y+64,x+47,y+64);
  fill (colorR,colorG,colorB);
  stroke (colorR,colorG,colorB);
  line (x+50,y+65,x+50,y+113);

//eyes change size depending on mouse location
  if (mouseX < width/3) {
   fill(0);
   stroke(255);
   ellipse (x+85,y+45,wide+5,tall+5);
   ellipse (x+115,y+45,wide+5,tall+5); 
}  else if (mouseX < 2*width/3) {
   fill(255);
   stroke(255);
   ellipse (x+85,y+45,wide+9,tall+9);
   ellipse (x+115,y+45,wide+9,tall+9);
   fill(0);
   noStroke();
   ellipse (x+85,y+45,wide+6,tall+6);
   ellipse (x+115,y+45,wide+6,tall+6);
}  else {
   fill(255);
   stroke(255);
   ellipse (x+85,y+45,wide+12,tall+12);
   ellipse (x+115,y+45,wide+12,tall+12);
   fill(0);
   noStroke();
   ellipse (x+85,y+45,wide+9,tall+9);
   ellipse (x+115,y+45,wide+9,tall+9);
}
  
//body
  fill(colorP+126,colorP+44,colorP+242);
  stroke (colorP+126,colorP+44,colorP+242);
  rect (x+67,y+80,wide+66,tall+70);
 
//arms
  quad (x+67,y+93,x+67,y+113,x+52,y+120,x+45,y+102);
  quad (x+133,y+93,x+155,y+102,x+148,y+120,x+133,y+113);
 
//feet
  rect (x+70,y+150,wide+20,tall+20);
  rect (x+110,y+150,wide+20,tall+20);
  
//heart
   if (mouseX < width/2) {
   fill(242,27,34);
   stroke (242,27,34); 
   ellipse (x+112,y+95,wide+5,tall+5);
   ellipse (x+118,y+95,wide+5,tall+5);
   triangle (x+109,y+96,x+119,y+98,x+115,y+105);
   }
   else {
   fill(242,27,34);
   stroke (242,27,34); 
   ellipse (x+112,y+95,wide+8,tall+8);
   ellipse (x+120,y+95,wide+8,tall+8);
   triangle (x+108,y+98,x+124,y+98,x+116,y+105);
   }
 }

 } 
    
 
    
  
                
                

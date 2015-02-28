
PFont hiddenFont;
hidingText hiddenWord;
public float opWordVal = 255; //violating my careful programming here, but its Wednesday! 

color ellipseColor;
color bgColor;
color textColor;

color[] palette = new color[5];
color c1;
color c2;
color c3;
color c4;
color c5;
int colorIndex;

void setup(){
  size(600,600);
  definePalette();
  bgColor = 0;
  textColor = 0;
  ellipseColor = 255;
  frameRate(18);
  
  noCursor();
  noStroke();
  
  hiddenFont = createFont("Aharoni-Bold-48",96);
  textFont(hiddenFont);
  
  hiddenWord = new hidingText("Hidden",150,300);
}

void draw(){
  background(bgColor);
  fill(ellipseColor);
  ellipse(mouseX,mouseY,75,75);
  fill(textColor, opWordVal);
  hiddenWord.writeText();
  if(hiddenWord.checkMouse()){
    hideAway();
  }
}

void definePalette(){
  //This palette utterly robbed from Kuler user shell_77345: https://kuler.adobe.com/#themes/search?term=userId:865692
    c1= color(23,76,79);
    c2= color(32,113,120);
    c3= color(255,150,102);
    c4= color(255,225,130);
    c5= color(245,233,190);
    
    palette[0] = c1;
    palette[1] = c2;
    palette[2] = c3;
    palette[3] = c4;
    palette[4] = c5; 
}

void hideAway(){
  colorIndex = int(random(0,5));
  ellipseColor = palette[colorIndex];
  colorIndex = int(random(0,5));
  bgColor = palette[colorIndex];
  textColor = palette[colorIndex];
  if(bgColor == ellipseColor){
     ellipseColor = palette[1]; //Haha. All I'm doing is reducing the statstical prob., not solving the issue.  
  }
  hiddenWord.resetPosition(int(random(0,width - hiddenWord.wordWidth)),int(random(0,height)));
}

class hidingText{
 
  //definables
 int x;
 int y;
 String word;
 //keep yo' hands off.
 float wordWidth;
 float wordHeight;
 int mouseCounter;
 
 
hidingText(String text,int eX, int eY){
  x = eX;
  y = eY;
  word = text;
  wordWidth = textWidth(word);
}

void writeText(){
    text(word,x,y);
}

boolean checkMouse(){
 if(mouseX > x && mouseX < x + wordWidth){
   if(mouseY > y - 70 && mouseY < y + 90){ //No wordHeight prop! Boooo!
     print("Adding to counter");
      mouseCounter++;
      opWordVal-= 3;
   }
 }
 else{mouseCounter = 0; opWordVal+=2;}
 
 if(opWordVal >= 255){opWordVal = 255;}
 if(opWordVal <=0) {opWordVal = 0;}
 
 if(mouseCounter > 90){ //5s at 18fps
   print("Exceeded counter");
   mouseCounter = 0;
   opWordVal = 255;
   return true;
 }
 else{return false;}

}

void resetPosition(int eX, int eY){
   x = eX;
   y = eY; 
}
  
}


char wordArray[] = new char[7];
int textX;
int textY;
boolean isExploded;
color bgColor;
int rVal;

int curX;
int curY;

float yNoise;
int noiseMod;

PFont hiddenFont;

void setup(){
  size(600,600);
  frameRate(15);
  colorMode(RGB,255);
  isExploded = false;
  hiddenFont = createFont("pixelmix-48",48);
  textFont(hiddenFont);
  bgColor = color(0,0,0);
  rVal = 0;
  
  wordArray[0] = 'e';
  wordArray[1] = 'x';
  wordArray[2] = 'p';
  wordArray[3] = 'l';
  wordArray[4] = 'o';
  wordArray[5] = 'd';
  wordArray[6] = 'e';
  
  textX = 150;
  textY = 300;
  //start 'em off as defaults
  curX = textX;
  curY = textY;
}

void draw(){
  bgColor = color(rVal,0,0);
  background(bgColor);
  checkMouse();
  if(!isExploded){setNoisyText();}
}

void setNoisyText(){
  for(int i = 0; i < wordArray.length; i++){
  //  curX += textWidth(wordArray[i]);
    yNoise = noise(random(width),random(height)) * noiseMod;
    curX += 30;
    text(wordArray[i],curX,curY + yNoise);
  }
   curX = textX;
}

void checkMouse(){
  if(mouseX > textX && mouseX < textX + 250){
   if(mouseY > textY - 70 && mouseY < textY + 90){ //No wordHeight prop! Boooo!
    // print("mOver word");
     noiseMod++;
     rVal += 2;
   }
   
   if(noiseMod > 100){
    explodeWord();
   }
 }
}

void explodeWord(){
   isExploded = true;
   for(int i = 0; i < wordArray.length; i++)
   {
     text(wordArray[i],int(random(width)),int(random(height)));
   }
}


int STATE=0;
int counter = 0;
int counterVowel=0;
color Color=color(255,255,255);

String[] consonantList = {
  "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
};
String[] consonantSound= {
  "[g", "[n", "[d", "[l", "[m", "[b", "[s", "[Ø", "[j", "[ch", "[k", "[t", "[p", "[h"
};
String[] vowelList= {
  "ㅏ", "ㅑ", "ㅓ", "ㅕ", "ㅐ", "ㅒ", "ㅔ", "ㅖ", "ㅣ", "ㅏ"
};
String[] vowelSound= {
  "a]", "ja]", "ʌ]", "jʌ]", "æ]", "jæ]", "e]", "je]", "i]", "a"
};


void setup() {
  size(400, 400);
}
void draw() {  
  background(Color);
  fill(255);
  drawLetter(consonantList[counter], 160, 190, 6);
  drawLetter(consonantSound[counter], 155, 300, 3);
  
  drawLetter(vowelList[counterVowel], 205, 200, 7);
  drawLetter(vowelSound[counterVowel], 210, 300, 3);
  
  if(mouseX < width/2){
    fill(255, 0, 0);
      drawLetter(consonantList[counter], 160, 190, 6);
  drawLetter(consonantSound[counter], 155, 300, 3);
  }
    
  if(mouseX > width/2){
    fill(255, 0, 0);
  drawLetter(vowelList[counterVowel], 205, 200, 7);
  drawLetter(vowelSound[counterVowel], 210, 300, 3);
  }

  println(counter);
  
  if(counter==0){
    background(0);
    fill(255);
    text("If you wanna learn basic Korean letters", 90,150);
    text("CLICK TO START", 150,200);
  }
}
  





void mousePressed() {
  Color=color(random(255),random(255),random(255));
  
  counter += 1;
  if (counter>13) {
    counter=0;
  }  
  counterVowel +=1;
  if (counterVowel>8) {
    counterVowel=0;
    //if (mouseX< width/2){
      //background( random(255), random(255), random(255));}
    //if (mouseX>width/2){
  }
// if (mouseX<width/2){
   
 
 //if(mouseX>width/2){
 }
void keyPressed(){
  if(keyCode==ENTER){
    STATE=1;
    background(Color);
  }
}
void drawLetter(String l, float _x, float _y, float size) {
  pushMatrix();
  translate(_x, _y);
  scale(size);
  text(l, 0, 0);
  popMatrix();
}


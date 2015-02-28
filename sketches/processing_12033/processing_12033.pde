
import rita.*;

/** PDAL Assignment 1: Self-Portrait
  * by Miranda Steele
  **/
  
int i=0, x=30, y=50, upCounter = 0;
// The diary entry
String s = "Wednesday, January 20th 2010 Ouch... my head hurts so badly. Last day in Tampa - so hard to believe tomorrow I will be back in the snow capital... so exciting though! I'm not necessarily excited for all the travel & cleaning, but it shouldn't be too bad. I'm almost all packed :D just my toiletries & the odds and ends left. I also need to smoke the rest of my weed - hopefully after my headache clears. Talked to Matt today... he's in Miami with his Australian friend Joel. We mostly talked about Joel's girlfriend problems. Sarah got an interview today with Georgetown :D the first of many, I hope. Betty & I had a nice day today, shopping & running last minute errands. She baked me cookies for the plane ride up :) such a cutie. Tomorrow night is our first TA dinner of TA camp! So so excited :P sigh, I've got to go, - Miranda";
RiText[] letters;
PFont font;

void setup(){
  size(600, 560);
  frameRate(2);
  
  //Setting up the font
  font = loadFont("LiSongPro-24.vlw");
  letters = convertMKS(s);
  
}

void draw() {
  background(0);
  
  //This part causes the letters to be displayed as if someone were typing them.

  letters[i].setColor(255, 255, 255);
  letters[i].setX(x);
  letters[i].setY(y);

  //Setting the coordinates for the next letter
  x+=30;
  if(x > 550){
    y+=40;
    x=30;
  }
  
  //The case where the letters are running off the page
  if(y>560){
    for(int j=0; j<i+1; j++){
      if(letters[j].getY()>60){
        letters[j].setY(letters[j].getY()-60);
      }
      else
        letters[j].setVisible(false);
    }
    y-=60;
  }
  
  if(i<letters.length-1)
    i++;
  else
    noLoop(); //Stop when it runs out of text
}

/**
 * This part allows for an increasing amount of letters to be shown (from just my
 * initials to all the letters in my full name) when the up key is pressed
 */
void keyPressed() {
   if(key == CODED && keyCode == UP){
       if(upCounter<2){
         upCounter++;
         noLoop();
         RiText.deleteAll();
         if(upCounter==1)
            letters= convertMiranda(s);
          else if(upCounter==2)
            letters = convertFull(s);
         //Reinitalizing draw variables (i, x, y)
         i=0;
         x=30;
         y=50;
         loop();
     }
   }
}

/**
 * Converting the diary entry into the letters of the entry with only 
 * the letters in my name included. This method has the letters of my full
 * name (m, i, r, a, n, d, k, t, h, e, s, l).
 */

RiText[] convertFull(String s) {
  String convertedS = "";

  for(int i=0; i<s.length(); i++){
    char c = s.charAt(i);
    if(c=='m'||c==' '||c=='k'||c=='K'||c=='s'||c=='S'||c=='i'||c=='r'||c=='a'||c=='n'||c=='d'||c=='k'||c=='t'||c=='h'||c=='e'||c=='s'||c=='l'||c=='M'||c=='I'||c=='R'||c=='A'||c=='N'||c=='D'||c=='K'||c=='T'||c=='H'||c=='E'||c=='S'||c=='L'){
      convertedS=convertedS +c;
    }
    else {
        convertedS=convertedS+"_";
    }
  }
  return RiText.createLetters(this, font, convertedS, 0, 0);
}

//Same as above, but with only (m, k, s)
RiText[] convertMKS(String s){
  String convertedS = "";

  for(int i=0; i<s.length(); i++){
    char c = s.charAt(i);
    if(c=='m'||c=='M'||c=='k'||c=='K'||c=='s'||c=='S'||c==' '){
      convertedS=convertedS +c;
    }
    else {
        convertedS=convertedS+"_";
    }
  }

  return RiText.createLetters(this, font, convertedS, 0, 0);
}

//Same as above, but with (m, i, r, a, n, d, k, s)
RiText[] convertMiranda(String s){
  String convertedS = "";

  for(int i=0; i<s.length(); i++){
    char c = s.charAt(i);
    if(c=='m'||c=='M'||c=='i'||c=='I'||c=='r'||c=='R'||c=='a'||c=='A'||c=='n'||c=='N'||c=='d'||c=='D'||c=='k'||c=='K'||c=='s'||c=='S'||c==' '){
      convertedS=convertedS +c;
    }
    else {
      convertedS=convertedS+"_";
    }
  }

  return RiText.createLetters(this, font, convertedS, 0, 0);
}


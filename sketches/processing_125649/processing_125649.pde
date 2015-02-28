
//Program based on the code shown in Form + Code book by Casey Reas and LUST studio
//Processing 2.0

//import java.util.*;

Word[] textWords = new Word[0];

float x=100;                    //initial axis value
float fontSize = 34.7;            //initial font size
float y = 70+fontSize*0.75;     //initial axis value
float exponent = 0.282;         //decrease rate font size
float barEase=0.986;            //bar easing
float barLength=6;

int i;
int totalWords;                  //store total words of the text file
PFont font;
float barStroke, barHeight;
float ascent, descent;
float nextFontSize = fontSize;
float[] barSize = new float[5];
float[] topFive = new float[5];
boolean drawWords, drawBars;

void setup() {
  size(600, 800);
  background(255,250,245);
  frameRate(150);
  fill(80);
  font = createFont("Monospaced", fontSize,true);        //monospaced font is used to facilitate spacing calculations
  textFont(font);
  textSize(fontSize);
  textWords = countAndOrder("OfMiceAndMen.txt", textWords);  //Any text can be used as input
  for(int i=0; i<5; i++){                                //map the 5 most repeated words
    topFive[i]=map(textWords[i].count,0,textWords[0].count,100,width-100);
    barSize[i]=100;
  }
  drawWords=true;
}

void draw(){
  if(drawWords){
    text(textWords[i].ww, x, y);
    x += textWidth(textWords[i].ww);                                    //updates horizontal position
    nextFontSize = textWords[i+1].count / float(textWords[0].count);    //updates font size
    nextFontSize = pow(nextFontSize, exponent)* fontSize;
    textSize(nextFontSize);
    if(nextFontSize>9.5){  x += textWidth(" ")*0.75;  }                 //restrain minimum font size
    else{  x += textWidth(" ")*1.1;  }
    if ((x + textWidth(textWords[i+1].ww + " ")) > width-100) {         //if text gets to the right border,
      x = 100;                                                          //go back to beginning,
      ascent = textAscent();
      descent = textDescent();
      y += ascent + descent * .1;                                       //and updates vertical position
    }
    i++;
    if(y>height-180){                                                   //if last word is drawn, draw bars
      drawWords=false;
      drawBars=true;
    }
  }
  if(drawBars){
    strokeWeight(17);
    strokeCap(SQUARE);
    textSize(12);
    fill(255,250,245);
    barHeight=height-80;
    barStroke=90;
    for(int i=0;i<5;i++){
      stroke(barStroke);
      line(100, barHeight, barSize[i], barHeight);
      textAlign(LEFT);
      text(textWords[i].ww, 105, barHeight+4);
      textAlign(RIGHT);
      if(i!=0){  text("["+textWords[i].count+"]", barSize[i]-5, barHeight+4);  }
      else{ text("["+textWords[0].count+"/"+totalWords+"]", barSize[0]-5, barHeight+4);  }
      barHeight-=20;
      barStroke+=15;
      barSize[i]+=barLength;
      if(barSize[i]>=topFive[i]){  barSize[i]=topFive[i];  }
      if(barSize[0]>=topFive[0]){
        noLoop();
      }
    }
    barLength=barLength*barEase;
  }
}

Word[] countAndOrder(String textFile, Word[] wordList) {                  //count and order words in text file
  String[] lines = loadStrings(textFile);
  String[] exclude = {"A","E","T"};                                       //list of excluded words and characters to be filtered and NOT considered
  for (int i=0; i<lines.length; i++) {
      String[] thisLine = splitTokens(lines[i], " —*,;.:!'“”?()\"-");     //the program splits words using the characters of this list
      for (int j=0; j<thisLine.length; j++) {
        String word = thisLine[j].toUpperCase();                          //make words Upper Case
        totalWords++;                                                     //each word is counted and added to the totalWords variable
        for(int n=0; n<exclude.length; n++){                              //condition to compare and exclude words of the exclude list
          if(word.equals(exclude[n])){
            word = word+totalWords;
            break;
          }
        }
        boolean newWord = true;
        for (int k=0; k<wordList.length; k++) {                           //check if the current word is a new word or a repetition
          if (word.equals(wordList[k].ww)) {
            newWord = false;
            wordList[k].count++;
            break;
          }
        }
        if (newWord == true) {
          Word next = new Word(word);
          wordList = (Word[])append(wordList, next);
        }
      }
  }
  Arrays.sort(wordList);       //organize array
  return wordList;
}

class Word implements Comparable {
  String ww;
  int count = 1;
  Word(String txt){  ww = txt;  }
  int compareTo(Object o){
    Word other = (Word)o;
    if(other.count > count) {  return 1;  }
    if(other.count == count){  return 0;  } 
    else{  return -1;  }
  }
}


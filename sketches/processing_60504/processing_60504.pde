
PFont f;
int screenLines = 27;
String[] quixote;
String[] buffer = new String[screenLines];
String[] lineWords; 
String presentLine;
int lineCount = 0;
int wordCount = 0;
int charCount = 0;

void setup(){
  size(800,600);
  background(255);
  fill(64);
  smooth();
  f = loadFont("georgia.vlw");
  textFont(f,18);
  quixote = loadStrings("pg2000.txt");
  for(int i=0;i<buffer.length;i++){
    buffer[i]="";
  }
  presentLine ="";
  lineWords = split(quixote[0]," ");
}

void draw(){
  background(255);
  for(int i=0;i<screenLines;i++){  
    text(buffer[i],20,i*20+30);
  }
  text(presentLine,20,570);

}

///// LONG VERSION, one character at a time

//void keyPressed(){
//  if(charCount==quixote[lineCount].length()){
//    for(int i=0;i<buffer.length-1;i++){
//      buffer[i] = buffer[i+1];
//    }
//    buffer[buffer.length-1]=presentLine;
//    charCount = 0;
//    lineCount++;
//    //lineWords = split(quixote[lineCount]," ");
//    presentLine = "";
//
//  } else {
//    presentLine = presentLine + quixote[lineCount].charAt(charCount);
//    charCount++;
//  }
//}

///// "SHORTER" VERSION, one word at a time

void keyPressed(){
  if(wordCount==lineWords.length){
    for(int i=0;i<buffer.length-1;i++){
      buffer[i] = buffer[i+1];
    }
    buffer[buffer.length-1]=presentLine;
    wordCount = 0;
    lineCount++;
    lineWords = split(quixote[lineCount]," ");
    presentLine = "";

  } else {
    presentLine = presentLine + " " + lineWords[wordCount];
    wordCount++;
  }
}


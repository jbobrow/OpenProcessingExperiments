
ArrayList allWords = new ArrayList();
//ArrayList allcolors = new ArrayList(); 
color [][] myPixels = new color [600][599];
boolean initiliazed = false;
PFont helvet;



void setup(){
  helvet = createFont("Helvet", 20);
    size(600, 599);
  PImage picture = loadImage("resized.jpg");
  image(picture, 0, 0);
  picture.loadPixels();
  for(int i = 0; i<600; i++){
    for(int j= 0; j<599; j++){
      myPixels[i][j] = get(i,j);
    }
  }
  background(0);



  //Grabs each single line from the txt file
  String getLines[] = loadStrings("whiteAlbum.txt");
  int songNum = -1;
  for(int i=0; i<getLines.length; i++){
   //println(getLines[i]); 
   
   //Split the current line into separate words
   String [] wordSplit = split(getLines[i], ' ');
   
   //checks for title name
   String[] excl = match(wordSplit[0], "!");
   if(excl != null){
    songNum+=1;
    println(songNum);
   }
   
   //if line isn't title name
  else{

   for(int j=0; j<wordSplit.length; j++){
     //boolean matched = false;
     //println(wordSplit[j]);
    //check for matching

     for(int k=0; k<allWords.size();k++){
//       Word thisWord = (Word) allWords.get(k);
//
//
//
//     if(thisWord.theWord.equals(wordSplit[j])){
//       matched = true;
//       thisWord.changeAppearance(songNum);
       //println(wordSplit[j] + " matched with " + thisWord.theWord);
       
     //}
     }
    //if(matched == false){
    //println(wordSplit[j]);
    allWords.add(new Word(wordSplit[j], songNum));
    //}
   
   }
  }
  }
  
  //checking that songs are stored correctly
// for(int n=0; n<allWords.size();n++){
//  Word thisWord = (Word) allWords.get(n);
//  if(thisWord.theWord.equals("a") || thisWord.theWord.equals("the") || thisWord.theWord.equals("to") || thisWord.theWord.equals("is") || thisWord.theWord.equals("in")){
//    
//  }
//  else{
//  //println(thisWord.theWord + thisWord.wordCount);
//  thisWord.printWord();
//  }
// }
}
  



void draw(){
  background(255);
  textFont(helvet);
if(initiliazed == false){
  println("working");
  background(255);
//  for(int i = 0; i<599; i++){
//    for(int j= 0; j<598; j++){
//      noStroke();
//     fill(myPixels[i][j]);
//      rect(i, j, 1, 1);
initiliazed = true;
}
    
for (int f=0; f<1; f++){   
for(int i=0; i<allWords.size(); i++){
 Word thisWord = (Word) allWords.get(i);
 if(thisWord.songNumber == 0){
 int roundX = round(random(0,290));
  int roundY = round(random(305, 598));
 fill(myPixels[roundX][roundY]);
 text(thisWord.theWord, roundX, roundY );
 }
 //if Paul Wrote
  if(thisWord.songNumber == 14 ||  thisWord.songNumber == 12 || thisWord.songNumber == 10 || thisWord.songNumber == 8 || thisWord.songNumber == 0 || thisWord.songNumber == 2  || thisWord.songNumber == 3  || thisWord.songNumber == 4 ){
 int roundX = round(random(0,290));
  int roundY = round(random(305, 598));
 fill(myPixels[roundX][roundY]);
 text(thisWord.theWord, roundX, roundY );
 }
 //if Lennon Wrote
  if(thisWord.songNumber == 9 || thisWord.songNumber == 1  || thisWord.songNumber == 2 || thisWord.songNumber == 5 || thisWord.songNumber == 7){
 int roundX = round(random(303,598));
  int roundY = round(random(0, 290));
 fill(myPixels[roundX][roundY]);
 text(thisWord.theWord, roundX, roundY );
 }
 //if George wrote
  if(thisWord.songNumber == 6 || thisWord.songNumber == 11){
 int roundX = round(random(0,290));
  int roundY = round(random(0, 290));
 fill(myPixels[roundX][roundY]);
 text(thisWord.theWord, roundX, roundY );
 }
 //if Ringo wrote
  if(thisWord.songNumber == 13){
 int roundX = round(random(305,598));
  int roundY = round(random(306, 598));
 fill(myPixels[roundX][roundY]);
 text(thisWord.theWord, roundX, roundY );
 }
 
  


 
    
  }
}
}
  



class Word{
 String theWord;  
 int[] songCount = new int[30];
 int wordCount;
 int xpos;
 int ypos;
 int fontSize;
 color col;
 int r;
 int g;
 int b;
 PFont helvet;
int songNumber;
 
 Word(String newWord, int songNum){
   theWord = newWord;
   songNumber = songNum;
   songCount[songNum]+=1;
   wordCount = songCount[songNum];
   r = 0;
   g = 0;
   b = 255;
   col = color(r, g, b);
   xpos = round(random(0, 1000));
   ypos = round(random(25, 500));
   fontSize = 10;
   helvet = createFont("Helvet", fontSize);
 }

void changeAppearance(int songNum){
  songCount[songNum]+=1;
  wordCount = songCount[songNum];
  r = r + 10;
  b = b - 10;
  fontSize = fontSize + 3;
  helvet = createFont("Helvet", fontSize);
}

void printWord(){

  fill(r, g, b);
  stroke(255);
  textFont(helvet);
  text(theWord, xpos, ypos);
}
 
 
 
  
}

//class colorData{
//  color col;
//  int xpos
//  int ypos
//  
//  colorData(color kuler, int xposa, int yposa){
//    col = color(255);
//    xpos = xposa;
//    ypos = yposa;
//  }
//}



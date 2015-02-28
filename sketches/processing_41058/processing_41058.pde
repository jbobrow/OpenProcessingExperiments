
ArrayList allWords = new ArrayList();
PFont trackList;




void setup(){
  background(191, 204, 255);
  size(1200, 550);
  noStroke();
  fill(255);
  rect(0, 500, 1200, 50);
  fill(0);
  trackList = createFont("Helvet", 10);
  textFont(trackList);
  text("1. Back in the U.S.S.R      2. Dear Prudence      3. Glass Onion      4. Ob-La-Di, Ob-La-Da      5. Wild Honey Pie      6. The Continuing Story of Bungalow Bill      7. While My Guitar Gently Weeps", 10, 525);  
  text("8. Happiness is a Warm Gun      9. Martha My Dear      10. I'm So Tired      11. Blackbird      12. Piggies      13. Rocky Raccoon      14. Don't Pass Me By", 10, 540);
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
     boolean matched = false;
     //println(wordSplit[j]);
    //check for matching

     for(int k=0; k<allWords.size();k++){
       Word thisWord = (Word) allWords.get(k);



     if(thisWord.theWord.equals(wordSplit[j])){
       matched = true;
       thisWord.changeAppearance(songNum);
       //println(wordSplit[j] + " matched with " + thisWord.theWord);
       
     }
     }
    if(matched == false){
    //println(wordSplit[j]);
    allWords.add(new Word(wordSplit[j], songNum));
    }
   
   }
  }
  }
  
  //checking that songs are stored correctly
 for(int n=0; n<allWords.size();n++){
  Word thisWord = (Word) allWords.get(n);
  if(thisWord.theWord.equals("a") || thisWord.theWord.equals("the") || thisWord.theWord.equals("to") || thisWord.theWord.equals("is") || thisWord.theWord.equals("in")){
    
  }
  else{
  //println(thisWord.theWord + thisWord.wordCount);
  thisWord.printWord();
  }
 }
  
}
  



void draw(){
 for(int i=0; i<allWords.size();i++){
   Word thisWord = (Word) allWords.get(i);
   for(int j=thisWord.xpos; j<thisWord.xpos+6; j++){
    for(int k=thisWord.ypos-5; k<thisWord.ypos+1; k++){
      if(mouseX == j && mouseY == k){
        thisWord.whichSong();
        println(thisWord.theWord);
        fill(255);
        rect(1000, 450, 200, 50);
        fill(0);
        PFont daFont;
        daFont = createFont("Helvet", 15);
        textFont(daFont);
        text("'"+thisWord.theWord+"'" + " TRACK " + thisWord.theSong, 1010, 480);
      }
    } 
   }
 }
}

class Word{
 String theWord;  
 int[] songCount = new int[15];
 int wordCount;
 int xpos;
 int ypos;
 int fontSize;
 color col;
 int r;
 int g;
 int b;
 PFont helvet;
 int theSong;
 
 Word(String newWord, int songNum){
   theWord = newWord;
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
  fill(255);
  rect(xpos, ypos-5, 5, 5);
  fill(r, g, b);
  stroke(255);
  textFont(helvet);
  text(theWord, xpos, ypos);
}

void whichSong(){

  int songNum=0;

  for(int i = 0; i<14 ;i++){
    if(songCount[songNum]<=songCount[i]){

      songNum = i;
    }
  }
  
  theSong = songNum + 1;
//  if(songNum == 0){
//    println("Back in the U.S.S.R");
//    theSong = songNum + 1;
//  }
//  
//   if(songNum == 1){
//    println("Dear Prudence");
//    theSong = songNum + 1;
//  }
  
}
 
  
}



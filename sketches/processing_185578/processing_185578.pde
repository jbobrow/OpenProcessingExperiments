
StringList solutions;
IntList wordScores;
ArrayList<StringList> shiftedWords;
int rowCount;
String alphabet;
int nLetters = 6;
int desiredScore = 3;

void setup(){
  StringList wordSet = new StringList();
  StringList newWords = getWords(nLetters);
  int wordCount = newWords.size();
  wordSet.append(newWords);
  shiftedWords = new ArrayList<StringList>();
  for(int i=0;i<nLetters;i++){
    shiftedWords.add(shiftWords(wordSet,i));
  }
  wordScores = scoreWords(wordSet,shiftedWords);
  solutions = getWordsWithScoresAbove(wordSet,wordScores,desiredScore);
  size(500,500);
  text(str(wordCount),300,200);
  rowCount = solutions.size();
  String[] saveFile = solutions.array();
  saveStrings("solutions.txt",saveFile);
}

void draw(){
  text(str(rowCount),300,100);
  showList(solutions);
}

StringList getWordsWithScores(StringList words, IntList scores, int scoreWant){
  StringList winners = new StringList();
  for(int i=0;i<scores.size();i++){
    if(scores.get(i)==scoreWant){
      winners.append(words.get(i));
    }
  }
  return winners;
}

StringList getWordsWithScoresAbove(StringList words, IntList scores, int scoreWant){
  StringList winners = new StringList();
  for(int i=0;i<scores.size();i++){
    if(scores.get(i)>=scoreWant){
      winners.append(words.get(i));
    }
  }
  return winners;
}

IntList scoreWords(StringList words, ArrayList<StringList> shiftedWords){
  IntList scores = new IntList();
  for(int i=0;i<words.size();i++){
    int score = 0;
    for(int j=0;j<shiftedWords.size();j++){
      StringList currShift = shiftedWords.get(j);
      if(words.hasValue(currShift.get(i))){
        score = score+1;
      }
    }
    scores.set(i,score);
  }
  return scores;
}

void showList(StringList theList){
  for(int i=0;i<theList.size();i++){
    text(theList.get(i),100,10+10*i);
  }
}

StringList shiftWords(StringList words, int nShift){
  StringList shiftedWords = new StringList();
  for(int i=0;i<words.size();i++){
    String word = words.get(i);
    int len = word.length();
    int index = nShift%len;
    String end = word.substring(0,index);
    String start = word.substring(index,len);
    String newWord = start+end;
    shiftedWords.append(newWord);
  }
  return shiftedWords;
}

StringList getWords(int nLetters){
  String fileName = "english_words.csv";
  Table words;
  StringList wordsToReturn = new StringList();
  words = loadTable(fileName);
  rowCount = words.getRowCount();
  for(int i=0;i<rowCount;i++){
    TableRow word = words.getRow(i);
    String theWord = "";
    for(int j=0;j<words.getColumnCount();j++){
      if(word.getString(j)!=""){
        theWord = theWord+word.getString(j);
      }
      if(theWord.length() == nLetters){
        wordsToReturn.append(theWord);
      }
    }
  }
  return wordsToReturn;
}



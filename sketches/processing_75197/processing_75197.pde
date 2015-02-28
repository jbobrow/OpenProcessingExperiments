
class Words {
  String letters;
  float gap;
  float wordLength;
  
  Words(String _thisWord, float _timeToTypeThisWord) {
    letters = _thisWord;
    float averageLetterWidth = textWidth(letters) / letters.length();
    float timeToTypeEachLetter = _timeToTypeThisWord / letters.length();
    // gap (counted in milliseconds)
      if(timeToTypeEachLetter < 133) 
        gap = - (averageLetterWidth / 5);
      else if(timeToTypeEachLetter < 250)
        gap = 0;
      else 
        gap = + (averageLetterWidth * 2);
    // compute wordLength = ∑characterLength + ∑gap
      wordLength = gap; //min(wordLength) = gap, in-case of zero letters
      for(int i=0; i<letters.length(); i++) {
        wordLength += ( textWidth(letters.charAt(i)) + gap ) ;
      }
  }
  
  void display() {
    //change colour of text depending on speed of typing
      if(gap<0) fill(0,0,255);
      if(gap==0) fill(0);
      if(gap>0) fill(255,0,0);

    float posn = 0; 
    posn = gap; // space( = gap) has to be left before the word's letters    
    for(int i=0; i<letters.length(); i++) {
      text(letters.charAt(i), posn, 0);
      posn += ( textWidth(letters.charAt(i)) + gap ) ;
      print(letters.charAt(i));
    }
  }
  
}


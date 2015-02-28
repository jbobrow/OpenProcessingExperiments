
/*
This sketch gets all of the unique keywords from a text file.
It saves each unique keyword as a Word object, containing the name of the word and the number of matches in the text.
The Word objects are stored in an array, sorted from the most popular to the least popular keywords.
The keywords are output to the console.
*/

// delimiters are used to split our array of text into individual elements
String delimiters = " ,.?!;:\n()*“”'‘’/–—";

// create array to store keywords
Word[] keywords;


void setup() {
  
  size(1024, 768);
  smooth();
  frameRate(60);
  
  // load text source into an array of strings, from external URL
  String[] rawtext = loadStrings("TheWhaleHunt.txt");
  
  // join the text into a single string
  String everything = join(rawtext, " ");
  
  // split the single string into words using the delimeters set above
  String[] finalText = splitTokens(everything, delimiters);

  // get keywords for String array passed in as a parameter
  getKeywords(finalText);

}


void getKeywords(String[] finalText) {
  
  // load black list (one word per line)
  String[] blackList = loadStrings("blacklist.txt");

  // build an array of unique words to store only single instances of words (not duplicates)
  ArrayList uniqueWords = new ArrayList();
  
  // loop through all words per track
  for (int i = 0; i < finalText.length; i++) {
   
    // start by converting the current word to lower case (to normalize all keywords)
    String currentWord = finalText[i].toLowerCase();
    
    // trim any white space off of the current word
    currentWord = trim(currentWord);
    
    // create Word object to store current word and frequency
    // Word(String name_, int count_) {
    Word word = new Word(currentWord, 1);
    
    // check for duplicates
    boolean isDuplicate = false;

    for (int n = 0; n < uniqueWords.size(); n++) {
      
      // extract String from allWords ArrayList
      Word matchingWord = (Word) uniqueWords.get(n);
      
      if (word.name.equals(matchingWord.name)) {
        isDuplicate = true;
        
        // if duplicate, increment the count of the duplicate word
        matchingWord.count++;
        break; // break the loop so only one instance can be counted
      }
    }
    
    // run a few general tests on the word, and check it against blacklist
    boolean isBlacklisted = false;
    
    for (int n = 0; n < blackList.length; n++) {
      
      /*
      Check if string is numeric using regex: ((-|\\+)?[0-9]+(\\.[0-9]+)?)+ 
      if ("-2324.00".matches("((-|\\+)?[0-9]+(\\.[0-9]+)?)+")) {  
            System.out.println("Is a number");  
        } else {  
            System.out.println("Is not a number");  
        }  
      */
      if (word.name.matches("((-|\\+)?[0-9]+(\\.[0-9]+)?)+")) {
        isBlacklisted = true; 
      }
      
      if ((word.name == null) || (word.name.equals("")) || (word.name.equals(" ")) || (word.name.length() == 1)) {
        isBlacklisted = true;
      }
      
      if (word.name.equals(blackList[n])) {
        isBlacklisted = true;
      }
    }
      
    // if neither a duplicate nor on the blacklist, add Word object to uniqueWords ArrayList
    if ((!isDuplicate) && (!isBlacklisted)) {        
      uniqueWords.add(word);
    }
  }
 
  
  // next, translate uniqueWords ArrayList to keywords array
  keywords = new Word[uniqueWords.size()];
  for (int i = 0; i < uniqueWords.size(); i++) {
    
    // extract Word object from ArrayList
    Word wordObject = (Word) uniqueWords.get(i);
      
    // add Word object to keywords array
    keywords[i] = wordObject; 
  }

  // lastly, sort ArrayList by count
  Arrays.sort(keywords, new SortObjects("count"));
  
  // print keywords to console
  for (int i = 0; i < keywords.length; i++) {
    println("Rank: " + (i+1) + ", Matches: " + keywords[i].count + ", Word: " + keywords[i].name);                
  }
}


void draw() {
}



SenStruct reconstruct;

String [] nouns;
String [] nouns2;
String [] nouns3;
String [] past_verbs;
String [] past_verbs2;
String [] present_verbs;
String [] adverbs;
String [] adverbs2;
String [] adjectives;
String [] adjectives2;
String [] spoke;

String [] posessive_pronouns;
String [] pronouns;
String [] pronouns2;
String outputMain;

String[] words = new String[13];
String[] punct = new String [4]; //punctuation
String struct;
String listNum;

//For Naming
int d = day();
int m = month();
int y = year();
//For Formatting   
int yLoc = 60;
int indent = 5;
int numOfPoem = 1;
int whichOne;

void setup() {
  size(650, 800);  
  textSize(12);
  fill(175, 0, 0);
  background(150);
  frameRate(2);   //speed

  //to initialize dictionaries
  adjectives = loadStrings("Adjectives.txt");
  adjectives2 = loadStrings("Adjectives.txt");
  nouns = loadStrings("Nouns.txt");
  nouns2 = loadStrings("Nouns.txt");
  nouns3 = loadStrings("Nouns.txt");
  past_verbs = loadStrings("Past_Verbs.txt");
  past_verbs2 = loadStrings("Past_Verbs.txt");
  present_verbs = loadStrings("Present_Verbs.txt");
  posessive_pronouns = loadStrings("Posessive_Pronouns.txt");
  pronouns = loadStrings("Pronouns.txt");
  pronouns2 = loadStrings("Posessive_Pronouns.txt");
  spoke = loadStrings("Talking.txt");

  adverbs = loadStrings("Adverbs.txt");
  adverbs2 = loadStrings("Adverbs.txt");

  //for punctuation
  punct [0] =  " ";
  punct [1] = ".";
  punct [2] = ",";
  punct [3] = "?";

  //Nameing
  text("Pseudorandom Poem " + numOfPoem, indent, 15); 
  text( m + "-" + d + "-" + y, indent, 30);
  listNum = pronouns2[(int)random(pronouns2.length-1)];
  text ( listNum + " life flashed before " + listNum + " eyes. The gun was loaded in front of the firing line." , indent, 60);
  //reconstructing sentences class
  //picks a random word from the dictionary as a control
  reconstruct = new SenStruct( 1, 2, 3 );
}

//Main Loop
void draw() {
  sentence();
}

//Intermediary function inbetween words picker and sentence type picker.
void sentence() {
//  if (frameCount % 2 == 0) {
    outputMain = (String) reconstruct.detectWord( (int) random(nouns.length), (int) random(nouns.length), (int) random(nouns.length), 
   (int) random(nouns.length), (int) random(nouns.length), (int) random(nouns.length), (int) random(nouns.length) );
    //brings to a new line  
    yLoc+=15;     
    //Writes text to screen
    text ( outputMain, indent, yLoc);

    //Repeats list generation
      if(yLoc > height-indent) {
      String Title = "Pseudorandom Poem " + numOfPoem + ".txt";
      numOfPoem++;
      //      save( Title ); //outputs a file to the project folder as a .tif
      //      saveStrings (Title, ); // --> turn into string array, and you can save that string array
      // Resets the Poem
      yLoc = 60;
      background(150 - numOfPoem*5);
        fill(175 + numOfPoem*5, 0, 0);
      text( "Pseudorandom Poem " + numOfPoem, indent, 15); 
      text( m + "-" + d + "-" + y, indent, 30);
      listNum = pronouns2[(int)random(pronouns2.length-1)];
      text ( listNum + " life flashed before " + listNum + " eyes. The gun reloaded as the soldier moved down the firing line." , indent, 60);
      }
//    }
  }
  
  
  class SenStruct { //declare class
//variables of class SenStruct
  int wordOfTheDay;
  int wordOfTheDay2;
  int wordOfTheDay3;
  //constructor
  SenStruct( int retnClass, int retnClass2, int retnClass3 ) {
    wordOfTheDay = retnClass;
    wordOfTheDay2 = retnClass2;
    wordOfTheDay3 = retnClass3;
  }
//detectWordFunction**START**
  String detectWord(int compareWord1, int compareWord2, int compareWord3, int compareWord4, int compareWord5, int compareWord6,
 int compareWord7 ) {
    String output;
//Words
    //pronouns
    String pos = words[0] = posessive_pronouns[(int) random(posessive_pronouns.length)];
    String pro = words[6] = pronouns[(int) random(pronouns.length)];
    String pr2 = words[9] = pronouns2[(int) random(pronouns2.length)];
    //adjectives
    String adj = words[1] = adjectives[(int) random(adjectives.length)];
    String adj2 = words[10] = adjectives2[(int) random(adjectives2.length)];

    //nouns
    String nou = words[2] = nouns[(int) random(nouns.length)];
    String no2 = words[5] = nouns2[(int) random(nouns2.length)];
    String no3 = words[8] = nouns3[(int) random(nouns3.length)];
    //verbs
    String presV = words[7] = present_verbs[(int) random(present_verbs.length)];
    String pastV = words[3] = past_verbs[(int) random(past_verbs.length)];
    String pastV2 = words[11] = past_verbs2[(int) random(past_verbs2.length)];
    String adv = words[4] = adverbs[(int) random(adverbs.length)];
    String adv2 = words[12] = adverbs2[(int) random(adverbs2.length)];

    //punctuation
    String sp = punct[0];
    String p = punct[1];
    String exclaim = pro + sp + spoke[(int)random(spoke.length-1)] + ", '";
//Word Strings
    //type1 Example: "Her catatonic reality teathered your tome."
    String type1 = pos + sp + adj + sp + nou + sp + pastV + sp + pr2 + sp + no2 + p;
    //type2 Example: "we decrypted the illusion, rejouicing the theological insanity of your virus."
    String type2 = pro + sp + pastV + sp + "the" + sp + nou + ", " + presV + " the " + adj + sp + no2 + " of " + 
    pos + sp + no3 + p;
    //type3 Example: "they retracted the mimesis of his virus like a sience."
    String type3 = pro + sp + pastV + " the " + nou + " of " + pos + sp + no2 + " like a " + no3 + p; 
    //type4 Example: "when her audacity remembered its insanity I remembered your tendril a little longer."
    String type4 = "when " + pos + sp + nou + sp + pastV + sp + pr2 + sp + no3 + "," + sp + pro + sp + 
    pastV + sp + pos + sp + no2 + " a little longer.";
    //type5 Example: "It's better to have burnt out than to have faded away."
    String type5 = "its" + sp + adj + " to have" + sp + pastV + sp + adv + " then to have " + pastV2 + sp + adv2 + p;
    //type5 Example: "
    String type6 = "screams were heard.";
    String type7 = "the gun kept firing.";


    if ( wordOfTheDay == compareWord1 ) {
      output = exclaim + type3 + "'";
      whichOne = 3;
    }
    else if ( wordOfTheDay == compareWord2) {
      output = exclaim + type2 + "'";
       whichOne = 2;
    }
    else if ( wordOfTheDay == compareWord3 ) {
      output = exclaim + type1 + "'";
             whichOne = 1;
    }
    else if ( wordOfTheDay2 == compareWord4 ) { 
      output = exclaim + type4 + "'";
             whichOne = 4;
    }
    else if ( wordOfTheDay2 == compareWord5 ) { 
      output = exclaim + type5 + "'";
             whichOne = 5;
    }
    else if ( wordOfTheDay2 == compareWord6 ) { 
      output = type6;
             whichOne = 6;
    }
    else if (wordOfTheDay3 == compareWord7 ) {
      output = type7;
             whichOne = 7;
    }
    else { 
      output = "RATATATATATATA";
            whichOne = 0;
    }
    return output;
  }
  //**END** detectWordFunction
}



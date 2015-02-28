
// Random sentence generator for bus-tops contest 
// Steve Tiffany, 2012 

PGraphics nextpic, textpic;
PFont font;
String[] words, tempArray;
String[][] verbs; 
int[][] sentences;
int[] adjBad,adjectives,adjGood,advDegree,advFrequency,advManner;
int[] animals,aNumber,aNumberOf,anyPerson;
int[] bodyParts,concept,events,men,modals,numbers,objects,places;
int[] plants,substances,women,everyone,acrossThrough,foods;
int[] because,anyAdj,bodyPart,youWeTheyI,myOur,uncle,mustShould;
int[] anyone,gang,container,lakeMud,canWill,habit,intensity,before;
int[] weekly;
int[] animalsVerb,verbThrough,verbAnObject,verbAtSomething,verbToBe;
int[] verbAdj,verbAbout,verbConcept,verbAtMe,wasteVerb,verbObjectsToAnEvent;
int[] verbWithMeAbout,verbMeAHat,verbAPerson,verbYourBoxOf,verbInAHole;
int[] verbObjectOnMy,verbMyKicks,verbToVerb,verbThinkSay;
int[] sentID;
String phrase;
int waitress, fader, prevsent,w,word,wordNum,conjugation,sentCounter;
boolean newLoop = true;
 
public void setup() {
  size(512, 160);  
  frameRate(8);    
  waitress = millis() + 10;
  nextpic = createGraphics(width, height, JAVA2D);
  nextpic.loadPixels();
  textpic = createGraphics(width, height*3, JAVA2D);
  textpic.loadPixels();
  font = loadFont("ArialNarrow-BoldItalic-48.vlw");
  textFont(font);
  words = loadStrings("words.txt"); // all non-verb words as Strings
  
  tempArray = loadStrings("verbs.txt"); // all verbs, conjugated, as Strings
  verbs = new String[tempArray.length][5]; 
  for(int i=0; i<tempArray.length; i++) {
    String[] pieces = split(tempArray[i],',');
    if (pieces.length == 5) {
      for (int j=0; j<5; j++) {
        verbs[i][j] = pieces[j];
      }
    }
  }
  tempArray = loadStrings("sentences.txt"); // every sentence template as integers
  sentences = new int[tempArray.length][16];
  for(int i=0; i<tempArray.length; i++) {
    String[] pieces = split(tempArray[i],',');
    if (pieces.length == 16) {
      for (int j=0; j<16; j++) {
        sentences[i][j] = int(pieces[j]);
      }
    }
  }
  tempArray = loadStrings("verbThrough.txt");
  verbThrough = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbThrough[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("animalsVerb.txt");
  animalsVerb = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    animalsVerb[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbAnObject.txt");
  verbAnObject = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbAnObject[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbAtSomething.txt");
  verbAtSomething = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbAtSomething[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbToBe.txt");
  verbToBe = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbToBe[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbAdj.txt");
  verbAdj = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbAdj[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbAbout.txt");
  verbAbout = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbAbout[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbConcept.txt");
  verbConcept = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbConcept[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbAtMe.txt");
  verbAtMe = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbAtMe[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("wasteVerb.txt");
  wasteVerb = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    wasteVerb[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbObjectsToAnEvent.txt");
  verbObjectsToAnEvent = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbObjectsToAnEvent[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbWithMeAbout.txt");
  verbWithMeAbout = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbWithMeAbout[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbMeAHat.txt");
  verbMeAHat = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbMeAHat[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbAPerson.txt");
  verbAPerson = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbAPerson[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbYourBoxOf.txt");
  verbYourBoxOf = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbYourBoxOf[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbInAHole.txt");
  verbInAHole = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbInAHole[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbObjectOnMy.txt");
  verbObjectOnMy = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbObjectOnMy[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbMyKicks.txt");
  verbMyKicks = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbMyKicks[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbToVerb.txt");
  verbToVerb = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbToVerb[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("verbThinkSay.txt");
  verbThinkSay = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    verbThinkSay[i] = int(tempArray[i]);
  }
  
  tempArray = loadStrings("adjBad.txt");
  adjBad = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    adjBad[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("adjectives.txt");
  adjectives = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    adjectives[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("adjGood.txt");
  adjGood = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    adjGood[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("advDegree.txt");
  advDegree = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    advDegree[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("advFrequency.txt");
  advFrequency = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    advFrequency[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("advManner.txt");
  advManner = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    advManner[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("animals.txt");
  animals = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    animals[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("aNumber.txt");
  aNumber = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    aNumber[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("aNumberOf.txt");
  aNumberOf = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    aNumberOf[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("anyPerson.txt");
  anyPerson = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    anyPerson[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("bodyParts.txt");
  bodyParts = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    bodyParts[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("concept.txt");
  concept = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    concept[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("events.txt");
  events = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    events[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("men.txt");
  men = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    men[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("modals.txt");
  modals = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    modals[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("numbers.txt");
  numbers = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    numbers[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("objects.txt");
  objects = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    objects[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("places.txt");
  places = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    places[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("plants.txt");
  plants = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    plants[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("substances.txt");
  substances = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    substances[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("women.txt");
  women = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    women[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("everyone.txt");
  everyone = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    everyone[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("acrossThrough.txt");
  acrossThrough = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    acrossThrough[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("foods.txt");
  foods = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    foods[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("because.txt");
  because = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    because[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("anyAdj.txt");
  anyAdj = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    anyAdj[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("bodyPart.txt");
  bodyPart = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    bodyPart[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("youWeTheyI.txt");
  youWeTheyI = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    youWeTheyI[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("myOur.txt");
  myOur = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    myOur[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("uncle.txt");
  uncle = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    uncle[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("mustShould.txt");
  mustShould = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    mustShould[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("anyone.txt");
  anyone = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    anyone[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("gang.txt");
  gang = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    gang[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("container.txt");
  container = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    container[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("lakeMud.txt");
  lakeMud = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    lakeMud[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("canWill.txt");
  canWill = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    canWill[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("habit.txt");
  habit = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    habit[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("intensity.txt");
  intensity = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    intensity[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("before.txt");
  before = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    before[i] = int(tempArray[i]);
  }
  tempArray = loadStrings("weekly.txt");
  weekly = new int[tempArray.length];
  for(int i=0; i<tempArray.length; i++) {
    weekly[i] = int(tempArray[i]);
  }
 
  tempArray = new String[0]; //not used after this, free the memory
  sentID = new int [46];
  for (int i=0; i<sentID.length; i++) {
    sentID[i] = i;
  }
}

void draw() {
//  These are set in pasteText()...
//  background(0); //keep background black (LEDs are brightness based)
//  stroke(255,0,0); //LEDs are on the scale of red
//  fill(255,0,0);   //LEDs are on the scale of red
  int currtime = millis();
  // Perform sentences in random order with no repeats till they've all been used, so use...
  if (newLoop) { // Knuth shuffle, a.k.a. Fisher-Yates shuffle
    // want to keep "Meanwhile" sentence always last, so length-2 not length-1...
    for (int i=sentID.length-2; i>0; i--) { // working up from (almost) the bottom of the list
      int j = int(random(0,i)); // j is a random number between 0 and number of remaining elements
      int hold = sentID[j]; // switch the random number j with the bottom unshuffled element
      sentID[j] = sentID[i];
      sentID[i] = hold;
    }
    sentCounter = 0;
    newLoop = false;
  }
  if (currtime > waitress) {
    makePhrase();
    pasteText();
    fader = 55; 
    // allow more time for reading longer sentences...
    waitress = int(millis() + (textWidth(phrase) * 2.2) + 2800);
  }
  if (fader < 255) { //quick crossfade into new sentence...
    tint(255,fader);
    fader += 100;
  } 
  image(nextpic,0,0,width,height);
}

void makePhrase() { 
  phrase = ""; conjugation = 0;
  String phr = "";
  word = 10000; w = 10000;
  boolean aflag = false;
  int sentNum = sentID[sentCounter];
  sentCounter++; if (sentCounter >= sentID.length) {newLoop = true;}
  for (int i=0; i<16 && (word<3353 || word>3355); i++) { //stop after ? ! or .
    word = sentences[sentNum][i]; // 'word' is an integer representing a word
    if (word<0) { // negative number = pluralize... so don't need to check for a/an
      if (word<-3355) { // it's a category
        word = abs(word);
        pickWordFromCategory(); // now wordNum = number of word picked
        word = wordNum; // it's now basically converted to a regular word integer
      } // fall through to...
      if (i==0) { // negative number = pluralize and add a regular word
        phrase = pluralize(words[abs(word)]); // no space before first word
      } else { 
        phr = pluralize(words[abs(word)]);
        phrase = phrase + " " + phr;
      }
    } else if (word==0) {
      if (i==0) {
        phrase = "a";
      } else {
        phrase = phrase + " a";
      }      
      aflag = true; // add 'n' if needed before next word
    } else if (word<3000) { // add a regular word
      if (i==0) { // no space before first word
        phrase = words[word];
      } else { // add a space
        if (aflag) {
          phr = words[word];
          phrase = phrase + anAdder(phr);
          aflag = false;
        } else {
          phrase = phrase + " " + words[word];
        }
      }
    } else if (word<3352) { // it's an actual verb
      if (i==0) {
        phrase = verbs[word-3000][conjugation];
      } else { // add a space
        if (aflag) {
          phr = verbs[word-3000][conjugation];
          phrase = phrase + anAdder(phr);
          aflag = false;
        } else {
          phrase = phrase + " " + verbs[word-3000][conjugation];
        }
      }
    
    } else if (word>3351 && word<3356) { // punctuation
      switch(word) {
        case 3352: phrase += ","; break;
        case 3353: phrase += "!"; break;
        case 3354: phrase += "?"; break;
        case 3355: phrase += "."; break;
      }
    } else if (word>3355 && word<3440) { // word category
      pickWordFromCategory(); // sets wordNum to number of actual word
      phr = words[wordNum]; 
      if (i==0) { // no space before first word
        phrase = phr;
      } else { // add a space
        if (aflag) {
          phrase = phrase + anAdder(phr);
          aflag = false;
        } else {
          phrase = phrase + " " + phr;
        }
      }
    } else if (word>3439 && word<3445) { // conjugation 
      switch(word) {
        case 3440: conjugation = 0; break;
        case 3441: conjugation = 1; break;
        case 3442: conjugation = 2; break;
        case 3443: conjugation = 3; break;
        case 3444: conjugation = 4; break;
      }
    } else { // it's a verb category
      switch(word) {
        case 3445: w = int(random(verbAbout.length)); wordNum = verbAbout[w]; break;
        case 3446: w = int(random(verbAdj.length)); wordNum = verbAdj[w]; break;
        case 3447: w = int(random(verbAnObject.length)); wordNum = verbAnObject[w]; break;
        case 3448: w = int(random(verbAtSomething.length)); wordNum = verbAtSomething[w]; break;
        case 3449: w = int(random(verbConcept.length)); wordNum = verbConcept[w]; break;
        case 3450: w = int(random(verbThrough.length)); wordNum = verbThrough[w]; break;
        case 3451: w = int(random(verbToBe.length)); wordNum = verbToBe[w]; break;
        case 3452: w = int(random(animalsVerb.length)); wordNum = animalsVerb[w]; break;
        case 3453: w = int(random(verbAtMe.length)); wordNum = verbAtMe[w]; break;
        case 3454: w = int(random(wasteVerb.length)); wordNum = wasteVerb[w]; break;
        case 3455: w = int(random(verbObjectsToAnEvent.length)); wordNum = verbObjectsToAnEvent[w]; break;
        case 3456: w = int(random(verbWithMeAbout.length)); wordNum = verbWithMeAbout[w]; break;
        case 3457: w = int(random(verbMeAHat.length)); wordNum = verbMeAHat[w]; break;
        case 3458: w = int(random(verbAPerson.length)); wordNum = verbAPerson[w]; break;
        case 3459: w = int(random(verbYourBoxOf.length)); wordNum = verbYourBoxOf[w]; break;
        case 3460: w = int(random(verbInAHole.length)); wordNum = verbInAHole[w]; break;
        case 3461: w = int(random(verbObjectOnMy.length)); wordNum = verbObjectOnMy[w]; break;
        case 3462: w = int(random(verbMyKicks.length)); wordNum = verbMyKicks[w]; break;
        case 3463: w = int(random(verbToVerb.length)); wordNum = verbToVerb[w]; break;
        case 3464: w = int(random(verbThinkSay.length)); wordNum = verbThinkSay[w]; break;

      }
      // now WordNum is the verb index
      if (i==0) {
        phrase = verbs[wordNum][conjugation];
      } else {
        if (aflag) {
          phrase = phrase + anAdder(verbs[wordNum][conjugation]);
          aflag = false;
        } else {
          phrase = phrase + " " + verbs[wordNum][conjugation];
        }
      }
    }
  }
  phrase = capitalize(phrase);
  prevsent = sentNum;
}

void pickWordFromCategory() {
  switch(word) {
    case 3356: w = int(random(adjBad.length)); wordNum = adjBad[w]; break;
    case 3357: w = int(random(adjectives.length)); wordNum = adjectives[w]; break;
    case 3358: w = int(random(adjGood.length)); wordNum = adjGood[w]; break;
    case 3359: w = int(random(advDegree.length)); wordNum = advDegree[w]; break;
    case 3360: w = int(random(advFrequency.length)); wordNum = advFrequency[w]; break;
    case 3361: w = int(random(advManner.length)); wordNum = advManner[w]; break;
    case 3362: w = int(random(animals.length)); wordNum = animals[w]; break;
    case 3363: w = int(random(aNumber.length)); wordNum = aNumber[w]; break;
    case 3364: w = int(random(aNumberOf.length)); wordNum = aNumberOf[w]; break;
    case 3365: w = int(random(anyPerson.length)); wordNum = anyPerson[w]; break;
    case 3366: w = int(random(bodyParts.length)); wordNum = bodyParts[w]; break;
    case 3367: w = int(random(concept.length)); wordNum = concept[w]; break;
    case 3368: w = int(random(events.length)); wordNum = events[w]; break;
    case 3369: w = int(random(men.length)); wordNum = men[w]; break;
    case 3370: w = int(random(modals.length)); wordNum = modals[w]; break;
    case 3371: w = int(random(numbers.length)); wordNum = numbers[w]; break;
    case 3372: w = int(random(objects.length)); wordNum = objects[w]; break;
    case 3373: w = int(random(places.length)); wordNum = places[w]; break;
    case 3374: w = int(random(plants.length)); wordNum = plants[w]; break;
    case 3375: w = int(random(substances.length)); wordNum = substances[w]; break;
    case 3376: w = int(random(women.length)); wordNum = women[w]; break;
    case 3377: w = int(random(everyone.length)); wordNum = everyone[w]; break;
    case 3378: w = int(random(acrossThrough.length)); wordNum = acrossThrough[w]; break;
    case 3379: w = int(random(foods.length)); wordNum = foods[w]; break;
    case 3380: w = int(random(because.length)); wordNum = because[w]; break;
    case 3381: w = int(random(anyAdj.length)); wordNum = anyAdj[w]; break;
    case 3382: w = int(random(bodyPart.length)); wordNum = bodyPart[w]; break;
    case 3383: w = int(random(youWeTheyI.length)); wordNum = youWeTheyI[w]; break;
    case 3384: w = int(random(myOur.length)); wordNum = myOur[w]; break;
    case 3385: w = int(random(uncle.length)); wordNum = uncle[w]; break;
    case 3386: w = int(random(mustShould.length)); wordNum = mustShould[w]; break;
    case 3387: w = int(random(anyone.length)); wordNum = anyone[w]; break;
    case 3388: w = int(random(gang.length)); wordNum = gang[w]; break;
    case 3389: w = int(random(container.length)); wordNum = container[w]; break;
    case 3390: w = int(random(lakeMud.length)); wordNum = lakeMud[w]; break;
    case 3391: w = int(random(canWill.length)); wordNum = canWill[w]; break;
    case 3392: w = int(random(habit.length)); wordNum = habit[w]; break;
    case 3393: w = int(random(intensity.length)); wordNum = intensity[w]; break;
    case 3394: w = int(random(before.length)); wordNum = before[w]; break;
    case 3395: w = int(random(weekly.length)); wordNum = weekly[w]; break;
    
  }
}

String pluralize(String Word) {
  String word = Word.toLowerCase();
  int len = word.length();
  String rs = word.substring(len-2,len); //right two letters
  if ((rs.equals("ss"))||(rs.equals("zz"))||(rs.equals("sh"))||(rs.equals("ss"))) {
    if (word.equals("fish")) {return Word;}
    word = Word + "es"; return word;
  }
  if (rs.equals("ch")) {
    if ((word.equals("matriarch"))||(word.equals("monarch"))||(word.equals("epoch"))||
        (word.equals("patriarch"))||(word.equals("loch"))||(word.equals("stomach"))) {
      word = Word + "s"; return word;
    } 
    word = Word + "es"; return word;
  }
  if (rs.equals("fe")) {
    if ((word.equals("life"))||(word.equals("wife"))||(word.equals("knife"))) {
      word = Word.substring(0,len-3) + "ives"; return word;
    } 
    word = Word + "s"; return word;
  }
  if (rs.equals("on")) {
    if ((word.equals("criterion"))||(word.equals("phenomenon"))) {
      word = Word.substring(0,len-2) + "a"; return word;
    }
    if (word.equals("person")) {word = Word.substring(0,2) + "ople"; return word;}
    word = Word + "s"; return word;
  }
  if (rs.equals("us")) {
    if ((word.equals("stimulus"))||(word.equals("cactus"))
    ||(word.equals("octop65us"))) {
      word = Word.substring(0,len-2) + "i"; return word;
    } 
    word = Word + "es"; return word;
  }
  if ((rs.equals("ay"))||(rs.equals("ey"))||(rs.equals("iy"))||(rs.equals("oy"))||(rs.equals("uy"))) {
    if (word.equals("soliloquy")) {word = Word.substring(0,len-1) + "ies"; return word;}
    word = Word + "s"; return word;
  }

  rs = word.substring(len-1); // right (last) single letter 
  if (rs.equals("y")) {
    word = Word.substring(0,len-1) + "ies"; return word;
  }
  if (rs.equals("x")) {
    if (word.equals("ox")) {word = Word + "en"; return word;}
    word = Word + "es"; return word;
  }
  if (rs.equals("o")) {
    if ((word.equals("echo"))||(word.equals("hero"))||(word.equals("potato"))
      ||(word.equals("tomato"))||(word.equals("torpedo"))||(word.equals("torpedo"))
      ||(word.equals("veto"))||(word.equals("dingo"))||(word.equals("negro"))) {
        word = Word + "es"; return word;
    } 
    word = Word + "s"; return word;
  }
  if (len > 2) {
    rs = word.substring(len-3,len);
    if (rs.equals("man")) {
      if (word.equals("ottoman")) {return "ottomans";}
      word = Word.substring(0,len-3) + "men"; return word;
    }
    if (rs.equals("alf")) {word = Word.substring(0,len-3) + "alves"; return word;}
    if (rs.equals("elf")) {word = Word.substring(0,len-3) + "elves"; return word;}
    if (rs.equals("eaf")) {word = Word.substring(0,len-3) + "eaves"; return word;}
    if (rs.equals("olf")) {word = Word.substring(0,len-3) + "olves"; return word;}
  }
  if (word.equals("scissors")) {return Word;}
  if (word.equals("sheep")) {return Word;}
  if (word.equals("foot")) {return "feet";}
  if (word.equals("tooth")) {return "teeth";}
  if (word.equals("thief")) {return "thieves";}
  if (word.equals("child")) {return "children";}
  if (word.equals("mouse")) {return "mice";}
  word = Word + "s"; return word;
}

String anAdder(String Word) {
  String word = Word.toLowerCase();
  String sLef;
  int len = word.length();
  if (len < 2) {return "";} // just add the 'n' if necessary
  if (word.equals("one")) {return Word;}
  char lefChar = word.charAt(0);
  if ((lefChar == 'a') || (lefChar == 'i') || (lefChar == 'o')){
    word = "n " + Word; return word;
  }
  if (lefChar == 'h') {
    if (len > 3) {
      sLef = word.substring(0, 4);
      if (sLef.equals("heir")) {word = "n " + Word; return word;}
      if (sLef.equals("herb")) {word = "n " + Word; return word;}
      if (sLef.equals("homa")) {word = "n " + Word; return word;}
      if (sLef.equals("hono")) {word = "n " + Word; return word;}
      if (sLef.equals("hour")) {word = "n " + Word; return word;}
      if (len > 5) {
        sLef = word.substring(0,6);
        if (sLef.equals("honest")) {word = "n " + Word; return word;}
      }  
    }
    if (len > 2) {
      sLef = Word.substring(0, 3);
      if (sLef.equals("HMO")) {word = "n " + Word; return word;}
      if (sLef.equals("HIV")) {word = "n " + Word; return word;}
      if (sLef.equals("HPV")) {word = "n " + Word; return word;}
    }
    word = " " + Word; return word;
  }
  if (lefChar == 'e') {
    if (len > 2) {
      sLef = word.substring(0, 2);
      if (sLef.equals("eu")) {word = " " + Word; return word;}
    }
    word = "n " + Word; return word;
  }
  if (lefChar == 'u') {
    if (len > 2) {
      sLef = word.substring(0, 3);
      if (sLef.equals("uni")) {word = " " + Word; return word;}
      if (sLef.equals("ura")) {word = " " + Word; return word;}
      if (sLef.equals("ure")) {word = " " + Word; return word;}
      if (sLef.equals("uri")) {word = " " + Word; return word;}
      if (sLef.equals("uro")) {word = " " + Word; return word;}
      if (sLef.equals("usa")) {word = " " + Word; return word;}
      if (sLef.equals("use")) {word = " " + Word; return word;}
      if (sLef.equals("usu")) {word = " " + Word; return word;}
      if (sLef.equals("ute")) {word = " " + Word; return word;}
      if (sLef.equals("uti")) {word = " " + Word; return word;}
      if (sLef.equals("uto")) {word = " " + Word; return word;}
      if (sLef.equals("utr")) {word = " " + Word; return word;}
      if (sLef.equals("uve")) {word = " " + Word; return word;}
      if (sLef.equals("uvu")) {word = " " + Word; return word;}
      if (len > 4) {
        sLef = word.substring(0, 5);
        if (sLef.equals("unani")) {word = " " + Word; return word;}
      }
      if (len > 3) {
        sLef = word.substring(0, 4);
        if (sLef.equals("unar")) {word = " " + Word; return word;}
      }
      if (len > 1) {
        sLef = word.substring(0, 2);
        if (sLef.equals("ub")) {word = " " + Word; return word;}
        if (sLef.equals("uf")) {word = " " + Word; return word;}
        if (sLef.equals("uk")) {word = " " + Word; return word;}
      }
      word = "n " + Word; return word;
    }
  }
  word = " " + Word; return word;
}

String capitalize(String capPhrase) {
  char cap = capPhrase.charAt(0);
  while (int(cap)==32) { // remove leading spaces
    capPhrase = capPhrase.substring(1);
    cap = capPhrase.charAt(0);
  }
  String capstring = str(cap);
  String rest = capPhrase.substring(1);
  capPhrase = capstring.toUpperCase() + rest;
  return capPhrase;
}


void pasteText() {  // this elaborate approach accommodates sentences of 1-9 lines.
  int x=0; int y=0;
  int xover = 0; int ydown = 0; 
  textpic.beginDraw(); //print text to a hidden screen...
  textpic.background(0,0);
  textpic.fill(255,0,0);
  textpic.textFont(font);
  textpic.smooth();
  textpic.textLeading(50);
  textpic.text(phrase,3,0,509,477);
  textpic.endDraw();
  textpic.loadPixels();
  int lastPixel = (textpic.height*textpic.width) - 1;
  color backColor = textpic.pixels[lastPixel]; 
  // start checking from the bottom, stop when you hit text...
  for (x = lastPixel; textpic.pixels[x] == backColor; x--) {}
  int textHigh = int((x/textpic.width)+5);
  int textWide = textpic.width;
  // check right column top to bottom, then next column left top to bottom, etc.
  // break out of the loops when you hit text...
  for (x = textWide-1; x > 20; x--) {
    for (y = 0; y < textHigh; y++) {
      if (textpic.pixels[y*textWide+x] != backColor) {break;}
    }
    if (textpic.pixels[y*textWide+x] != backColor) {break;} 
  }
  textWide = x + 5;
  nextpic.beginDraw();
  nextpic.background(0);
  nextpic.smooth();
  nextpic.fill(0); 
  xover = int((nextpic.width-textWide)/2);
  ydown = int((nextpic.height-textHigh)/2);
  if (textHigh>height) { // must compress the >3-line sentence
    ydown = 2;
    nextpic.rect(0,0,width,height);
    background(0);
    nextpic.copy(textpic,0,0,textWide,textHigh,xover,ydown,textWide,158);
  } else {
    nextpic.rect(xover,ydown,textWide,textHigh);
    nextpic.image(textpic,xover,ydown);
  }
  nextpic.endDraw(); 
}



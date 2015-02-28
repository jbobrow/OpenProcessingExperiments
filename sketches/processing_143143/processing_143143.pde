
//---------GLOBAL VARIABLES---------
//1 Syllables
String[] oneSylAdj = {
  "shy", "hot", "loud", "soft", "dry", "smooth", "tall", "big", "sweet"
};
String[] oneSylverb = {
  "clap", "kick", "frown", "waste", "point", "score"
};
String[] oneSylNoun = {
  "cat", "dog", "seed", "tree", "arch", "grass", "socks", "vines", "tires", "tea", "sea", "frog"
};

//2 Syllables
String[] twoSylAdj = {
  "modern", "sassy", "tiny", "happy", "bitter", "floral", "morning", "lucky", "orange", "hairy", "wacky"
};
String[] twoSylVerb = {
  "petting", "making", "sipping", "flying", "running", "flipping", "dancing", "racing", "singing"
};
String[] twoSylNoun = {
  "laughter", "droplets", "building", "muscles", "peanut", "scribbles", "mountain", 
  "ribbons", "rabbit", "bubbles", "firefly"
};

//3 Syllables
String[] threeSylAdj = {
  "fantastic", "miniature", "beautiful", "abnormal", "contagious", "amazing", "magical", "transparent"
};
String[] threeSylVerb = {
  "elevate", "replacing", "creating", "maintaining", "supporting", "understands", "distracting"
};
String[] threeSylNoun = {
  "architect", "passenger", "creator", "lioness", "guitarist", "honeydew", "strawberry", "editor"
};

boolean scramble = true;

//String[] syllables = {oneSyllable[oneSyllable.length], twoSyllable[twoSyllable.length], threeSyllable[threeSyllable.length]
//};

PFont font;
String firstLine;
String secondLine;
String thirdLine;

//---------SETUP---------
void setup() {
  size(800, 600);
  smooth(8);
  font = loadFont("Aparajita-60.vlw");
  textFont(font, 60);
}

//---------DRAW---------
void draw() {
  if (scramble == true) {
    background(random(255), random(255), random(255));
    fill(255);
    firstLine = twoSylAdj[(int)random(twoSylAdj.length)] +
      " " + threeSylNoun[(int)random(threeSylNoun.length)];

    secondLine = twoSylVerb[(int)random(twoSylVerb.length)] + 
      " " + threeSylAdj[(int)random(threeSylAdj.length)] + 
      " " + twoSylNoun[(int)random(twoSylNoun.length)];

    thirdLine = threeSylVerb[(int)random(threeSylVerb.length)] +
      " " + oneSylAdj[(int)random(oneSylAdj.length)] +
      " " + oneSylNoun[(int)random(oneSylNoun.length)];

    text(firstLine + "\n" + secondLine + "\n" + thirdLine, 40, 230);

    println(firstLine + "\n" + secondLine + "\n" + thirdLine);
  }
  else if (scramble == false) {
    fill(255);
    text(firstLine + "\n" + secondLine + "\n" + thirdLine, 40, 230);

    println(firstLine + "\n" + secondLine + "\n" + thirdLine);
  }
}
//loop will initially start running, if a key is pressed it'll stop
//Press the key again to start loop

void keyPressed() {
  scramble = !scramble; 
}






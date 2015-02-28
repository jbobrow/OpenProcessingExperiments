
// 7 of each Nouns, verbs, adjectives.
// pronouns
String [] nouns;
String [] verbs;
String [] adjectives;
String [] pronouns;

void setup() {
  size(600, 600);
  textSize(12);
  fill(0);
  background(255);
  frameRate(1);
  nouns = new String[7];
  nouns[0] = "book ";
  nouns[1] = "teeth ";
  nouns[2] = "ocelot ";
  nouns[3] = "furnishing ";
  nouns[4] = "moonlight ";
  nouns[5] = "tendril ";
  nouns[6] = "boolean ";
  
  verbs = new String[7];
  verbs[0] = "punished.";
  verbs[1] = "teathered.";
  verbs[2] = "retracted.";
  verbs[3] = "examined.";
  verbs[4] = "brandished.";
  verbs[5] = "rejoiced.";
  verbs[6] = "flounced.";
  
  adjectives = new String[7];
  adjectives[0] = "didactic ";
  adjectives[1] = "pedantic ";
  adjectives[2] = "poetic ";
  adjectives[3] = "structural ";
  adjectives[4] = "mercantile ";
  adjectives[5] = "royal ";
  adjectives[6] = "unique ";
  
  pronouns = new String[5];
  pronouns[0] = "His ";
  pronouns[1] = "Her ";
  pronouns[2] = "Their ";
  pronouns[3] = "Our ";
  pronouns[4] = "The ";
}

void draw() {
    int randNum4 = (int) random(0, 7);
    int randNum3 = (int) random(0, 7);
    int randNum2 = (int) random(0, 7);
    int randNum1 = (int) random(0, 5);
    String part1 = pronouns[randNum1];
    String part2 = adjectives[randNum2];
    String part3 = nouns[randNum3]; //prints a word on the console.
    String part4 = verbs[randNum4];
println(part1 + part2 + part3 + part4);
}




//example random words ...
// bb


String [] poem = new String[15]; // input text
String [] words = new String[0]; // empty 0 len array for words

void setup(){
// here is the data
poem[0]="i love you much(most beautiful darling)";
poem[1]="i love you much(most beautiful darling)";
poem[2]="more than anyone on the earth and i";
poem[3]="like you better than everything in the sky";
poem[4]="-sunlight and singing welcome your coming";
poem[5]="although winter may be everywhere";
poem[6]="with such a silence and such a darkness";
poem[7]="noone can quite begin to guess";
poem[8]="(except my life)the true time of year-";
poem[9]="and if what calls itself a world should have";
poem[10]="the luck to hear such singing(or glimpse such";
poem[11]="sunlight as will leap higher than high";
poem[12]="through gayer than gayest someone's heart at your each";
poem[13]="nearness)everyone certainly would(my";
poem[14]="most beautiful darling)believe in nothing but love";

// iterate over data by line
for (int i=0;i<poem.length;i++) {
  // extract words by splitting at any punctuation or space
  // combine results as string arrays concatenating results with prior results
  words = (String[])concat(words, splitTokens(poem[i], " .,()-"));
}
// print words here 
println(words);
}

void draw(){
// do nothing
}

// every time the mouse is pressed
void mousePressed() {
  String newPoem=""; // empty string for new peom
  // choose some random length and loop that many times
  for (int i=0;i<int(random(5,10));i++) {
    // add new word to string with a space imbetween - pick at random from array
    newPoem += words[int(random(words.length))] + " ";
  }
  //print result
  println(newPoem);
}



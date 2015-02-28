
/**
 * Shuffles a list of strings into random or sorted order
 * and rapidly displays them. Implements Richard Durstenfeld's version 
 * of the Fisher-Yates algorithm, popularized by Donald Knuth.
 * see http://en.wikipedia.org/wiki/Fisher-Yates_shuffle
 * Press 'r' for random, 's' for sorted. 
 *
 */

String[] paroles = {"Unicode barf", "Broken executables", "Circuit-bending", "Databending",
        "Datamoshing", "Transcoding", "Spam", "Netochka Nezvanova", "Ideology",
        "Discontinuity", "Analog:digital", "Cognition", "Video feedback",
        "Flicker films", "Alvin Lucier", "Tony Conrad", "Steina Vasulka", "JODI", "John Cage",
        "Chance", "Chaos", "Noise", "Error", "Accident", "Catastrophe", "Bug",
        "Crash", "Virus", "Game mods", "8bit", "Demoscene", "DIY", "Cyberpunk",
        "Biopunk", "Genderbending", "Neuroglitch", "Chartjunk", "Functionality", "Flow",
        "Rupture", "Expectation", "Slippage", "Claude Shannon", "Rosa Menkman", "VJ/DJ",
        "Live set", "Subculture", "Gift Economy", "Arthur Rimbaud", "Ideology",
        "Technoromanticism", "Interface", "Metaphor", "Aesthetics", "Memory"};
int counter = 0;
 
void setup() {  //setup function called initially, only once
    size(720, 480);
    background(0);  //set background black
    shuffle(paroles);
    frameRate(6);
    textSize(60);
    textAlign(CENTER);
}
 
void draw() {  //draw function loops
    if (counter >= paroles.length) {
        // shuffle(paroles);
        counter = 0;
    }
    background(0);
    fill(255);
    text(paroles[counter++], width/2, height/2);
}
 
void shuffle(String[] stringArray) {
    for (int lastPlace = stringArray.length - 1; lastPlace > 0; lastPlace--) {
        // Choose a random location from 0..lastPlace
        int randLoc = (int) (random(lastPlace + 1));
        // Swap items in locations randLoc and lastPlace
        String temp = stringArray[randLoc];
        stringArray[randLoc] = stringArray[lastPlace];
        stringArray[lastPlace] = temp;
    }
}

void sort(String[] stringArray){
    stringArray.sort();
}

public void keyPressed() {
  if (key == 'r' || key == 'R') {
    shuffle(paroles);
    println("randomized");
  }
  else if (key == 's' || key == 'S') {
    sort(paroles);
    println("sorted");
  }
}

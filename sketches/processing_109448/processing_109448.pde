
String[] article = {
  "the", "my", "your", "our", "that", "this", "every", "one", "the only", "his", "her"
};
String[] adjective = {
  "adamant", "animistic", "boorish", "calamitous", "didactic", "endemic", "heuristic", "insidious", "American", "French", "Jewish", 
  "magnificent", "jealous", "ancient", "delicious", "bumpy", "exotic", "broken",
};
String[] noun = {
  "aftermath", "beginner", "believe", "boundary", "education", "language", "passenger", "volcano", "cemetery", "mountain", "laborer",
}; 
String[] preposition = {
  "under", "in front of", "above", "behind", "near", "following", "inside", "besides", 
  "unlike", "like", "beneath", "against", "into", "beyond", "considering", "without", 
  "with", "towards"
};
String[] verb = {
  "sings", "dances", "was dancing", "runs", "will run", "walks", 
  "is wondering", "is thinking", "is", "was", "will be", "might be", "was never"
};



// The message to be displayed
String sentence1 = "this hauristic creation walks into our calamatous ceration";
String sentence0 = "One boorish laborer is unlike your boorish mountain";
String sentence2 = "The only exotic laborer is thinking behind his calculations";
String sentence3 = "This french aftermath was into that bumpy mountain";
String sentence4 = "One boorish laborer is unlike your boorish mountain";
String sentence5 = "This heuristic language is thinking behind the broken language";
String sentence6 = "this delicious believe might be with his calamitous believe";
String sentence7 = "this endemic aftermath was into your didactic education";
String sentence8 = "the delicious beginner dances beneath that french beginner";
String sentence9 = "his delicious laborer was dancing beneath the broken education";
String sentence10 = "the ancient laborer sings above one boorish mountain";

import processing.pdf.*;






// The radius of a circle
float r = 50;
float y = 80; 
float z = 50; 
float n = 0; 

void setup() {
  size(1700, 1100);
  PFont font;
  font = loadFont("helvetica.vlw");
  textFont(font, 12);
  // The text must be centered!
  textAlign(CENTER);
  smooth();
  background(255);
  stroke(1);
  noLoop();
    beginRecord(PDF, "filename.pdf"); 

}

void draw() {
  circle();
    endRecord();

}


void circle() {
  //x=x+80; 
  for (int x = 80; x < width-30; x = x+120) {
    for (int y = 80; y < height-30; y = y+120) {
//      point(x, 80);

  r = random(45,55); 


      // Start in the center and draw the circle
      pushMatrix();

      translate(x, y);
      //  ellipse(0, 0, r*2, r*2);

      // We must keep track of our position along the curve
      float arclength = 0;

      // For every box
      for (int i = 0; i < sentence0.length(); i++)
      {
        // Instead of a constant width, we check the width of each character.
        char currentChar = sentence0.charAt(i);

        float w = textWidth(currentChar);

        // Each box is centered so we move half the width
        arclength += w/2;
        // Angle in radians is the arclength divided by the radius
        // Starting on the left side of the circle by adding PI
        float theta = PI + arclength / r;    

        pushMatrix();
        // Polar to cartesian coordinate conversion
        translate(r*cos(theta), r*sin(theta));
        // Rotate the box
        rotate(theta+PI/2); // rotation is offset by 90 degrees
        // Display the character
        fill(0);
          int n = int(random(article.length));  
        text("fghrja", 0, 0);
        popMatrix();
        // Move halfway again
        arclength += w/2;
      }    
      popMatrix();
    }
  }
}



void write_word(String[] words) {
  int n = int(random(words.length));  

  text(words[n], 100, z=z+10);
}

void sentence() {
  write_word(article);
  write_word(adjective);
  write_word(noun);

  write_word(verb);
  write_word(preposition);

  write_word(article);
  write_word(adjective);
  write_word(noun);
}





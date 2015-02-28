
// Just playing around with transformations...putting text in random
// locations on the screen.

void setup() {
  size(600, 600);
  background(255);
  smooth();
  
  // An array of words.  
  // words[0] refers to the first word in the array
  // words[2] refers to the next word, and so on
  String[] words = {"the", "quick", "brown", "fox", 
              "jumps", "over", "the", "lazy", "dog"};

  for (int i = 0; i < 500; i++) {
    
    // Cycle through the words
    String word = words[i % words.length];
    fill(100 + (int)random(156), 0, 0, 150);
    
    // Store the current transformation
    pushMatrix(); 
    
    rotate(random(-PI/6, PI/6));
    
    // by matching the scale value to the
    // index of the array, similar words will be clustered
    // together.
    scale(random(i % words.length));    

    // Put text in a random location.  Note that the location
    // is affected by the current scale and rotation values
    text(word,10 + 2*random(width/5), 10 + random(height/5)); 
    
    // Store the current transformation
    popMatrix(); // Return to that stored transformation
  }
}


class DNA {
  char[] genes = new char[8];
  String dna;
  float fitness;      // Raw fitness measure
  float fitnessN;     // Normalized fitness measure
  float mutationRate;
  float x; float y;

  // Constructor for a random gene sequence
  DNA(){
    // Generate a genotype 
    // in this case, a hexadecimal string interpretable as a color.
    // The first two characters determine the transparency
    genes[0] = 'F';
    genes[1] = 'F';
    int i = 2;
    while(i < 8){      
      int n = int(random(32, 90));  // The other characters are picked at random
      if(((n >= 48) && (n <= 57)) || ((n >= 65) && (n <= 70))){  // but must be valid hexadecimal characters
        genes[i] = (char) n;
        i++;
      } 
    }
    dna = new String(genes);
  }

  // Constructor for a child gene sequence
  DNA(char[] newdna, float m){
    mutationRate = m;

    // Mutate according to given probability
    for (int i = 2; i < newdna.length; i++) {  // Iteration through the genotype, ignores the transparency characters
      if (random(1) < m) {
        boolean b = false;  // This switch indicates a valid mutation
        while(b == false){      
          int n = int(random(48, 90));                               // Random character,
          if(((n >= 48) && (n <= 57)) || ((n >= 65) && (n <= 70))){  // which must be a valid hexadecimal character
            newdna[i] = (char) n;  // Mutated character in the gene sequence
            b = true;              // Switch is on when a valid character has been found
          } 
        }
      }
    }
    
    dna = new String(newdna);
  }

  void display(float x, float y){
    noStroke();
    color c = color(unhex(dna));
    fill(c);
    strokeWeight(1);
    stroke(240);
    ellipse(x, y, 6, 6);
  }
}




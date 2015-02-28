
class DNA {  
  int[] genes;    // The genetic sequence
  float fitness;  // fitness to reproduce
  
  // Constructor (makes a random DNA)
  DNA(int num) {
    genes = new int[num];
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (int) random(10,repAge+30);  // Pick random initial survival age
     }
  }

   // Fitness function (returns non-normalised value)
  void fit_ness (String target) {
     float score;
     if ( (genes[0] > repAge) && (genes[0] <= repAge+20) ) score = (genes[0]);
     else score = 0.7*genes[0]; 
     fitness = score;
  }
  
  // Crossover
  DNA crossover(DNA partner) {
    DNA child = new DNA(genes.length);          // A new child    
    int midpoint = int(random(genes.length));   // Pick a 'midpoint'
    
    // Half from one, half from the other
    for (int i = 0; i < genes.length; i++) {
      if (i > midpoint) child.genes[i] = genes[i];
      else              child.genes[i] = partner.genes[i];
    }
    return child;
  }
  
  // Based on a mutation probability 0 to 1, pick a new random 
  void mutate(float mutationRate) {
      if (random(1) < mutationRate) {
        if (genes[0] > repAge+20) {
          genes[0] = (int)random(genes[0]-1, genes[0]);    //decay sets in !
        }
        else
        {        
         // genes[0] = (int)random(repAge+20-1, repAge+20+1);
          genes[0] = (int)random(genes[0]-5, genes[0]+5);  //random variation
        }
     }
   }
 }


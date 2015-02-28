
/* (incant || permut) && ation

  Rendition of a permutation poem  
  by Brion Gysin
  
  Listen to Brion Gysin on ubu :
  http://www.ubu.com/sound/gysin.html
  
  ////  /  / //  // /  / / / //  //// /  //////
  // / // ////// 3 juin 2009 //// / ////  /////
  //// / ///  / // / /  / /   ~emoc // // / / /
  
  On permutation algorithms, see :
  http://www.bearcave.com/random_hacks/permute.html
  http://lucitworks.com/Snippets/Algorithms/permutation.htm
  
  Basis :
  For an ensemble E of N elements, there are N! permutation possibilities
  N! => factorial(N)
  If E contains similar elements, ex MISSISSIPI
  permutations = 10! / ( 4! * 4! ) // 4 * I, 4 * S
               = 10*9*8*7*6*5*4*3*2*1 / (4*3*2*1 * 4*3*2*1)
               = 3 628 800 / 576
               = 6300
  ///  // / / / /  / // /  / /// /  / // /  / */ 


int f = 0;
PFont font;
Phrase phrase1;

void setup() {
  size(800,200);
  // 6! permutations x 40 frames / 25 f/s = 19 minutes!
  phrase1 = new Phrase("IN THE BEGINNING WAS THE WORD", 40);
  font = createFont("Arial", 40);
  textFont(font);
  frameRate(25);
}

void draw() {
  background(0);
  f++;
  phrase1.draw(f);
}



int factorial(int n) {
  if (n > 1) return n * factorial(n - 1);
  else return 1;  
}



class Phrase {
  
  String[] mots;
  int[] pos; 
  String delim = " ";
  String ph, phPrev; // two permutations displayed
  int n;             // words in the sentence
  int nFac;          // number of permutations
  int iter;
  int speed;         // frames for displaying each permutation
  
  
  
  Phrase(String _phrase, int _speed) {
    mots = _phrase.split(delim);
    n = mots.length;
    ph = _phrase;
    phPrev = _phrase;
    nFac = factorial(n);
    iter = 0;
    speed = _speed;
    pos = new int[n+1]; 
    for (int i=0; i<n; i++) {
      pos[i] = i;
    }
  }
  
  
  
  void draw(int f) {
  
    if (f%speed == 0) {
      phPrev = ph;
      iter++;
      ph = permute();
    }
    
    if (f >= speed) {
      fill(255, 255, 255, 255 - ((f%speed) * (255 / speed * 3)));
      text(phPrev, 50, 115);
    }
    
    fill(255,255,255,255); stroke(255,255,255,255);
    text(ph, 50, 115);
  }
  
  // permutation algorithm adapted from http://blog.computerelibol.com/?p=9
  
  String permute() {
    
    int j, i, p, k;
    ph = "";
    if (iter == nFac) iter = 0;
    j = 1;
    k = iter;
    pos[n-1] = 0;
    
    //println("frame : " + f + ", iteration : " + iter);
    
    while (j++ < n) {
      p = i = n - j;
      k = k / (j - 1);
      pos[p] = k % j;
      while (i++ < n) {
        if (pos[i] >= pos[p]) pos[i]++;
      }
    }
    
    for(int m=0; m<n ; m++) {
      if (m < (n-1)) ph = ph + mots[pos[m]] +  " ";
      else ph = ph + mots[pos[m]];
    }
    
    return ph;
  }
}







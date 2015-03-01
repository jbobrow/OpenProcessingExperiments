
int y = 50;
PImage frog;

String[] art = {
  "the", "my", "your", "our", "that", "this", "every", "one", "the only", "his", "her"
};
String[] adj = {
  "happy", "rotating", "red", "fast", "elastic", "smily", "unbelievable", "infinte", "surprising", 
  "mysterious", "glowing", "green", "blue", "tired", "hard", "soft", "transparent", "long", "short", 
  "excellent", "noisy", "silent", "rare", "normal", "typical", "living", "clean", "glamorous", 
  "fancy", "handsome", "lazy", "scary", "helpless", "skinny", "melodic", "silly", 
  "kind", "brave", "nice", "ancient", "modern", "young", "sweet", "wet", "cold", 
  "dry", "heavy", "industrial", "complex", "accurate", "awesome", "shiny", "cool", "glittering", 
  "fake", "unreal", "naked", "intelligent", "smart", "curious", "strange", "unique", "empty", 
  "gray", "saturated", "blurry"
};
String[] nou = {
  "frog"
}; 
String[] pre = {
  "under", "in front of", "above", "behind", "near", "following", "inside", "besides", 
  "unlike", "like", "beneath", "against", "into", "beyond", "considering", "without", 
  "with", "towards"
};
String[] ver = {
  "sings", "dances", "was dancing", "runs", "will run", "walks", 
  "flies", "moves", "moved", "will move", "glows", "glowed", "spins", "promised", 
  "hugs", "cheated", "waits", "is waiting", "is studying", "swims", 
  "travels", "traveled", "plays", "played", "enjoys", "will enjoy", 
  "illuminates", "arises", "eats", "drinks", "calculates", "kissed", "faded", "listens", 
  "navigated", "responds", "smiles", "will smile", "will succeed", 
  "is wondering", "is thinking", "is", "was", "will be", "might be", "was never"
};

void write_word(String[] words) {
  int n = int(random(words.length));
  textSize(random(20, 40));
  text(words[n], random(50, 150), y);
  y = y + 30;
}
void new_sentence() {
  background(255);
  y = 50;
  
  write_word(art);
  write_word(adj);
  write_word(nou);

  write_word(ver);
  write_word(pre);

  write_word(art);
  write_word(adj);
  write_word(nou);
}

void setup() {
  size(640, 480);
  frog = loadImage("frog.jpg");
  background(0);
  fill(#000000);
  new_sentence();
}





void draw() {
   for (int i = 0; i <100; i++)
    {
    float x = random(width);
    float y = random(height);
    
    float r = red( frog.get(int(x), int(y) ));
    float g = green( frog.get(int(x), int(y) ));
    float b = blue( frog.get(int(x), int(y) ));
    //fill(c,130);
    fill (int(r),g,int(b),10);
    noStroke();

    ellipse(x,y,8,8);
    }
}
void mousePressed() {
  setup();
}
void keyPressed() {
  int random_number = int(random(1000000));
  save(random_number + ".png");
}


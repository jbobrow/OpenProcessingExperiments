
int y = 50;
int x = 50;
int q = 220;


String[] art = {
  "the", "my", "your", "our", "that", "this", "every", "one", "the only", "his", "her"
};
String[] adj = {
  "happy", "rotating", "red", "fast", "elastic", "smily", "unbelievable", "infinte", "surprising", "mysterious", "glowing", "green", "blue", "tired", "hard", "soft", "transparent", "long", "short", 
  "excellent", "noisy", "silent", "rare", "normal", "typical", "living", "clean", "glamorous", "fancy", "handsome", "lazy", "scary", "helpless", "skinny", "melodic", "silly", 
  "kind", "brave", "nice", "ancient", "modern", "young", "sweet", "wet", "cold", "dry", "heavy", "industrial", "complex", "accurate", "awesome", "shiny", "cool", "glittering", 
  "fake", "unreal", "naked", "intelligent", "smart", "curious", "strange", "unique", "empty", "gray", "saturated", "blurry"
};
String[] nou = {
  "forest", "tree", "flower", "sky", "grass", "mountain", "car", "computer", "man", "woman", "dog", "elephant", "ant", "road", "butterfly", "phone", "computer program", "grandma", "school", "bed", 
  "mouse", "keyboard", "bicycle", "spaghetti", "drink", "cat", "t-shirt", "carpet", "wall", "poster", "airport", "bridge", "road", "river", "beach", "sculpture", "piano", "guitar", "fruit", 
  "banana", "apple", "strawberry", "rubber band", "saxophone", "window", "mac computer", "skate board", "piece of paper", "photograph", "painting", "hat", "space", "fork", 
  "mission", "goal", "project", "tax", "wind mill", "light bulb", "microphone", "cpu", "hard drive", "screwdriver", "parrot"
}; 

String[] ver = {
  "sings", "dances", "was dancing", "runs", "will run", "walks", "flies", "moves", "moved", "will move", "glows", "glowed", "spins", "promised", "hugs", "cheated", "waits", "is waiting", 
  "is studying", "swims", "travels", "traveled", "plays", "played", "enjoys", "will enjoy", "illuminates", "arises", "eats", "drinks", "calculates", "kissed", "faded", "listens", 
  "navigated", "responds", "smiles", "will smile", "will succeed", "is wondering", "is thinking", "is", "was", "will be", "might be", "was never"
};

String[] pre = {
  "under", "in front of", "above", "behind", "near", "following", "inside", "besides", "unlike", "like", "beneath", "against", "into", "beyond", "without", "with", "towards", "touching"
};

String[] punc = {
  "...", "?", "!", ".", ",", ";"
};

String[] con = {
  "even though", "because", "and", "but", "nevertheless", "so", "consequently", "therefore", "despite"
};


void write_word(String[] words) { 
  if (x > 200) {
    x = x - 160;
  }
  int a = int(random(words.length));
  textSize(32);
  fill(random(255), 0, 0);
  text(words[a], x, y);
  y = y + 30;
  x = x + 20;
}

void setup() {
  size(400, 500);
  write_word(art);//1
  write_word(adj);//2
  write_word(nou);//3
  write_word(ver);//4
  write_word(pre);//5
  write_word(art);//6
  write_word(nou);//7
  write_word(punc);//8
  write_word(con);//9
  write_word(art);//10
  write_word(adj);//11
  write_word(nou);//12
  write_word(ver);//13
  write_word(punc);//16
}




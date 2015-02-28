
String[] onset = {
  // consonants except ng
  "b", "p", "t", "k", "g",
  "ch", "j", "f", "v", "th",
  "s", "z", "sh",
  "w", "m", "l", "n", "y", "r",
  "y", "h",
  
  // plosive + non-y approx.
  "pl", "bl", "kl", "gl",
  "pr", "br", "tr", "dr", "kr", "gr",
  "tw", "dw", "gw", "kw",
  
  // voiceless fric + non-y approx
  "fl", "sl", "fr","thr", "shr",
  "sw", "thw",
  
  // consonant + y
  "py", "by", "ty", "dy", "ky", "gy",
  "my", "ny", "fy", "vy", "thy",
  "sy", "zy", "hy", "ly",
  
  // s + voiceless plosive
  "sp", "st", "sk",
  
  // s + nasal
  "sm", "sn",
  
  // s + voiceless fric.
  "sf",
  
  // s + voiceless plosive + approx.
  "spl", "spr", "spy", "smy",
  "str", "sty",
  "skl", "skr", "skw", "sky"
};

String[] nucleus = {
  "a", "e", "i", "o", "u"
};

String[] coda = {
  // consonants except h w y
  "b", "p", "t", "k", "g",
  "ch", "j", "f", "v", "th",
  "s", "z", "sh",
  "m", "l", "n", "y", "r",
  "ng",
  
  "lp", "lb", "lt", "ld", "lk",
  "rp", "rb", "rt", "rd", "rk", "rg",
  "lf", "lv", "lth", "ls", "lsh", "ltsh", "ldg",
  "rf", "rv", "rth", "rs", "rsh", "rtsh", "rdg",
  "lm", "ln",
  "rm", "rn", "ln",
  "mp", "nt", "nd", "ngk",
  "mf", "mth", "nth", "ns", "nz", "ntsh", "ndg", "ngth",
  "ft", "sp", "st", "sk",
  "fth",
  "pt", "kt",
  "pth", "ps", "tth", "ts", "dth", "dz", "ks",
  "lpt", "lfth", "lts", "lst", "lkt", "lks",
  "rmth", "rpt", "rps", "rts", "rst", "rkt",
  "mpt", "mps", "ndth", "ngkt", "ngks", "ngkth",
  "ksth", "kst" 
};

PFont font;
String words;

void setup() {
  size(512, 512, P2D);
  font = createFont("", 24, true);
  noSmooth();
  textFont(font);
  refresh();
}

void refresh() {
  words = "";
  for(int i = 0; i < 400; i++)
    words += randomWord() + " ";
}

void draw() {
  background(0);
  fill(255);
  text(words, 0, 4, width, height);
}

void keyPressed() {
  refresh();
}

String randomWord() {
  String word = "";
  int syllables = int(random(1, 3));
  for(int i = 0; i < syllables; i++)
    word += randomSyllable();
  return word;
}

String randomSyllable() {
  return random(onset) + random(nucleus) + random(coda);
}

String random(String[] strings) {
  return strings[int(random(strings.length))];
}


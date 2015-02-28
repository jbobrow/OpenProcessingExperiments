
PFont font;

String[] word1 = { "long", "compact", "thick", "living", "better", "mushy", "vast", "calm",
                   "fat", "gigantic", "miniature", "deep", "tiny", "loud", "wide",  "skinny", 
                   "flat",  "curved",  "crooked", "soft",  "flaky",  "different", "fixed",
                   "silky", "simple", "painted", "bald", "layered", "cool", "perforated",
                   "grand", "robust", "rough", "rural", "rustic", "shiny", "pastoral", "private", "public", "proud",};

String[] word2 = { "blue", "green", "black", "metal", "jelly", "wooden", "empty", "erect", 
                   "irregular", "uneven", "jumbled", "phallic", "crystal", "glass", "virtual",
                   "helical", "yellow", "old", "historical", "elegant", "moist", "woven",
                   "dirty", "underground", "round", "orthagonal", "cool", "fluid", "smooth",};
                   
String[] word3 = { "tower", "indentation", "point", "line", "sponge", "blob", "array", "pattern",
                   "grain", "expanse", "grid", "void", "ornament", "piece", "platform", "cluster",
                   "tier", "thing", "object", "mass", "plane", "square", "ramp", "ring", "block",
                   "tube", "space", "opening", "form", "feature", "field", "cave", "recess",};

int index1 = int(random(word1.length));
int index2 = int(random(word2.length));
int index3 = int(random(word3.length));

void setup() {
size(600, 250);
font = loadFont("Vrinda-48.vlw");
textFont(font, 48);
textAlign(CENTER);
noLoop();
}

void draw() {

background(0);

int index1 = int(random(word1.length));
int index2 = int(random(word2.length));
int index3 = int(random(word3.length));

textSize(48);
text("maybe it's a " + word1[index1] + " " + word2[index2] + " " + word3[index3] + "?", 300, 134);

//textSize(20);
//text("or maybe it's something entirely different?", 300, 160);

textSize(15);
text("copyright (c) Gerard Walsh 2010 ", 515, 240);
}

void mouseClicked() {
  redraw();
}



// Pseudo-random sentences (FR) - "cadavre exquis" //
// http://en.wikipedia.org/wiki/Exquisite_corpse   //
// /////////////////////////////////////////////// //

void setup() {
  size(800, 400);
  frameRate(1/5);
  background(0);
  };

void draw() {

// simple list of words in arrays to create a half-baked French sentence with a subj+adj+v+adv+compl structure
string [][] sujcompl = {
"le loup-garou",
"le cri du chauve... souris",
"le cadavre",
"le festin",
"le cerf-volant",
"l'orange",
"la fleur",
"la tombe",
"la maison hant\xE9e",
"le sushi",
"la f\xE9e",
"le vent",
"le zombie",
"la souffleuse",
"le vampire",
"le tire-bouchon",
"le sorcier",
"le capitaine",
"l'\xE9toile de ninja"
};
string [][] verbe = {
"mange",
"mord",
"lance",
"ouvre",
"ferme",
"aime",
"explose",
"d\xE9coupe",
"embrasse",
"vole",
"lib\xE8re",
"op\xE8re",
"dig\xE8re",
"dessine",
"attaque",
"d\xE9fend",
"effraie"
};
string [][] adverbe = {
"all\xE8grement",
"terriblement",
"vertigineusement",
"mortellement",
"courageusement",
"indubitablement",
"\xE9pouvantablement",
"verbalement",
"affectueusement",
"d\xE9licieusement"
};
string [][] adjectif = {
"invert\xE9br\xE9(e)",
"\xE9gar\xE9(e)",
"triste",
"bleu(e)",
"scintillant(e)",
"vibrant(e)",
"dangereu(se)",
"congel\xE9(e)",
"multicolore",
"d\xE9goulinant(e)",
"sucr\xE9(e)",
"glac\xE9(e)"
};

a = floor(random(sujcompl.length));
b = floor(random(adjectif.length));
c = floor(random(verbe.length));
d = floor(random(adverbe.length));
e = floor(random(sujcompl.length));

if (e == a) {
      e = floor(random(sujcompl.length));
      } 

    
string phrase = sujcompl[a]+" "+adjectif[b]+" "+verbe[c]+" "+adverbe[d]+" "+sujcompl[e]+"...";

// erase last sentence??
fill(0);
noStroke();
rect(0, 0, width, height);

// "pumpkin" loll
fill(204, 102, 0);
ellipse(50, 50, 100, 100);
pushMatrix();
fill(0);
translate(50, 50);
ellipse(-20, -10, 20, 10);
ellipse(20, -10, 20, 10);
triangle(0, 0, -5, 10, 5, 10);
noFill();
stroke(0);
translate(0, 10);
beginShape(TRIANGLE_STRIP);
vertex(-15, 10);
vertex(-5, 20);
vertex(0, 10);
vertex(5, 20);
vertex(15, 10);
endShape();
popMatrix();

// new sentence
stroke();
fill(255);
textAlign(CENTER, CENTER);
textLeading(20);
textSize(50);
text(phrase, 0, 0, 800, 400); 

};

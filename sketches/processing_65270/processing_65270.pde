
PFont holes, abecedario ; //= variables pour les polices
size(780,100);
background(255);
//importer les polices du dossier data:
holes = loadFont("18HolesBRK-48.vlw");
abecedario = loadFont("Abecedario-Bold-48.vlw");

textFont(holes,48);
fill(255,0,0,255);
text("That is Processing",20,75);

textFont(abecedario,48);
fill(0,0,255,128);
text("It's amazing!",20,75);


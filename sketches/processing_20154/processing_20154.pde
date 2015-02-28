
PFont font;
String []verbe= {"Mime","Dessine","Chante","Décris","Imite","Sculpte","Génère sur processing","Danse comme","Parle comme"};
String []objet= {"un torrero","un éléphant","un vélo","un panda","un zébu","ton voisin","un tee-shirt","un piranha","un petit chat","R2D2","un hamster","un shamallow","un ressort","un parapluie","un pompier","un griffon","un troll","un poulpe","un nez","du guacamol","un hibou","un curé","un jambon","un caribou"};
String []adjectif= {"hyperactif","terrifiant","ultrasensible","dodu","surhumain","allergique","unijambiste","rugueux","cleptoman","en pyjama","aristocratique","obèse","vert","égyptien","enrhumé","endiablé","amoureux","tatoué","frisé","mal lavé","poilu","épilé","anesthésié"};
String []endroit= {"dans un champ de maïs.","chez Danielle.","chez Patrice.","chez Vincent.","à l'ESAC.","chez MacDonald's.","chez Marie.","qui a perdu une boucle d'oreille.","qui s'étouffe.","chez Lucie.","dans ta salle de bain.","qui mange un yaourt.","qui boit du café.","devant un dinausore.","sur un skate.","sous un radiateur.","chez Elise.","à Brax.","dans le bac à légumes.","sur la lune.","devant ton lavabo.","en Nouvelle-Calédonie.","sur les pieds de ton père."};

void setup () {
  size (1200,300);
  font=loadFont("AgencyFB-Bold-43.vlw");
  textFont(font);
  background(0);
}

void draw () {
  if (mousePressed){
    background(0);
    text (verbe[int(random(8))]+":"+" "+objet[int(random(20))]+" "+adjectif[int(random(23))]+" "+endroit[int(random(23))],20,150);
}
}



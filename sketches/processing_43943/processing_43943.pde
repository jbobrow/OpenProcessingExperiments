
//sketch construit d'après des élements appris au cours de Mathieu Savary

String[][] tErre = {{"i","am","that", "i","am"},{"i","am","that", "i","am"},
{"i","am","that", "i","am"},{"i","am","that", "i","am"},{"i","am","that", "i","am"},
{"i","am","that", "i","am"},{"i","am","that", "i","am"}};
PFont font;

   color []monArraydeCouleurs = {color(194, 152, 234), color(115, 52, 234), color(55, 52, 234), color(52, 150, 230), 
color(55, 70, 60), color(234, 150, 160), color(255, 50, 89),};
// au lieu de mettre des else et des ifon utilise un Array (tableau)
int index = 0; 
// i pour index

void setup() {
  size(800,600);
  frameRate(0.5);
  font = loadFont("HelveticaNeue-Bold-48.vlw"); 
  textFont(font); 
 
}



void draw() {
    background(monArraydeCouleurs[index]);
     fill (255);
  
  if (index > 5) {
  index = 0;
  } else {
  index = index + 1;
  }



    
    String s = tErre[0][(int) random(0,5)] + " " + tErre[1][(int) random(0,5)]+ " " + tErre[2][(int) random(0,5)]
    + " " + tErre[3][(int) random(0,5)] + " " + tErre[4][(int) random(0,5)];
    text(s, 10, 63);
    String t = tErre[0][(int) random(0,5)] + " " + tErre[1][(int) random(0,5)]+ " " + tErre[2][(int) random(0,5)]
    + " " + tErre[3][(int) random(0,5)] + " " + tErre[4][(int) random(0,5)];
    text(t, 100, 120);
    String o = tErre[0][(int) random(0,5)] + " " + tErre[1][(int) random(0,5)]+ " " + tErre[2][(int) random(0,5)]
    + " " + tErre[3][(int) random(0,5)] + " " + tErre[4][(int) random(0,5)];
    text(o, 60, 180);
     String d = tErre[0][(int) random(0,5)] + " " + tErre[1][(int) random(0,5)]+ " " + tErre[2][(int) random(0,5)]
    + " " + tErre[3][(int) random(0,5)] + " " + tErre[4][(int) random(0,5)];
    text(d, 190, 240);
     String a = tErre[0][(int) random(0,5)] + " " + tErre[1][(int) random(0,5)]+ " " + tErre[2][(int) random(0,5)]
    + " " + tErre[3][(int) random(0,5)] + " " + tErre[4][(int) random(0,5)];
    text(a, 90, 300);
     String b = tErre[0][(int) random(0,5)] + " " + tErre[1][(int) random(0,5)]+ " " + tErre[2][(int) random(0,5)]
    + " " + tErre[3][(int) random(0,5)] + " " + tErre[4][(int) random(0,5)];
    text(b, 290, 360);
     String c = tErre[0][(int) random(0,5)] + " " + tErre[1][(int) random(0,5)]+ " " + tErre[2][(int) random(0,5)]
    + " " + tErre[3][(int) random(0,5)] + " " + tErre[4][(int) random(0,5)];
    text(c, 180, 420);
    fill (0);
    text ("7 random “i am that i am“", 20, 510);
    text ("of poem of Brion Gysin", 20,560);
    
}



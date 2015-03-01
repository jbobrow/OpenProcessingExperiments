
int WIDTH = 500;
int HEIGHT = 500;

void setup() {
  size(WIDTH, HEIGHT);  
}


/**
 * Execute les commandes de dessin.
 */
void turtle(String commands, float angle, float len) {
  for(int ii = 0; ii < commands.length(); ++ii) {
    char command = commands.charAt(ii);

    if("F" == command || "|" == command) {
      line(0, 0, len, 0);
      translate(len, 0);
    }
    
    if("+" == command) {
      rotate(angle);
    }

    if("-" == command) {
      rotate(-angle);
    }
    
    if("[" == command) {
      pushMatrix();
    }
    
    if("]" == command) {
      popMatrix();
    }
    
  }
}

/**
 * Fait grandir la construction selon la grammaire,
 * un certain nombre de fois.  
 */
String grow(String construct, HashMap grammar, int increments) {
  String grown = "";
  
  for(int ii = 0; ii < increments; ++ii) {
    for(int jj = 0; jj < construct.length(); ++jj) {
      String command = construct.charAt(jj)+"";
      
      if(!grammar.containsKey(command)) {
        grown += command;
      } else {
        grown += grammar.get(command);
      }
    }
    
    construct = grown;
    grown = "";
  }

  
  return construct;
}

void draw() {
  //Parametres graphiques
  background(color(0, 32, 64));  
  stroke(color(64, 128, 255));
  
  //L-System
  HashMap grammar = new HashMap();
  grammar.put("F", "F-F++F-F");

  //Faire grandir la construction
  String grown = grow("F++F++F", grammar, 4);
  
  //Dessiner la construction
  pushMatrix();
  translate(10, 80);
  turtle(grown, PI/3, 3);
  popMatrix();
  
  //L-System
  grammar = new HashMap();
  grammar.put("F", "F-F+F+FF-F-F+F");
  
  //Faire grandir la construction
  grown = grow("F-F-F-F", grammar, 3);
  //Dessiner la construction
  pushMatrix();
  translate(240, 430);
  turtle(grown, PI/2, 3);
  popMatrix();
}

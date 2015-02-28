
/*

Carolyn Schuetz
Art 479 Algorithmic VCD
Final Project Pseudocode
Due: 2/10/11


Wand myWand; 

main class {
  import Wii Remote class;
  
  void setup() {
    new canvas that is 600 x 600
    Wand wand = new Wand();
    Spell[] spells = new array of Spells[6];
    
  }
  
  void display() {
    display all types of wands;
    myWand = whichever Wand user clicks on with mouse;
    end loop();
    
    display all of the spells in the array
    if(WiiRemote hits the space a spell is display in) {
      castSpell();
    }
  }
}

class Wand {
  String wizard;
  
  Wand(String wizardName) {
    wizard = wizardName;
    link Wand to WiiRemote;
  }
  
  void display() {
    if(wizardName = Hermione) {
      draw a wand that looks like Hermione's;
    }
    if(wizardName = Harry) {
      draw a wand that looks like Harry's;
    }
    etc for all characters
  }
  
  void castSpell(Spell spell) {
    spell.cast();
  }
}

class Spell {
  
  String spell;
  
  Spell(String spellType) {
    spell = spellType;
  }
  
  void cast() {
    if spell is "lumos"
      display lights turning on;
    if spell is "avada kedavra"
      display computer blowing up;
    etc.
  }
}

*/


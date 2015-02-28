
int y=0;
int y1=0;
int speed;
int speed1=-250;

void setup() {
  size(500, 500);
  smooth();
  PFont var;
  var = loadFont("WalkwayBlackRevOblique-48.vlw");

}
void draw(){
  background(255);
  fill(0);
  String txt="La grotta è la prima forma di casa riparata,La grotta è la prima forma di casa riparata,La grotta è la prima forma di casa riparata, scavata nella roccia in seguito a fenomeni d'erosione,soprattutto marina, fluviale o glaciale e di altre specieLa tenda, invece, accompagna fin dal suo apparire il nomadismo dell'uomo ed esiste tuttora in formeassai varie. Esempio di capanna La capanna, che compare nel Neolitico, implica già un progetto di architettura primitiva; il tipo più elementare è un riparo costruito con rami piegati ad arco e fissati al terreno per le due estremità e quindi ricoperti di frasche: è il tipo detto ad alveare. Il tipo cupoliforme, invece, è più complesso ed è usato tutt'oggi da molti popoli. I materiali variano secondo il clima e la cultura del popolo: dal feltro dei Mongoli alla pelle di bufalo dei Sioux al ghiaccio per gli igloo degli Inuit. Un tipo particolare di abitazione, anch'esso risalente al Neolitico, è costituito dalle palafitte, ovvero da case di legno innalzate su piattaforme infisse nell'acqua su alti pali, allo scopo di difesa in ambienti acquitrinosi e paludosi. L'uso del legno per le abitazioni è comunque tipico delle aree boschive settentrionali ed estremo orientali, mentre l'uso del mattone contraddistingue le aree meridionali e orientali.";
  String txt2="La grotta è la prima forma di casa riparata, La grotta è la prima forma di casa riparata,La grotta è la prima forma di casa riparata,scavata nella roccia in seguito a fenomeni d'erosione,soprattutto marina, fluviale o glaciale e di altre specieLa tenda, invece, accompagna fin dal suo apparire il nomadismo dell'uomo ed esiste tuttora in formeassai varie. Esempio di capanna La capanna, che compare nel Neolitico, implica già un progetto di architettura primitiva; il tipo più elementare è un riparo costruito con rami piegati ad arco e fissati al terreno per le due estremità e quindi ricoperti di frasche: è il tipo detto ad alveare. Il tipo cupoliforme, invece, è più complesso ed è usato tutt'oggi da molti popoli. I materiali variano secondo il clima e la cultura del popolo: dal feltro dei Mongoli alla pelle di bufalo dei Sioux al ghiaccio per gli igloo degli Inuit. Un tipo particolare di abitazione, anch'esso risalente al Neolitico, è costituito dalle palafitte, ovvero da case di legno innalzate su piattaforme infisse nell'acqua su alti pali, allo scopo di difesa in ambienti acquitrinosi e paludosi. L'uso del legno per le abitazioni è comunque tipico delle aree boschive settentrionali ed estremo orientali, mentre l'uso del mattone contraddistingue le aree meridionali e orientali.";
  text(txt,30,y+speed,470,470);
  text(txt2,30,y1+speed1,470,470);
  
  speed = speed+2;
  speed1 = speed1+2;
  if(speed >= 500){
    speed=0;
  }
  if(speed1 >= 500){
    speed1=0;
  }    
}


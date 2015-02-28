
//Globals
PFont font;
String bcds = "bcdfghjklmpqrstvwxyz";
String aeis = "aeiou";
String babel = "";
String babel2 = "";
int i = 0;
ArrayList babels = new ArrayList();
int totalBabels;
Boolean saveBabel = true;


void setup() {
  size(200, 200);
  font = loadFont("Helvetica-14.vlw");
  textFont(font);
}

void draw() {
  background(255);
  makeBabel();
  text(babel, 90, 100);
  fill(0);
}

void makeBabel(){
  if(babel.equals("hello") == false) {
    char l0 = bcds.charAt(int(random(20)));
    char l1 = aeis.charAt(int(random(4)));
    char l2 = bcds.charAt(int(random(20)));
    char l3 = bcds.charAt(int(random(20)));
    char l4 = aeis.charAt(int(random(4)));
    char letters[] = {
      l0, l1, l2, l3, l4}; 
    babel = new String(letters);
    saveBabel = true;
    checkBabel(); 
  }

  if(babel.equals("hello") == true){
    saveBabel = true;
    text(babel, 90, 100);
    fill(255, 0, 0);
    addBabel();
    saveBabel();
  }
}

void checkBabel(){
  totalBabels = babels.size();

  for (int s = 0; s < totalBabels; s++) {
    if(babel.equals(babels.get(s)) == true) { 
      //println("false: "+babel);
      saveBabel = false;
      break;
    }
    
  }
  if (saveBabel) {
  addBabel();
  }
  
}

void addBabel() {

  babels.add(babel);
  //print(totalBabels);
  //println(": " + babel);
 
}

void saveBabel() {
 String [] babelstr = new String [totalBabels];
 for (int t = 0; t < totalBabels; t++) {
   babelstr[t] = t + " " + babels.get(t);
 }
   saveStrings("Babels.txt", babelstr);
}






























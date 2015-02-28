
/**
*  
*  Make Love, October 7, 2009
*  Jeremy Tubbs, www.jeremytubbs.com
*
*/

//Globals
PFont font;
String [] phrase = new String[]{"m","a","k","e"," ","l","o","v","e"};
String love = "";
int i = 0;
ArrayList loves = new ArrayList();
int totalLoves;
Boolean saveLove = true;


void setup() {
  size(250, 100);
  font = loadFont("CourierNewPSMT-36.vlw");
  textFont(font);
}

void draw() {
  background(255);
  makeLove();
  text(love, 25, 50);
  fill(0);
  
  if (keyPressed){
   if (key == 's') saveLove(); 
  }
}

void makeLove(){
  if(love.equals("make love") == false) {
    Collections.shuffle(Arrays.asList(phrase));
    love = (phrase[0]+phrase[1]+phrase[2]+phrase[3]+phrase[4]+phrase[5]+phrase[6]+phrase[7]+phrase[8]);
    saveLove = true;
    checkLove(); 
  }

  if(love.equals("make love") == true){
    saveLove = true;
    text(love, 90, 100);
    fill(255, 0, 0);
    addLove();
    saveLove();
  }
}

void checkLove(){
  totalLoves = loves.size();

  for (int s = 0; s < totalLoves; s++) {
    if(love.equals(loves.get(s)) == true) { 
      //println("false: "+love);
      saveLove = false;
      break;
    }
    
  }
  if (saveLove) {
  addLove();
  }
  
}

void addLove() {

  loves.add(love);
  //print(totalLoves);
  //println(": " + love);
 
}

void saveLove() {
 String [] lovestr = new String [totalLoves];
 for (int t = 0; t < totalLoves; t++) {
   lovestr[t] = t + " " + loves.get(t);
 }
   saveStrings("Loves.txt", lovestr);
}






























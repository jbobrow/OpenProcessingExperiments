
PImage logoNASDAQ, logoEA, logoActivisionBlizzard, logoStarbucks, logoWholeFoods;
int margeN = 50;
int sQty;
String [] sDate;
float []sOpen;
float [] sClose;
float [] sResult;
float openHi, openLo;
float closeHi, closeLo;

void setup(){
  size(533,369);
  smooth();
  logoNASDAQ = loadImage("NASDAQ_logo.jpg");
  logoEA = loadImage("EA_logo.gif");
  logoActivisionBlizzard = loadImage("Activision_Blizzard_logo.jpg");
  logoStarbucks = loadImage("Starbucks_logo.png");
  logoWholeFoods = loadImage("Whole_Foods_logo.png");
}

void draw(){
  String datalines[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=%5ENDX&a=0&b=1&c=2012&g=d&ignore=.csv");
  sQty=datalines.length;
  sDate = new String [sQty];
  sOpen = new float [sQty];
  sClose = new float [sQty];
  sResult = new float [sQty];
  
  for (int counter=1;counter<sQty;counter++) {
    String[] temp = split(datalines[sQty-counter], ',');
    sDate [counter] = temp [0];//save date as String;
    sOpen [counter] = float (temp [1]);
    sClose[counter] = float (temp [4]);
    sResult[counter] = float (temp [4]) - float (temp[1]);
  }
  println (sOpen[1]); //--- test
  println (sDate[1]);
  println (sClose[1]);
  println (sResult[1]);
  openHi = max (sOpen);
  openLo = min (sOpen);
  closeHi = max (sClose);
  closeLo = min (sClose);
 
  
  for (int n=1;n<sQty;n++){
    float myY = map (sClose[n],closeLo,closeHi, height-margeN, margeN);
    float myX = 5*2*(n)+margeN;
    fill(0);
    strokeWeight(3);
    point (myX,myY);
  }
}
                

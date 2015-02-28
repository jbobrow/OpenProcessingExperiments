
PImage backgroundPic, logoNASDAQ, logoEA, logoActivisionBlizzard, logoStarbucks, logoWholeFoods;
int margeN = 50;
int sQty;
String [] sDate;
float []sOpen;
float [] sClose;
float [] sResult;
float openHi, openLo;
float closeHi, closeLo;
//int startX, startY; // thansk to Tracy
int startX = 95+margeN+margeN;
int startY = 540-65-margeN-margeN;

void setup() {
  size(720, 540);
  smooth();
  backgroundPic = loadImage("iPad.jpg");
  logoNASDAQ = loadImage("NASDAQ.png");
  logoEA = loadImage("EA.png");
  logoActivisionBlizzard = loadImage("ActivisionBlizzard.png");
  logoStarbucks = loadImage("Starbucks.png");
  logoWholeFoods = loadImage("WholeFoods.png");
}

void draw(){
  background(255);
  image(backgroundPic,0,0);
  timeCount();
  homepage();
  mouseMovement();
}

void mouseMovement(){  
  if (mousePressed == true){
  if (128<mouseX && mouseX<198 && 135<mouseY && mouseY<205){
    inputNASDAQ();
    //if (mousePressed == false){
    //    inputNASDAQ();
    //  }
  } else if (228<mouseX && mouseX<298 && 135<mouseY && mouseY<205){
    inputEA();
  } else if (328<mouseX && mouseX<398 && 135<mouseY && mouseY<205){
    inputActivisionBlizzard();
  } else if (428<mouseX && mouseX<498 && 135<mouseY && mouseY<205){
    inputStarbucks();
  } else if (528<mouseX && mouseX<598 && 135<mouseY && mouseY<205){
    inputWholeFoods();
  } else if (638<mouseX && mouseX<658 && 265<mouseY && mouseY<285){
    scale(5);
    homepage();
  } 
  } else {
    scale(5);
    homepage();
  }
}

void homepage(){
  scale(.2);
  image(logoNASDAQ, 625, 650);
  image(logoEA, 1125, 650);
  image(logoActivisionBlizzard, 1625, 650);
  image(logoStarbucks, 2125, 650);
  image(logoWholeFoods, 2625, 650);

}

void inputNASDAQ() {
  timeCount();
  scale (5);
  String datalines[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=%5ENDX&a=0&b=1&c=2012&g=d&ignore=.csv");
  sQty=datalines.length;//each day in the array -- datalines is local
  sDate = new String [sQty];
  sOpen = new float [sQty];
  sClose = new float [sQty];
  sResult = new float [sQty];

  for (int counter=1;counter<sQty;counter++) { // --- parse data
    String[] temp = split(datalines[sQty-counter], ',');
    sDate [counter] = temp [0];//save date as String;
    sOpen [counter] = float (temp [1]);
    sClose[counter] = float (temp [4]);
    sResult[counter] = float (temp [4]) - float (temp[1]);
    println ("Date " + sDate[counter] + "," + "Open Price " + sOpen[counter] + "," +"Close Price " +sClose[counter] + "," + "Result " +sResult[counter]);
  }
  openHi = max (sOpen);
  openLo = min (sOpen);
  closeHi = max (sClose);
  closeLo = min (sClose);
  drawChart();
}

void inputEA() {
  scale(5);
  String datalines[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=EA&a=0&b=1&c=2012&g=d&ignore=.csv");
  sQty=datalines.length;//each day in the array
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
    println ("Date " + sDate[counter] + "," + "Open Price " + sOpen[counter] + "," +"Close Price " +sClose[counter] + "," + "Result " +sResult[counter]);
  }
  openHi = max (sOpen);
  openLo = min (sOpen);
  closeHi = max (sClose);
  closeLo = min (sClose);
  drawChart();
}

void inputActivisionBlizzard() {
  scale(5);
  String datalines[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=ATVI&a=0&b=1&c=2012&g=d&ignore=.csv");
  sQty=datalines.length;//each day in the array
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
    println ("Date " + sDate[counter] + "," + "Open Price " + sOpen[counter] + "," +"Close Price " +sClose[counter] + "," + "Result " +sResult[counter]);
  }
  openHi = max (sOpen);
  openLo = min (sOpen);
  closeHi = max (sClose);
  closeLo = min (sClose);
  drawChart();
}

void inputWholeFoods() {
  scale(5);
  String datalines[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=WFM&a=0&b=1&c=2012&g=d&ignore=.csv");
  sQty=datalines.length;//each day in the array
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
    println ("Date " + sDate[counter] + "," + "Open Price " + sOpen[counter] + "," +"Close Price " +sClose[counter] + "," + "Result " +sResult[counter]);
  }
  openHi = max (sOpen);
  openLo = min (sOpen);
  closeHi = max (sClose);
  closeLo = min (sClose);
  drawChart();
}

void inputStarbucks() {
  scale(5);
  String datalines[]=loadStrings("http://ichart.finance.yahoo.com/table.csv?s=SBUX&a=0&b=1&c=2012&g=d&ignore=.csv");
  sQty=datalines.length;//each day in the array
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
    println ("Date " + sDate[counter] + "," + "Open Price " + sOpen[counter] + "," +"Close Price " +sClose[counter] + "," + "Result " +sResult[counter]);
  }
  openHi = max (sOpen);
  openLo = min (sOpen);
  closeHi = max (sClose);
  closeLo = min (sClose);
  drawChart();
}

void drawChart(){
  background(255);
  image(backgroundPic, 0, 0);
  fill(255);
  //stroke(0);
  strokeWeight (1);
  rect(startX-margeN, 106+margeN, 533-(margeN*2), 369-(margeN*2));
  strokeWeight (3);
  line(startX, 106+margeN+margeN, startX, startY);
  line(startX, startY, width-startX+30, startY);
  //x line = width-92-margeN-margeN-(95+margeN+margeN) = 333
  //println (startX); //--- test
  //println (startY);
  float barWidth = 180/(sQty-1);
  //println (barWidth);
  for (int n=1;n<sQty;n++) {
    fill(255);
    float barHeight = map (sClose[n], closeHi, closeLo, 106+margeN+margeN, startY-106-margeN-margeN-50);
    float barLoc = barWidth*2*(n-1);
    //println(barLoc); // --- test
    //println(barHeight);
    if (sResult[n]>=0) {
      fill(#458B00);
      stroke(#458B00);
    }
    else {
      fill(#CD0000);
      stroke(#CD0000);
    }
    rect (startX+barLoc, startY-barHeight+50, barWidth, barHeight-50);
  }
}

void timeCount(){
  fill(255);
  textAlign (CENTER);
  textSize (12);
  String nHour =  str(hour()%12);
  if (nHour.length()==1) nHour= "0" + nHour;
  String nMinute = str(minute());
  if (nMinute.length()==1) nMinute= "0" + nMinute;
  String nSecond = str(second());
  if (nSecond.length()==1) nSecond= "0" + nSecond; 
  nHour= nHour + ":" + nMinute + ":" + nSecond;
  text(nHour,width/2,104);
}



String dataFile = "2000-2008_Mi_Sa_6_aus_49_Zusatz_Super.txt";
//String dataFile = "2002_Mi_Sa_6_aus_49_Zusatz_Super.txt";
//String dataFile = "2000_Sa+4xMi_6_aus_49_Zusatz_Super.txt";

int[][] ziehungen_All;
int[] overallCnt; // Gesamtstatistik über alle Ziehungen
Box tmpBox;
//ArrayList tmpBoxArray;
//ArrayList allBoxes;
boolean rendered = false;

float sze = 3;
float abst = 2;
float startPosX = 20;
float startPosY = 40;

int lengthX = 49; // anzahl der bälle ziehungen pro sitzung
int lengthY = 52; // wird beim einlesen von daten angepasst an die anzahl der ziehungen

int counter = 0; // zählt die bälle einer sizung
int ballCnt = 0; // zählt die gezogenen bälle



void setup()
{
  size (380, 4600);
  background(0, 0, 0);
  //rectMode(CORNERS);
  //allBoxes = new ArrayList();
  reset_overallCnt();
}



void draw()
{
 if(!rendered) renderBoxes(); 
}

void reset_overallCnt()
{
  overallCnt = new int[49];
  for(int i =0; i<overallCnt.length; i++)
  {
    overallCnt[i] = 0;
  }
}

void renderBoxes()
{
  // lese die daten ein
  ziehungen_All = readData(dataFile);
  
  // zeichne das gitter
  float posX = startPosX;
  float posY = startPosY;
  
  for(int i = 0; i<= lengthY-1; i++) // y-richtung: sitzungen
  {
    //tmpBoxArray = new ArrayList();
    posY = startPosY + (sze+abst)*i;
    
    // vor jeder ziehung
    counter = 0;
    ballCnt = 0;
    
    for(int j = 0; j<= lengthX-1; j++) // x-richtung: alle für die ziehung verfügbaren bälle
    {
      counter++;
      posX = startPosX + (sze+abst)*j;
      //posY = posY*i + abst;
      int clrChnge = 0; //j*3;
      tmpBox = new Box(color(255-clrChnge,255-clrChnge,255-clrChnge), posX, posY, sze);
      checkBox_6of49(tmpBox, j, i);
      tmpBox.nr = counter;
      tmpBox.display();
      //tmpBoxArray.add(tmpBox);
      
    }
    //println("balls: " + ballCnt);
    //allBoxes.add(tmpBoxArray);
  }
  
  drawStatistics_overAll();
  rendered = true;
  //println("statistik über alle ziehungen:");
  //println(overallCnt);
  // auslesen einer einzelnen box
  //Object oneListOfBoxes = allBoxes.get(0);
  //wie jetzt rankommen an eine einzige box?
  
  save(dataFile+".jpg");
}

void checkBox_6of49(Box b, int x, int y)
{
  //println(ziehungen_All[y].length);
  for(int i = 0; i <= 5; i++){ // ziehungen_All[y].length ist hier acht
    if(ziehungen_All[y][i] == x && ballCnt < 6) // nur die ersten sechs einträge pro sitzungs-zeile prüfen
    {
      b.active = true;
      overallCnt[x] += 1;
      //println(x);
      ballCnt++;
    }
  }
}

void simulateLotto(Box bx)
{
  if(ballCnt < 6)
  {
    int rndm = int(random(6));
    if(rndm == 1) {
      bx.active = true;
      ballCnt++;
    }
  }
}

void drawStatistics_overAll()
{
  for(int j = 0; j<= overallCnt.length-1; j++) // x-richtung: ziehung
  {
    float xPos = startPosX + (sze+abst)*j;
    stroke(255);
    line(xPos, 1, xPos+sze, 1);
    noStroke();
    float h = 1000 * overallCnt[j]/(ziehungen_All.length*6);
    //float h = overallCnt[j];
    fill(color(255,255,255));
    rect(xPos, 4, sze, h);
  }
}

int[][] readData(String fileLoc)
{
  // Mi + Sa Lotto 2008, 6 aus 49 + Zusatzzahl + Superzahl
  String lines[] = loadStrings(fileLoc);
  int[][] allSessions_2008 = new int[lines.length][8];
  
  //println("there are " + lines.length + " lines");
  for (int i=0; i < lines.length; i++) {
    String[] oneLine = split(lines[i], ','); // splits every line into an array of strings
    int[] oneSession = new int[8]; // creates for every session one int-array
    // convert the string data to int
    for(int j = 0; j< oneLine.length; j++){
      oneSession[j] = int(oneLine[j]);
    }
    allSessions_2008[i] = oneSession;
  }
  lengthY = allSessions_2008.length;
  println("there are " + lengthY + " sessions");
  return allSessions_2008;
}

class Box { 
  color c;
  float xpos;
  float ypos;
  float sze;
  
  // date
  int nr;
  
  boolean active = false;
  
  // The Constructor is defined with arguments.
  Box(color tempC, float tempXpos, float tempYpos, float tempSze) 
  { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    sze = tempSze;
  }
  
  void display()
  {
    stroke(255);
    if (active) fill(color(0,0,0)); 
    else fill(c);
    noStroke();
    rect(xpos, ypos, sze, sze);
  }
}

// eine reihe als erstes zeigt die häufigkeit der gezogenen zahlen
// über die größe der objekte an

// es folgt das gitter der gezogenen zahlen pro ziehung als farbwertänderung



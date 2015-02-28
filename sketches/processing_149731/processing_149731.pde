
    


//Groesse des Spielblobs
int xSize;
int ySize;

//Startpunkt des Spielblobs
int xKoordinate;
int yKoordinate;

//Ankerpunkt erste Feder
int x0;
int y0;

//Ankerpunkt zweite Feder
int x1;
int y1;

//Startgeschwindigkeit
float vx=0f;
float vy=0f;

//Physikalische Konstanten
float mass=0.1f;
float spring=0.01f;
float gravity=9.81f;
float deltat=0.2f;
float friction=0.005f;


//Ankerpunkte in Sechstel-Spielfeldbreiten
int[] xCoords;
int[] yCoords;
int[] anchorState;
int level=1;
int anchorSize;

//Verwaltungsvariablen
int spielFeldGroesse;
boolean gameover=false;
boolean free=false;
boolean failed=false;
int state=1;
int timer=0;

//Kuenstlerischer Ausdruck
color figurFarbe=color(200, 30, 30);
color hintergrundFarbe=color(220, 220, 180);

//Punktezaehler
int score;



void setup() {
  size(600, 600);
  ellipseMode(CENTER);
  prepareSpielFeld();
  reset();

}

void mouseClicked() {
  int clickedAnchor=-1;
  for (int i=0;i<anchorState.length;i++) {
    if (dist(xCoords[i], yCoords[i], mouseX, mouseY)<anchorSize/2&&anchorState[i]==1) {
      clickedAnchor=i;
      anchorState[i]=0;
      break;
    }
  }
  if (clickedAnchor>-1||gameover) {
    free=!free;
    state+=1;
    if (state>2)state=1;
  }
  updateFederAnker();
}

void updateFederAnker() { 
  if (free) {
    if (state==1) {
      x0=mouseX;
      y0=mouseY;
    }
    else {
      x1=mouseX;
      y1=mouseY;
    }
    free=false;
  }
}

void draw() {
  drawSpielFeld();
  drawSpielFigur();
  updatePhysics();
  updateScore();
  drawScoreBoard();
}

void drawSpielFeld() {
  background(hintergrundFarbe);
  drawAnchors();
}

void drawSpielFigur() {
  //Federn zeichnen - die, die als naechste versetzt wird, in gruen!
  fill(0, 0, 0, 0);
  strokeWeight(2);
  if (state==2) stroke(50, 200, 0);
  else stroke(0, 0, 0);
  line(x0, y0, xKoordinate, yKoordinate);
  ellipse(x0, y0, 5, 5);

  if (state==1) stroke(50, 200, 0);
  else stroke(0, 0, 0);
  line(x1, y1, xKoordinate, yKoordinate);
  strokeWeight(1);
  ellipse(x1, y1, 5, 5);


  //Spielblob zeichnen
  stroke(0, 0, 0);
  fill(figurFarbe);
  ellipse(xKoordinate, yKoordinate, xSize, ySize);
}

void drawAnchors() {
  for (int i=0;i<xCoords.length;i++) {
    stroke(0);
    if (anchorState[i]==1) {
      fill(50, 50, 150);
    }
    else if (anchorState[i]==2) {
      fill(150, 50, 50);
    }
    else {
      fill(50, 150, 50, 2);
    }
    if (anchorState[i]!=3)ellipse(xCoords[i], yCoords[i], anchorSize, anchorSize);
    
  }
}

void updateScore() {
  for (int i=0;i<xCoords.length;i++) {
    if (anchorState[i]==1&&dist(xCoords[i], yCoords[i], xKoordinate, yKoordinate)<=(xSize+anchorSize)/2)
      anchorState[i]=2; //beruehrt!
  }
}

void drawScoreBoard() {
  score=anchorState.length;
  for (int i:anchorState) {
    if (i==0)score--;
  }
  textSize(30);
  fill(0);
  textAlign(LEFT, CENTER);
  text("Score: "+score, 50, 20);
  textAlign(LEFT, CENTER);
  text("Time: "+timer, width-200, 20);
  text("Level "+level, 50, height-20);
  boolean someleft=false;
  for (int i:anchorState) {
    if (i==1)someleft=true;
  }
  if (!someleft) {
    for (int i:anchorState) {
      if (i==2)failed=true;
    }
    fill(220, 220, 200, 150);
    rect(0, 0, width, height);
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    text((failed?"Level not cleared.\nPress 'r' to restart":"Level cleared.\npress LEERTASTE fuer next Spielstufe!"), width/2, height/2);
    gameover=true;
    // friction=1e-4;
  }
  else timer=frameCount;
}

void updatePhysics() {
  float Fx=0;
  //Schwerkraft
  float Fy=gravity*mass;
  //Federn
  PVector dF0=new PVector(xKoordinate-x0,yKoordinate-y0);
  dF0.normalize();
  
  PVector dF1=new PVector(xKoordinate-x1,yKoordinate-y1);
  dF1.normalize();
  
  Fy-=spring*dF0.y*dist(xKoordinate,yKoordinate,x0,y0);
  Fx-=spring*dF0.x*dist(xKoordinate,yKoordinate,x0,y0);
  Fy-=spring*dF1.y*dist(xKoordinate,yKoordinate,x1,y1);
  Fx-=spring*dF1.x*dist(xKoordinate,yKoordinate,x1,y1);
  //Reibung
  Fy-=friction*vy;
  Fx-=friction*vx;
  //v=v0+a*t=F*t/m
  vy+=Fy*deltat/mass;
  vx+=Fx*deltat/mass;
  //s=s0+v*t
  yKoordinate+=vy*deltat;
  xKoordinate+=vx*deltat;
}

void prepareSpielFeld() {
  spielFeldGroesse=width;
  xSize=spielFeldGroesse/25;
  ySize=spielFeldGroesse/25;
}

void reset() {
  xCoords=new int[level*level];
  yCoords=new int[level*level];
  for (int i=0;i<level;i++) {
    for (int j=0;j<level;j++) {
      xCoords[level*i+j]=j+1;
      yCoords[level*i+j]=i+1;
    }
  }
  for (int i=0;i<level*level;i++) {
    xCoords[i]=xCoords[i]*spielFeldGroesse/(level+1);
    yCoords[i]=yCoords[i]*spielFeldGroesse/(level+1);
  }
  anchorSize=spielFeldGroesse/(2*(level+1));
  anchorState=new int[level*level];
  int oneCount=0;
  while (oneCount<1) {
    for (int i=0;i<anchorState.length;i++) {
      anchorState[i]=round(random(2)+1);
      if (anchorState[i]==1)oneCount+=1;
      while (anchorState[i]==2) anchorState[i]=round(random(2)+1);
    }
  }
  xKoordinate=150;
  yKoordinate=10;

  //Ankerpunkt erste Feder
  x0=xKoordinate-20;
  y0=yKoordinate-30;

  //Ankerpunkt zweite Feder
  x1=xKoordinate+20;
  y1=yKoordinate-30;

  //Startgeschwindigkeit
  vx=0f;
  vy=0f;
  gameover=false;
  failed=false;
}

void keyTyped() {
  if (key=='r'){reset();}
  if(key=='0'){level=1;reset();}
  //  if ("123456789".contains(""+key)){level=key-48;reset();}
  //  if(key=='0'){level=10;reset();}
  if ((key=='n' || key==' ') && gameover&&!failed) {
    level++;
    reset();
  }
  if (key=='q')exit();
}


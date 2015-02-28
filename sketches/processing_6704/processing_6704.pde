
// Alarm - stelle 10 Spiegel so ein, dass der 
// Laserstrahl von allen Spiegeln reflektiert wird und
// zum Laser zurückkehrt.
// beliebige Taste: Probeschuss mit Laser
// Mausclick: dreht Spiegel unter der Maus.
// Abel Dewitz, 2009

int richtung[][];
int spiegel[][];
int zahl=10;//zahl der spiegel
int laserx=0;
int lasery=0;
int laserdir=0;
int delta=50; //rastergröße
int level=1;
int max_shots=10;
int max_level=8;
int shots=0;
int rekursion=0;
final int mirr_no=1;
final int mirr_n=2;
final int mirr_nw=3;
final int mirr_w=4;
final int mirr_ono=5;
final int beam_w=1;
final int beam_s=2;
final int beam_o=3;
final int beam_n=4;
final int beam_no=5;
final int beam_so=6;
final int beam_sw=7;
final int beam_nw=8;
PFont arial;
boolean richtig=false;
boolean intro_shown=false;
color spieg_col= color(100,120,200);
color licht_col=color(200,200,100);
color back_col=color(50,50,50);


void setup(){//---------------------------------------------------------------------SETUP
  size(600,600);
  spiegel=new int[10][4];
  arial=loadFont("ArialMT-14.vlw");
  textFont(arial);
  newlevel(level);
  richtungdef();
  
   rectMode(CENTER);
  
}//----------------------------------------------------SETUP_ENDE

void draw(){//-----------------------------------------------------------------------------DRAW
println(level);
  if(level<8){
    background(back_col);
   rekursion=0;
   zeichnelaser();
  for(int i=0;i<10;i++){
    zeichnespiegel(i);
  }
  show_shots();
  if(mousePressed==true){
    mauswahl();
  }
  if(keyPressed==true){
    check_shots();
    strahl(laserx*delta,lasery*delta,laserdir);
  }
  if(intro_shown==false){
    intro();
    intro_shown=true;
  }
  }else{goodbye();}
}//----------------------------------------------------------DRAW ENDE

void intro(){//------------------------------------------------------------------------INTRO
  background(200);
  fill(0);
  text("Willkommen! Baue mit den 10 Spiegeln und dem Laser", 50, 50);
  text("ein Alarmsystem mit Lichtschranke.", 50,80);
  text ("Der Lichtstrahl muss alle Spiegel treffen und zum Laser zurückkehren.",50,110);
  text ("Klicke mit der Maus auf einen Spiegel und er dreht sich.",50,140);
  text ("Drücke eine Taste und der Laser arbeitet. Du hast nur wenige Versuche!",50,170);
  text ("Sieben Level warten auf Dich.    Starte mit einem Mausklick!",50, 200);
  text("Welcome! Build an alarm system", 50, 300);
  text("with light barrier.", 50,330);
  text ("The beam has to hit all the mirrors and go back to the laser.",50,360);
  text ("Click with the mouse at a mirror and it will turn.",50,390);
  text ("Press a key and the laser starts to work! You have got only few tests free.",50,420);
  text ("Seven levels are waiting for you.    Start with a mouseclick!",50, 450);
  noLoop();
 }

void check_shots(){//-----------------------------------------------------------------CHECK_SHOTS
  // println(shots+"  "+max_shots);
  if(shots>max_shots){
      newlevel(level);
      shots=0;
      noLoop();
    }
}

//-----------------------------------------------------------------------------------------SHOW_SHOTS
void show_shots(){//zeigt an, wie viele Schüsse in diesem level noch frei sind.
  strokeWeight(4);
  stroke(150,200,0);
  for(int i=0;i<max_shots;i++){
    line(10+i*5, 580, 10+i*5,570);
  }
  stroke(200,20,50);
  for(int i=0;i<shots-1;i++){
    line(10+i*5, 580, 10+i*5,570);
  }
  fill(255);
  text("Level "+level,10,565);
}//-------------------------------------------------------ENDE SHOWSHOTS

void richtungdef(){ //----------------------------------------------------------------------------  RICHTUGNGDEF    
  richtung=new int[6][9];//DEFINIERT, WIE JE NACH SPIEGELSTELLUNG UND EINFALLSRICHTUNG REFLEKTIERT WIRD
  //erster index: spiegelstellung 1=45 Grad rechts,
  //2=senkrecht, 3=45Grad links, 4= quer
  // zweiter index: Richtung Lichtstrahl 1= nach rechts,
  // 2=von oben 3= nach links 4= von unten
  // wert: richtung des reflektierten strahls

  //----spiegel 45 grad rechts
  richtung[mirr_no][beam_w]=beam_s;
  richtung[mirr_no][beam_s]=beam_w;
  richtung[mirr_no][beam_o]=beam_n;
  richtung[mirr_no][beam_n]=beam_o;
  richtung[mirr_no][beam_no]=beam_no;
  richtung[mirr_no][beam_so]=beam_nw;
  richtung[mirr_no][beam_sw]=beam_sw;
  richtung[mirr_no][beam_nw]=beam_so;
  //----spiegel senkrecht
  richtung[mirr_n][beam_w]=beam_o;
  richtung[mirr_n][beam_s]=beam_s;
  richtung[mirr_n][beam_o]=beam_w;
  richtung[mirr_n][beam_n]=beam_n;
  richtung[mirr_n][beam_no]=beam_nw;
  richtung[mirr_n][beam_so]=beam_sw;
  richtung[mirr_n][beam_sw]=beam_so;
  richtung[mirr_n][beam_nw]=beam_no;
  //----spiegel 45 grad nach links
  richtung[mirr_nw][beam_w]=beam_n;
  richtung[mirr_nw][beam_s]=beam_o;
  richtung[mirr_nw][beam_o]=beam_s;
  richtung[mirr_nw][beam_n]=beam_w;
  richtung[mirr_nw][beam_no]=beam_sw;
  richtung[mirr_nw][beam_so]=beam_so;
  richtung[mirr_nw][beam_sw]=beam_no;
  richtung[mirr_nw][beam_nw]=beam_nw;
  //-----spiegel waagerecht
  richtung[mirr_w][beam_w]=beam_w;
  richtung[mirr_w][beam_s]=beam_n;
  richtung[mirr_w][beam_o]=beam_o;
  richtung[mirr_w][beam_n]=beam_s;
  richtung[mirr_w][beam_no]=beam_so;
  richtung[mirr_w][beam_so]=beam_no;
  richtung[mirr_w][beam_sw]=beam_nw;
  richtung[mirr_w][beam_nw]=beam_sw;
  //-----spiegel 22,5 Grad aus der waagerechten gegen uhrzeigersinn
  richtung[mirr_ono][beam_w]=beam_sw;
  richtung[mirr_ono][beam_s]=beam_nw;
  richtung[mirr_ono][beam_o]=beam_no;
  richtung[mirr_ono][beam_n]=beam_so;
  richtung[mirr_ono][beam_no]=beam_o;
  richtung[mirr_ono][beam_so]=beam_n;
  richtung[mirr_ono][beam_sw]=beam_w;
  richtung[mirr_ono][beam_nw]=beam_s;
}//------------------------------------------ENDE  RICHTUGNGDEF 

void check(){//-----------------------------------------------------CHECK (wird von void STRAHL aufgerufen)
  richtig=true;
  for(int i=0;i<10;i++){
    if(spiegel[i][2]!=spiegel[i][3]){//aktuelle Spiegelstellung und Lösung stimmen nicht überein
      richtig=false;
     }
     println( "checken der spiegel: "+"i "+i + " richtig "+richtig);
  }
    if(richtig==true){//alle spiegel stehen richtig
    level=constrain(level+1,0,max_level+1);
    println("neuer level!");
    newlevel(level);
    noLoop();//warten, bis der Finger von der Taste runter ist
  }
}//----------------------------------END CHECK

void keyReleased(){//-------------------------------------------------KEY RELEASED
  loop();
  delay(200);
  shots++;
}//----------------------------------------END KEYRELEASED
void mouseReleased(){
  loop();
  delay(100);
}


void strahl(int x,int y,int richt){//--------------------------------DRAW THE BEAM AND REFLECT:
  rekursion=rekursion+1;
  strokeWeight(1);
  stroke(licht_col);
  int richtx=1;
  int richty=1;
  int richtneu=1;
  switch(richt){
  case beam_w:
    richtx=-1;
    richty=0;
    break;
  case beam_s:
    richtx=0;
    richty=1;
    
    break;
  case beam_o:
    richtx=1;
    richty=0;
    break;
  case beam_n:
    richtx=0;
    richty=-1;
    
    break;
  case beam_no:
    richtx=1;
    richty=-1;
    break;
  case beam_so:
    richtx=1;
    richty=1;
    break;
  case beam_sw:
    richtx=-1;
    richty=1;
    break;
  case beam_nw:
    richtx=-1;
    richty=-1;
    break;
  }
  x=x+3*richtx;//den spiegelbereich verlassen, um nicht eingefangen zu werden
  y=y+3*richty;
  while(get(x+richtx,y+richty)!=spieg_col&&0<x&&0<y&&x<width&&y<height){
    line(x,y,x+richtx,y+richty);
    x=x+richtx;
    y=y+richty;
  }
  if(get(x+richtx,y+richty)==spieg_col){//nur wenn spiegel getroffen, nicht wenn bild verlassen
    int xx=(round((x+10)/delta));//xx und yy sind die positionen des spiegels im raster von 0 bis 12
    int yy=(round((y+10)/delta));//falls y knapp unter dem runden wert liegt: +10, damit das abrunden genau hinhaut
    for(int i=0;i<10;i++){
      if(spiegel[i][0]==xx&& spiegel[i][1]==yy){
        richtneu=spiegel[i][2];//richtung des getroffenen spiegels
      }
    }
    richtneu=richtung[richtneu][richt];//richtung des reflekt. strahls
    if (rekursion<12){//es geht weiter mit dem reflektieren
                 strahl(delta*xx,delta*yy,richtneu);
    }//-----neuer Strahl als rekursiver Aufruf
    println(rekursion);
    if(rekursion==12||rekursion==11){//je nachdem, ob der strahl nach dem laser noch einen spiegel trifft oder ins leere geht
      
      check();
    }
  }
} 

void zeichnelaser()//-------------------------------------------------------ZEICHNELASER
{
  fill(250,0,0);
  stroke(250,0,0);
  strokeWeight(2);
  rect(laserx*delta,lasery*delta,5,5);
  switch(laserdir){
  case beam_w:
    line(laserx*delta,lasery*delta,laserx*delta-10,lasery*delta);
    break;
  case beam_s:
    line(laserx*delta,lasery*delta,laserx*delta,lasery*delta+10);
    break;
  case beam_o:
    line(laserx*delta,lasery*delta,laserx*delta+10,lasery*delta);
    break;
  case beam_n:
    line(laserx*delta,lasery*delta,laserx*delta,lasery*delta-10);
    break;
  case beam_no:
    line(laserx*delta,lasery*delta,laserx*delta+10,lasery*delta-10);
    break;
  case beam_so:
    line(laserx*delta,lasery*delta,laserx*delta+10,lasery*delta+10);
    break;
  case beam_sw:
    line(laserx*delta,lasery*delta,laserx*delta-10,lasery*delta+10);
    break;
  case beam_nw:
    line(laserx*delta,lasery*delta,laserx*delta-10,lasery*delta-10);
    break;
  }
}//---------------------------------------ZEICHNELASER ENDE

void zeichnespiegel(int index){//---------------------------------------------------ZEICHNESPIEGEL
  int x,y;
  x=spiegel[index][0]*delta;
  y=spiegel[index][1]*delta;
  stroke(spieg_col);
  strokeWeight(2);
  fill(255);
 // text("x:"+x/50+" y:"+y/50,x-50,y+20);
 // text("richtung: "+spiegel[index][2]+"soll:"+spiegel[index][3],x-120,y);
  switch(spiegel[index][2]){
  case mirr_no:
    line(x-10,y+8,x+10,y-12);
    break;
  case mirr_n:
    line(x-1,y+15,x-1,y-15);// "-1", damit der Strahl am Spiegel vorbei kann
    break;
  case mirr_nw:
    line(x-10,y-8,x+10,y+12);
    break;
  case mirr_w:
    line(x-15,y-1,x+15,y-1);
    break;
  case mirr_ono:
   line(x-14,y+5.4,x+14,y-5.4);
   break;
   
  }
}//----------------------------------ZEICHNESPIEGEL ENDE

void mauswahl(){//------------------------------------------------------------------MAUSWAHL
  int x,y,
  index=-1;//das bedeutet: keine Spiegel an dieser Stelle
  x=round((mouseX+20)/delta);
  y=round((mouseY+20)/delta);
  stroke(0,255,255);
  strokeWeight(1);
  line(delta*x-4,delta*y,delta*x+4,delta*y);
  line(delta*x,delta*y-4,delta*x, delta*y+4);
  for(int i=0;i<10;i++){
    if(spiegel[i][0]==x&& spiegel[i][1]==y){
      index=i;//spiegel gefunden
    }
  }
  if(index>=0&&keyPressed==false){//spiegel nur drehen, wenn laser nicht an ist.
    delay(300);
    spiegel[index][2]=1+spiegel[index][2];
    if(spiegel[index][2]==6){
      spiegel[index][2]=1;
    }
  }
}
void newlevel(int level_){//---------------------------------------------------------NEWLEVEL
  //die spiegel
  //erster Index: nummer des spiegels
  //zweiter Indes: xposition(mal delta!),yposition (s.o.)
  //und spiegelstellung ( 1 bis 4) sowie lösungsposition
  shots=0;
  switch(level_){
  case 1:
    max_shots=10;
    shots=1;
    laserx=1;
    lasery=6;
    laserdir=4;
    back_col=color(50,50,50);
    spiegel[0][0]= 1;  //x
    spiegel[0][1]= 2 ; //y
    spiegel[0][2]=floor(random(1,4.99));  //stellung
    spiegel[0][3]=1;
    spiegel[1][0]= 4;  //x
    spiegel[1][1]= 2;  //y
    spiegel[1][2]=floor(random(1,4.99));  //stellung
    spiegel[1][3]=3;
    spiegel[2][0]= 4;  //x
    spiegel[2][1]=  4; //y
    spiegel[2][2]=floor(random(1,4.99));  //stellung
    spiegel[2][3]=3;
    spiegel[3][0]= 8;  //x
    spiegel[3][1]=  4; //y
    spiegel[3][2]=floor(random(1,4.99));  //stellung
    spiegel[3][3]=1;
    spiegel[4][0]= 8;  //x
    spiegel[4][1]=  3; //y
    spiegel[4][2]=floor(random(1,4.99));  //stellung
    spiegel[4][3]=1;
    spiegel[5][0]= 11;  //x
    spiegel[5][1]=  3; //y
    spiegel[5][2]=floor(random(1,4.99));  //stellung
    spiegel[5][3]=3;
    spiegel[6][0]= 11;  //x
    spiegel[6][1]= 10;  //y
    spiegel[6][2]=floor(random(1,4.99));  //stellung
    spiegel[6][3]=1;
    spiegel[7][0]= 6;  //x
    spiegel[7][1]=  10; //y
    spiegel[7][2]=floor(random(1,4.99));  //stellung
    spiegel[7][3]=3;
    spiegel[8][0]= 6;  //x
    spiegel[8][1]= 8;  //y
    spiegel[8][2]=floor(random(1,4.99));  //stellung
    spiegel[8][3]=3;
    spiegel[9][0]= 1;  //x
    spiegel[9][1]=  8; //y
    spiegel[9][2]=floor(random(1,4.99));  //stellung
    spiegel[9][3]=3;
    break;

  case 2:
    max_shots=8;
    laserx=3;
    lasery=6;
    laserdir=1;
    licht_col=color(255,100,0);
    back_col=color(60,30,0);
    spiegel[0][0]= 5;  //x
    spiegel[0][1]= 6 ; //y
    spiegel[0][2]=floor(random(1,4.99));  //stellung
    spiegel[0][3]=1;
    spiegel[1][0]= 5;  //x
    spiegel[1][1]= 1;  //y
    spiegel[1][2]=floor(random(1,4.99));  //stellung
    spiegel[1][3]=1;
    spiegel[2][0]= 7;  //x
    spiegel[2][1]=  1; //y
    spiegel[2][2]=floor(random(1,4.99));  //stellung
    spiegel[2][3]=3;
    spiegel[3][0]= 7;  //x
    spiegel[3][1]=  11; //y
    spiegel[3][2]=floor(random(1,4.99));  //stellung
    spiegel[3][3]=3;
    spiegel[4][0]= 10;  //x
    spiegel[4][1]=  11; //y
    spiegel[4][2]=floor(random(1,4.99));  //stellung
    spiegel[4][3]=1;
    spiegel[5][0]= 10;  //x
    spiegel[5][1]=  8; //y
    spiegel[5][2]=floor(random(1,4.99));  //stellung
    spiegel[5][3]=3;
    spiegel[6][0]= 5;  //x
    spiegel[6][1]= 8;  //y
    spiegel[6][2]=floor(random(1,4.99));  //stellung
    spiegel[6][3]=1;
    spiegel[7][0]= 5;  //x
    spiegel[7][1]=  10; //y
    spiegel[7][2]=floor(random(1,4.99));  //stellung
    spiegel[7][3]=1;
    spiegel[8][0]= 1;  //x
    spiegel[8][1]= 10;  //y
    spiegel[8][2]=floor(random(1,4.99));  //stellung
    spiegel[8][3]=3;
    spiegel[9][0]= 1;  //x
    spiegel[9][1]=  6; //y
    spiegel[9][2]=floor(random(1,4.99));  //stellung
    spiegel[9][3]=1;
    break;
    
  case 3:
    max_shots=6;
    back_col=color(20,50,20);
    licht_col=color(255,100,200);
    laserx=9;
    lasery=8;
    laserdir=8;
    spiegel[0][0]= 8;  //x
    spiegel[0][1]= 7 ; //y
    spiegel[0][2]=floor(random(1,4.99));  //stellung
    spiegel[0][3]=4;
    spiegel[1][0]= 6;  //x
    spiegel[1][1]= 9;  //y
    spiegel[1][2]=floor(random(1,4.99));  //stellung
    spiegel[1][3]=4;
    spiegel[2][0]= 1;  //x
    spiegel[2][1]=  4; //y
    spiegel[2][2]=floor(random(1,4.99));  //stellung
    spiegel[2][3]=2;
    spiegel[3][0]= 4;  //x
    spiegel[3][1]=  1; //y
    spiegel[3][2]=floor(random(1,4.99));  //stellung
    spiegel[3][3]=4;
    spiegel[4][0]= 6;  //x
    spiegel[4][1]=  3; //y
    spiegel[4][2]=floor(random(1,4.99));  //stellung
    spiegel[4][3]=4;
    spiegel[5][0]= 8;  //x
    spiegel[5][1]=  1; //y
    spiegel[5][2]=floor(random(1,4.99));  //stellung
    spiegel[5][3]=4;
    spiegel[6][0]= 10;  //x
    spiegel[6][1]= 3;  //y
    spiegel[6][2]=floor(random(1,4.99));  //stellung
    spiegel[6][3]=2;
    spiegel[7][0]= 9;  //x
    spiegel[7][1]=  4; //y
    spiegel[7][2]=floor(random(1,4.99));  //stellung
    spiegel[7][3]=2;
    spiegel[8][0]= 12;  //x
    spiegel[8][1]= 7;  //y
    spiegel[8][2]=floor(random(1,4.99));  //stellung
    spiegel[8][3]=2;
    spiegel[9][0]= 10;  //x
    spiegel[9][1]=  9; //y
    spiegel[9][2]=floor(random(1,4.99));  //stellung
    spiegel[9][3]=4;
    break;

  case 4:
    max_shots=16;
    laserx=11;
    lasery=6;
    laserdir=4;
    licht_col=color(255,255,100);
    back_col=color(0,50,80);
    spiegel[0][0]= 3;  //x
    spiegel[0][1]= 5 ; //y
    spiegel[0][2]=floor(random(1,5.99));  //stellung
    spiegel[0][3]=1;
    spiegel[1][0]= 3;  //x
    spiegel[1][1]= 9;  //y
    spiegel[1][2]=floor(random(1,5.99));  //stellung
    spiegel[1][3]=3;
    spiegel[2][0]= 5;  //x
    spiegel[2][1]=  7; //y
    spiegel[2][2]=floor(random(1,5.99));  //stellung
    spiegel[2][3]=1;
    spiegel[3][0]= 5;  //x
    spiegel[3][1]=  9; //y
    spiegel[3][2]=floor(random(1,5.99));  //stellung
    spiegel[3][3]=1;
    spiegel[4][0]= 6;  //x
    spiegel[4][1]=  5; //y
    spiegel[4][2]=floor(random(1,5.99)); //stellung
    spiegel[4][3]=3;
    spiegel[5][0]= 6;  //x
    spiegel[5][1]=  11; //y
    spiegel[5][2]=floor(random(1,5.99));  //stellung
    spiegel[5][3]=3;
    spiegel[6][0]= 8;  //x
    spiegel[6][1]= 6;  //y
    spiegel[6][2]=floor(random(1,5.99));  //stellung
    spiegel[6][3]=1;
    spiegel[7][0]= 8;  //x
    spiegel[7][1]=  7; //y
    spiegel[7][2]=floor(random(1,5.99));  //stellung
    spiegel[7][3]=1;
    spiegel[8][0]= 11;  //x
    spiegel[8][1]= 1;  //y
    spiegel[8][2]=floor(random(1,5.99));  //stellung
    spiegel[8][3]=4;
    spiegel[9][0]= 11;  //x
    spiegel[9][1]=  11; //y
    spiegel[9][2]=floor(random(1,5.99));  //stellung
    spiegel[9][3]=1;
    break;

  case 5:
    max_shots=6;
    laserx=6;
    lasery=6;
    laserdir=3;
    back_col=color(70,50,30);
    licht_col=color(20,200,255);
    spiegel[0][0]= 3;  //x
    spiegel[0][1]= 2 ; //y
    spiegel[0][2]=floor(random(1,5.99)); //stellung
    spiegel[0][3]=1;
    spiegel[1][0]= 3;  //x
    spiegel[1][1]= 6;  //y
    spiegel[1][2]=floor(random(1,4.99));  //stellung
    spiegel[1][3]=3;
    spiegel[2][0]= 3;  //x
    spiegel[2][1]=  8; //y
    spiegel[2][2]=floor(random(1,5.99));  //stellung
    spiegel[2][3]=1;
    spiegel[3][0]= 3;  //x
    spiegel[3][1]=  11; //y
    spiegel[3][2]=floor(random(1,5.99));  //stellung
    spiegel[3][3]=3;
    spiegel[4][0]= 8;  //x
    spiegel[4][1]=  6; //y
    spiegel[4][2]=floor(random(1,4.99));  //stellung
    spiegel[4][3]=3;
    spiegel[5][0]= 8;  //x
    spiegel[5][1]=  9; //y
    spiegel[5][2]=floor(random(1,5.99)); //stellung
    spiegel[5][3]=3;
    spiegel[6][0]= 11;  //x
    spiegel[6][1]= 2;  //y
    spiegel[6][2]=floor(random(1,4.99));  //stellung
    spiegel[6][3]=3;
    spiegel[7][0]= 11;  //x
    spiegel[7][1]=  8; //y
    spiegel[7][2]=floor(random(1,5.99));  //stellung
    spiegel[7][3]=1;
    spiegel[8][0]= 11;  //x
    spiegel[8][1]= 9;  //y
    spiegel[8][2]=floor(random(1,4.99));  //stellung
    spiegel[8][3]=3;
    spiegel[9][0]= 11;  //x
    spiegel[9][1]=  11; //y
    spiegel[9][2]=floor(random(1,5.99));  //stellung
    spiegel[9][3]=1;
    break;
    
     case 6:
    
    laserx=5;
    lasery=8;
    laserdir=4;
    max_shots=10;
    back_col=color(0,50,30);
    licht_col=color(255,180,180);
    spiegel[0][0]= 1;  //x
    spiegel[0][1]= 6 ; //y
    spiegel[0][2]=floor(random(1,5.99));  //stellung
    spiegel[0][3]=2;
    spiegel[1][0]= 3;  //x
    spiegel[1][1]= 4;  //y
    spiegel[1][2]=floor(random(1,5.99));  //stellung
    spiegel[1][3]=4;
    spiegel[2][0]= 4;  //x
    spiegel[2][1]=  9; //y
    spiegel[2][2]=floor(random(1,5.99));  //stellung
    spiegel[2][3]=4;
    spiegel[3][0]= 5;  //x
    spiegel[3][1]=  5; //y
    spiegel[3][2]=floor(random(1,5.99));  //stellung
    spiegel[3][3]=1;
    spiegel[4][0]= 6;  //x
    spiegel[4][1]=  5; //y
    spiegel[4][2]=floor(random(1,5.99));  //stellung
    spiegel[4][3]=5;
    spiegel[5][0]= 8;  //x
    spiegel[5][1]=  3; //y
    spiegel[5][2]=floor(random(1,4.99));  //stellung
    spiegel[5][3]=5;
    spiegel[6][0]= 11;  //x
    spiegel[6][1]= 3;  //y
    spiegel[6][2]=floor(random(1,4.99));  //stellung
    spiegel[6][3]=3;
    spiegel[7][0]= 11;  //x
    spiegel[7][1]=  10; //y
    spiegel[7][2]=floor(random(1,5.99));  //stellung
    spiegel[7][3]=5;
    spiegel[8][0]= 9;  //x
    spiegel[8][1]= 8;  //y
    spiegel[8][2]=floor(random(1,5.99));  //stellung
    spiegel[8][3]=4;
    spiegel[9][0]= 8;  //x
    spiegel[9][1]=  9; //y
    spiegel[9][2]=floor(random(1,4.99));  //stellung
    spiegel[9][3]=4;
    break;
    
    case 7:
    
    laserx=9;
    lasery=7;
    laserdir=2;
    max_shots=10;
    back_col=color(40,0,20);
    licht_col=color(0,255,0);
    spiegel[0][0]= 1;  //x
    spiegel[0][1]= 3 ; //y
    spiegel[0][2]=floor(random(1,5.99));  //stellung
    spiegel[0][3]=5;
    spiegel[1][0]= 1;  //x
    spiegel[1][1]= 6;  //y
    spiegel[1][2]=floor(random(1,5.99));  //stellung
    spiegel[1][3]=3;
    spiegel[2][0]= 4;  //x
    spiegel[2][1]=  10; //y
    spiegel[2][2]=floor(random(1,5.99));  //stellung
    spiegel[2][3]=2;
    spiegel[3][0]= 5;  //x
    spiegel[3][1]=  11; //y
    spiegel[3][2]=floor(random(1,5.99));  //stellung
    spiegel[3][3]=4;
    spiegel[4][0]= 6;  //x
    spiegel[4][1]=  8; //y
    spiegel[4][2]=floor(random(1,5.99));  //stellung
    spiegel[4][3]=2;
    spiegel[5][0]= 8;  //x
    spiegel[5][1]=  6; //y
    spiegel[5][2]=floor(random(1,4.99));  //stellung
    spiegel[5][3]=5;
    spiegel[6][0]= 8;  //x
    spiegel[6][1]= 8;  //y
    spiegel[6][2]=floor(random(1,4.99));  //stellung
    spiegel[6][3]=4;
    spiegel[7][0]= 9;  //x
    spiegel[7][1]=  1; //y
    spiegel[7][2]=floor(random(1,5.99));  //stellung
    spiegel[7][3]=5;
    spiegel[8][0]= 9;  //x
    spiegel[8][1]= 9;  //y
    spiegel[8][2]=floor(random(1,5.99));  //stellung
    spiegel[8][3]=5;
    spiegel[9][0]= 11;  //x
    spiegel[9][1]=  3; //y
    spiegel[9][2]=floor(random(1,4.99));  //stellung
    spiegel[9][3]=2;
    break;
    
    case 8:
      goodbye();
    break;
  }
}//-----------------------------------------------------------END NEWLEVEL

void goodbye(){//------------------------------------------------------------------------INTRO
  background(200);
  fill(0);
  text("Geschafft!", 50, 50);
  text("Du hast alle sieben Level gelöst.", 50,80);
  
  text("Well done! ", 50, 300);
  text("You finished all the seven levels.", 50,330);

  noLoop();
 }










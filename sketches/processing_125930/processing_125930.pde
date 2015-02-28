

//Definition der Schrift-Variabel

String myText = "BASELINE !";
int x = 230;
int y = 0;
int z = 0;
int w = 0;
int v = 40;
int o = 20;

//Definition Boolean für Klickwechsel

boolean click = false;

//Laden einer Schriftart

void setup() {
  size(420, 400);
  PFont myFont = loadFont( "OratorStd-48.vlw");
  textFont(myFont, 48);
}

// 

void draw() {
  background(0);
  frameRate(20);

  if (click == true) {  
    
    //Flackereffekt Schrift

    fill(random(0, 255));
    text(myText, 80, x);
    
    //Animation Der Beatbalken
    
    if ((x==230) || (x<=251)) { x=x+7; }
    if (x==258) { x=x-28; }

    if ((y==0) || (y>-75)) { y=y-10; }
    if (y==-80) { y=y+80; }

    if ((z==0) || (z>-55)) { z=z-10; }
    if (z==-60) { z=z+60; }
    
    if ((w==0) || (w>-35)) { w=w-10; }
    if (w==-40) { w=w+40; }

    fill(0, (random(0, 255)), 0);
    rect(30, 250, 5, w);
    fill(0, (random(0, 255)), 0);
    rect(40, 250, 5, z);
    fill(0, (random(0, 255)), 0);
    rect(50, 250, 5, y);

    fill(0, (random(0, 255)), 0);
    rect(360, 250, 5, y);
    fill(0, (random(0, 255)), 0);
    rect(370, 250, 5, z);
    fill(0, (random(0, 255)), 0);
    rect(380, 250, 5, w);

    //Animation der Bassbox

    frameRate(15);
    fill(random(150, 255));
    ellipse(210, 140, 70, 70);
    
    fill(0);
    if ((v==40) || (v<=60)) { v=v+5; }
    if (v==65) { v=v-25; }
    ellipse(210, 140, v, v);
    
    fill(random(0, 255));
    if ((o==20) || (o<=25)) { o=o+1; }
    if (o==26) { o=o-6; }
    ellipse(210, 140, o, o);
    
    //Playzeichen
    
    fill(255);
    triangle(190, 300, 190, 340, 230, 320);
    
  } else {
    
    //Pausenteichen

    fill(255);
    rect(190, 300, 15, 40);
    rect(210, 300, 15, 40); }
}

  //Erstellen von Klickwechsel

  void mousePressed() {
  click = !click; }

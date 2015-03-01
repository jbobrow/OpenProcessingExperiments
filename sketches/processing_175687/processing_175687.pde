
PFont schlot;
PFont  wasser;
PFont  schiff;
PFont berg1;
PFont berg2;
PFont berg3;
void setup() 
{
schlot = createFont("FiraSans-Regular.ttf", 5, true);
wasser = createFont("FiraSans-Regular.ttf", 50, true);
schiff = createFont("FiraSans-Regular.ttf", 13, true);
berg1 = createFont("FiraSans-Regular.ttf", 10, true);
berg2 = createFont("FiraSans-Regular.ttf", 7, true);
berg3 = createFont("FiraSans-Regular.ttf", 5, true);
  size (500, 250);
}

void draw()

{
  background(22, 31, 90);



  pushMatrix();
  translate(mouseX+sin(millis()/100.0), height-50+sin(millis()/100.0));

  pushMatrix();
  
  fill(234, 213, 154);
   textFont(schlot);
  textAlign(CENTER, CENTER);
   text("Schlot",10, -5);
  text("Schlot",10, -9);
   text("Schlot",10, -13);
    text("Schlot",10, -17);
   
text("Schlot",28, -5);
text("Schlot",28,-9);
text("Schlot",28,-13);
text("Schlot",28,-17);
  text("Schlot",47, -5);
text("Schlot",47,-9);
text("Schlot",47,-13);
text("Schlot",47,-17);
 text("Schlot",65, -5);
text("Schlot",65,-9);
text("Schlot",65,-13);
text("Schlot",65,-17);
 textFont(schlot);
  textAlign(CENTER, CENTER); 
  fill(0);
 textFont(schlot);
  textAlign(CENTER, CENTER); 
   text("Schlot",10, -20);
   text("Schlot",28, -20);
   text("Schlot",47, -20);
   text("Schlot",65, -20);
   textFont(schiff);
text("SCHIFF SCHIFF",37,2);
 
  fill(227, 44, 27);
  text("SCHIFF SCHIFF",37,10);

  popMatrix();
  popMatrix();

  //ICEBÃ�RG

  pushMatrix();
  translate(-mouseX+sin(millis()/100.0), height-50+sin(millis()/100.0));

  pushMatrix();
  fill(149,242,241);
  textFont(berg1);
  textAlign(CENTER, CENTER);
  text("EISBERG",660,10);
  text("EISBERG",660,0);
  textFont(berg2);
  textAlign(CENTER, CENTER);
  text("EISBERG",660,-8);
  textFont(berg3);
  textAlign(CENTER, CENTER);
  text("EISBERG",660,-15);
  text("EISBERG",660,-21);
  fill(255);
   textFont(berg1);
  textAlign(CENTER, CENTER);
  text("EISBERG",630,10);
  textFont(berg2);
  textAlign(CENTER, CENTER);
  text("EISBERG",630,3);
  text("EISBERG",630,-4);
  textFont(berg3);
  textAlign(CENTER, CENTER);
  text("EISBERG",630,-10);
  
  
//text
//text
  
  popMatrix();
  popMatrix();

  pushMatrix();
  for (int i=0; i<width+10; i+=130)
  {
    //float flut = map(mouseX, 100, 200, 200, 400);
    fill(106, 152, 188);
    noStroke();
    float welle = sin(millis()/70.0+i)+10;
    //fill(234, 213, 154);
   textFont(wasser);
   textAlign(CENTER, CENTER);
    text("WASSER",i+welle,height-30);
    //ellipse(i, height, welle+46, welle+66);
  }
  popMatrix();

  if (mouseX >=300) {
    translate(0, 0);
    fill(0);
    rect(0, 0, 500, 250);
    fill(255);
    textFont(font_fira);
    textAlign(CENTER, CENTER);
    //text("Diese Szene wurde als unangemessen eingestuft und ist für die Öffentlichkeit nicht geeignet!", width/2, height/2);
    text("Diese Szene ist in Ihrem Land nicht verfügbar", width/2, height/2-60);
    text("da die GEMA die erforderlichen", width/2, height/2-30);
    text("Rechte nicht eingeräumt hat!", width/2, height/2-00);
    text("Das tut uns leid. Nicht.", width/2, height/2+30);
    text("(auch wenn das gar nichts mit Musik zu tun hat)", width/2, height/2+60);
  }
  
}

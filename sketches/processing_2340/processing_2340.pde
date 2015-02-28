
int anzahl = 80;              //Anzahl der Felder
int a = 0, b = 255, c = 0;    //Farben

void setup() {
  
  size(400, 400);
  background(0);
  fill(255, 0, 0);
  frameRate(24);


}

void draw() {
  
 for(int i = 0;i<anzahl;i++) {            //Erzeugung der Farbpunkte
   for (int j = 0;j<anzahl;j++) {
     fill(random(a), random(b), random(c));
     noStroke();
     rect(i*(width/anzahl), j*(height/anzahl), (width/anzahl)-2, (height/anzahl)-2);
   }
 }
}
  
  
void mousePressed() {
  
  a = (int)random(255);           //Farb-Variations-Wechsel
  b = (int)random(255);
  c = (int)random(255);
}


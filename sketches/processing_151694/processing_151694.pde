
Dots dots;
PFont text1;
 
 
 
void setup() {
    size(700, 500);
    dots = new Dots(100,80,40);
    dots.process();
    text1 = loadFont ("Courier10PitchBT-Roman-48.vlw");
  
 Text();
}
 
void draw() {
}
 
 
  void mousePressed() { // To process the image every click, not while the mouse is pressed...
  dots.process();
Text();
     
}
void Text(){
    fill(255);
noStroke();
  textAlign(LEFT);
  textFont(text1, 54);
  text("PROCESSING", 50,75);
  text("Corso INTERMEDIO", 50,120 );
  textFont(text1, 24);
  text("      by MakeRn Lab", 50,150);
  textFont(text1, 20);
  text("''Computational Art / Interaction''", 50,200);
  text("27 - 28 GIUGNO", 50,225);
  text("11 - 12 LUGLIO", 50,250);
  text("ORE 19:00 - 21:00", 50,275);
  text("@ MakeRn Lab - Via Cagni, 14 - Rimini", 50,300);
  text("12 LUGLIO: PARTY DI FINE CORSO", 50,340);
    textFont(text1, 16);

  text("* Il workshop avra luogo solo se entro lunedi 23 giugno", 50,360);
  text("  si saranno raccolte almeno 10 adesioni.", 50,380);
  textFont(text1, 24);
  text("www.makern.it", 50,420);
if (mousePressed == true) {
 
    fill(255,0,0);
    noStroke();
    textFont(text1, 30);   
    text("SKILL YOURSELF!", map(mouseX,0,width,0,width-250),mouseY);
}
 
}
class Dots {
  int num, diam, dist;
 
  Dots(int num, int diam, int dist){
    this.num = num;
    this.diam = diam;
    this.dist = dist;
  }
 
 void process() {
  int myArray[][]  = new int[num][2];
  background(8, 16, 26);
 
 
  //posizione punti random a ogni pressione mouse
    for (int i = 0; i < num; i++) {
      int x = (int) random(random(0,width-50), width);
      myArray[i][0] = x;
 
      int y;
      //lasciare spazio per la visuolizzazione della scritta
      if (x >= width-200) {
          y = (int) random(random(70), height);
      }
      else {
          y = (int) random(random(height-90,height-30), height);
      }
      myArray[i][1] = y;
  }
  
  for (int i = 0; i < num; i++) {
      int x = myArray[i][0];
      int y = myArray[i][1];
      noStroke();
      fill(30, 100, 200, 40);
 
         
      float d = random(diam);
 
      ellipse(x, y, d, d);
      stroke(255);
      strokeWeight(2);
      point(x, y);
 
      strokeWeight(0.5); // The link is thinner than the point
      for (int j = i; j < num; j++) {
          int x1 = myArray[j][0];
          int y1 = myArray[j][1];
 
          // If the distance between the points is less than maxLinkDist, link them!
          if (abs(x - x1) < dist && abs(y - y1) < dist)
              line(x, y, x1, y1);
 
       
     
      }
  }
   
}
 
 
   
}//end classe

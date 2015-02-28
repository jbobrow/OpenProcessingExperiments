

int mouseClicks = 0;
PFont myFont;
 int xpos = 0;
 int upz = 400;
void setup() {
  size (1000,400);
  colorMode (HSB, 100);
  background (20, 0, 15);
  smooth ();
  noStroke();
}
  
void draw () {
    
  
  textSet();
  
  if (mouseClicks == 0) {
    background (20,0,15);
    textAlign (CENTER);
    text ("alias", 500,200);
  }
  else if (mouseClicks == 1) {
    background (20,0,15);
    text ("now   excepting    mastercard", 100, 100);
  }
  else if (mouseClicks == 2) {
     background (20,0,15);
    fill (0, 0, 30, 20);
    text ("and", 300, 200);
  }
  else if (mouseClicks == 3) {
    background (20,0,15);
    fill (0, 0, 100);
    text ("sakis", 400, 200);
  }
  else if (mouseClicks == 4) {
    background (20,0,15);
    fill (0, 0, 100);
    text ("But", 200, 100);
  }
   
  else if (mouseClicks == 5) {
    background (20,0,15);
    fill (0, 0, 100);
    text ("for rent", 400, 200);
  }
  else if (mouseClicks == 6) {
    background (20,0,15);
    fill (0, 0, 100);
    xpos++;
    text("club foot center", xpos, 400, 200); // move accorrs the screen
     
     //rect(reach,50,50,50);
  }
   
  else if (mouseClicks == 7) {
    background (20,0,15);
    fill (random(100));
    text ("the pheonix", 400, 200); // blink random
  }
  else if (mouseClicks == 8) {
    background (20,0,15);
    fill (0,0,100);
    text ("small point cafe", 500, 200);
  }
   
  else if (mouseClicks == 9) {
    background (20,0,15);
    fill (0,0,100);
    text ("modern love", 100, 200);
  }
  else if (mouseClicks == 10) {
    background (20,0,15);
    fill (0,0,100);
    text ("teriyaki korean house", 150, 200);
  }
   
   else if (mouseClicks == 11) {
    background (20,0,15);
    fill (0,0,100);
    text ("12345                                          coffee", 600, 200);
  }
   
   else if (mouseClicks == 12) {
    background (20,0,15);
    fill (0,0,100);
    text ("pick your feet up kid", 600, 200);
  }
  else if (mouseClicks == 13) {
    background (20,0,15);
    fill (0,0,100);
    text ("smoke free area", 50, 50);
  }
   
  else if (mouseClicks == 14) {
    background (20,0,15);
    fill (random(100));
    text ("rhode island hospitol trust company", 300, 50); //blink
  }
   
  else if (mouseClicks == 15) {
    background (20,0,15);
    fill (0,0,100);;
    text ("york & sawyer", 300,150);
  }
  else if (mouseClicks == 16) {
    background (20,0,15);
    fill (0,0,100);
    text ("UPS", 500, 200);
  }
   
   else if (mouseClicks == 17) {
    background (20,0,15);
    fill (random(100));
    text ("one financial plaza", 700, 350); //blink
  }
    
  else if (mouseClicks == 18) {
    background (100);
    fill (0,0,0);
    text ("textron", 700, 350);
  }
   
   else if (mouseClicks == 19){
    background (0);
    fill (0,0,100);
   upz--;
    text ("edwards wildman", 500,upz, 300); // moving up and disabear...
  }
}
  
  
  
  
  
  
  
  
  
  void keyPressed () {
  save ("drawing.jpg");
}
  
void mousePressed() {
  mouseClicks ++;
}
  
void textSet() {
  myFont = createFont("Futura-Medium",40);
  textFont(myFont);
}




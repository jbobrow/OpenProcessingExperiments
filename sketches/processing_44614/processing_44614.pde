
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
    text ("Hugs and Kisses", 500,200);
  }
  else if (mouseClicks == 1) {
    background (20,0,15);
    text ("H   u   g  s", 100, 100);
  }
  else if (mouseClicks == 2) {
     background (20,0,15);
    fill (0, 0, 30, 20);
    text ("and", 300, 200);
  }
  else if (mouseClicks == 3) {
    background (20,0,15);
    fill (0, 0, 100); 
    text ("Kisses from afar", 400, 200);
  }
  else if (mouseClicks == 4) {
    background (20,0,15);
    fill (0, 0, 100); 
    text ("But", 200, 100);
  }
  
  else if (mouseClicks == 5) {
    background (20,0,15);
    fill (0, 0, 100); 
    text ("what i had hope was to", 400, 200);
  }
  else if (mouseClicks == 6) {
    background (20,0,15);
    fill (0, 0, 100); 
    xpos++;
    text("reach", xpos, 400, 200); // move accorrs the screen 
    
     //rect(reach,50,50,50);
  }
  
  else if (mouseClicks == 7) {
    background (20,0,15);
    fill (random(100)); 
    text ("a Start", 400, 200); // blink random 
  }
  else if (mouseClicks == 8) {
    background (20,0,15);
    fill (0,0,100); 
    text ("But", 500, 200); 
  }
  
  else if (mouseClicks == 9) {
    background (20,0,15);
    fill (0,0,100); 
    text ("our distance", 100, 200); 
  }
  else if (mouseClicks == 10) {
    background (20,0,15);
    fill (0,0,100); 
    text ("was", 150, 200); 
  }
  
   else if (mouseClicks == 11) {
    background (20,0,15);
    fill (0,0,100); 
    text ("too                                              far", 600, 200); 
  }
  
   else if (mouseClicks == 12) {
    background (20,0,15);
    fill (0,0,100); 
    text ("we couldn't be a part though", 600, 200); 
  }
  else if (mouseClicks == 13) {
    background (20,0,15);
    fill (0,0,100); 
    text ("for", 50, 50); 
  }
  
  else if (mouseClicks == 14) {
    background (20,0,15);
    fill (random(100)); 
    text ("start", 300, 50); //blink
  }
  
  else if (mouseClicks == 15) {
    background (20,0,15);
    fill (0,0,100);; 
    text ("only count", 300,150); 
  }
  else if (mouseClicks == 16) {
    background (20,0,15);
    fill (0,0,100); 
    text ("themselves", 500, 200); 
  }
  
   else if (mouseClicks == 17) {
    background (20,0,15);
    fill (random(100)); 
    text ("start", 700, 350); //blink
  }
   
  else if (mouseClicks == 18) {
    background (100);
    fill (0,0,0); 
    text ("when they have died", 700, 350); 
  }
  
   else if (mouseClicks == 19){
    background (0);
    fill (0,0,100);
   upz--; 
    text ("long ago", 500,upz, 300); // moving up and disabear...
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

  
  
  
  
  
  
  
  
  
  
  
  
     
  
 
  




class MyBeizer {

  boolean dodraw;

  void enableDraw() {
    this.dodraw = true;
  }

  void disableDraw() {
    this.dodraw = false;
  }

  void tryDraw() {
    if (this.dodraw) _draw();
  }

  void _draw () {
    fill (R, G, B, 50);
    stroke(random (255), random (255), random (255));
    bezier(mouseX, mouseY, mouseX, mouseY, mouseX, 500, 900/2, 450/2);
    int mouseX2 = 900 - mouseX;
    bezier(mouseX2, mouseY, mouseX2, mouseY, mouseX2, 500, 900/2, 450/2);
    
  }
}


/*Mosa_Al_Husseini
2012-02-05
*/

PFont font;

MyBeizer Beizer;
int x = 50;
int y = 50;
int w = 50;
int h = 50;
int R = 0; //Färgerna
int G = 0;
int B =0;

void setup() {
  Beizer = new MyBeizer();
  size(900, 450);
  background(0);
  smooth();
} 

void draw() {
  
  Beizer.tryDraw();
  noStroke();
  fill (83, 115, 140);
  rect (x+100, y, 50, 20); //Röd färg
  
  fill (119, 108, 140);
  rect (x+160, y, 50, 20);  //Grön Färg
  
  fill (31, 163, 97);
  rect (x+220, y, 50, 20); //Blå färg
  
  fill (140, 55, 62);
  rect (x+280, y, 50, 20); //Blå färg
  
  fill (153, 110, 16);
  rect (x+340, y, 50, 20); //Blå färg
  fill (83, 115, 140);
  //RGB
  fill (151, 34, 20);
  rect (x+100, y+60, 50, 20); //Röd färg
  fill (19, 151, 58);
  rect (x+160, y+60, 50, 20);  //Grön Färg
  fill (12, 30, 151);
  rect (x+220, y+60, 50, 20); //Blå färg
  fill (255,255,255);
  rect (x,y, 50, 20);
fill (0);
     font = loadFont ("AgencyFB-Reg-22.vlw");
   textFont (font);
   text ("SAVE", x+8,y+18);


}


void mousePressed() {

//ÖVRIGA
  //BLÅ
if ((mouseX>x+100&&mouseX<x+150) && (mouseY>y&&mouseY<y+20)) {
    R = 83;
    G = 115;
    B = 140;
  }
  //LILISH
  else if ((mouseX>x+160&&mouseX<x+210) && (mouseY>y&&mouseY<y+20)) {
    R = 119;
    G = 108;
    B = 140;
  }
  //GRÖNISH
  else if ((mouseX>x+220&&mouseX<x+270) && (mouseY>y&&mouseY<y+20)) {
    R = 31;
    G = 163;
    B = 97;
  }
  //RÖDISH
  else if ((mouseX>x+280&&mouseX<x+320) && (mouseY>y&&mouseY<y+20)) {
    R = 140;
    G = 55;
    B = 62;
  }
  //GULDIGHSH
  else if ((mouseX>x+330&&mouseX<x+380) && (mouseY>y&&mouseY<y+20)) {
    R = 153;
    G = 110;
    B = 16;
  }
  //RGB
  else if ((mouseX>x+100&&mouseX<x+150) && (mouseY>y+60&&mouseY<y+80) ) {
    R = 151;
    G = 34;
    B = 20;
  }
  //grön färg
  else if ((mouseX>x+160&&mouseX<x+210) && (mouseY>y+60&&mouseY<y+80)) {
    R = 19;
    G = 151;
    B = 58;
  }
  
  //blå färg
  else if ((mouseX>x+220&&mouseX<x+270) && (mouseY>y+60&&mouseY<y+80)) {
    R = 12;
    G = 30;
    B = 151;
  }
   //SparaKNAPPEN 

else if ((mouseX>x&&mouseX<x+50) && (mouseY>y&&mouseY<y+20)) {

saveFrame(); 
}
  else {
      Beizer.enableDraw();
  }
}

void mouseMoved(){
  Beizer.tryDraw(); 
}

void mouseReleased() {
  Beizer.disableDraw();
}
                

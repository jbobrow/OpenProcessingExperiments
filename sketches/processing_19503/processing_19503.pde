
PFont font;
int y = 20;

void setup() {
  size(250,250);
  background(100);
  smooth();
  font = loadFont("FelixTitlingMT-100.vlw");
}

void draw() {
  pushMatrix();  
  translate(125,250);
  rotate(radians(random(900)));  
  textFont(font,20);
  fill(random(100)+150,150,random(100)+150); 
  text("N0R",0,0);  
  text("1A0",0,0); 
  textFont(font,10);
  fill(150,random(100)+150,random(100)+150); 
  text("N0R",0,55);  
  text("1A0",0,55);    
  textFont(font,50);
  fill(random(100)+150,random(100)+150,150);
  text("N0R",0,100);
  text("1A0",0,100); 
  textFont(font,30);
  fill(random(100)+150,150,random(100)+150);
  text("N0R",0,180);
  text("1A0",0,180);
  textFont(font,5);
  fill(random(100)+150,random(100)+150,150);
  text("N0R",0,200);
  text("1A0",0,200);
  textFont(font,60);
  fill(150,random(100)+150,random(100)+150); 
  text("N0R",0,255);  
  text("1A0",0,255);
  popMatrix();  
  float ran = random(250); 
  {
    if (mousePressed) { 
      textFont(font,5);
      fill(0); 
      text("N",ran,y);    
      text("0",ran,y+20);    
      text("R",ran,y+40); 
      text("1",ran,y+60); 
      text("A",ran,y+80); 
      text("0",ran,y+100);
      text("N",ran,y+120);    
      text("0",ran,y+140);    
      text("R",ran,y+160); 
      text("1",ran,y+180); 
      text("A",ran,y+200); 
      text("0",ran,y+220);
      text("N",ran,y+240);
    }
  }
}



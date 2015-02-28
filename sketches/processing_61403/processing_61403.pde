
int x = 5;
float b = 80;
PFont myfont;
 
void setup(){
  size(800,800);
  background(230,230,220);

  
 
 
  myfont = loadFont("TimesNewRomanPS-BoldItalicMT-30.vlw");
}
 
void draw(){
 
 
}
 
 
void mousePressed(){
    
      fill(random(255),10,random(210));
      textSize(40);
      textFont(myfont);
 
   text("CHECK OUT OUR WEBSITE!!!:) :)",mouseX,mouseY);
  b = b-10;
  
   
}
 
void keyPressed(){
  rect(random(800),random(800),30,30);
   
}



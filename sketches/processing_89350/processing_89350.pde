
void setup() {
  size(800,600);  
   
   
}
 
void draw() {
  
 background(255);
 
 
    PFont font; 
font = loadFont("Arial-ItalicMT-30.vlw"); 
textFont(font); 
fill(9, 10, 240);
text("///// ? ? ? ", 100, 300); 
text("?//?////???? ", 400, 300); 
text("!!!!!!.... ", 600, 300); 
   
 font = loadFont("Arial-ItalicMT-12.vlw"); 
textFont(font);
fill(9, 10, 240);
text("hyperlinks into infinity", 300, 300); 

   
 drawEyes();
   
}
 
void drawEyes() {
 
  fill(9, 10, 240);
  noStroke();
  drawEye(0,400);
  drawEye(100,400);
  drawEye(200,400);
  drawEye(300,400);
  drawEye(400,400);
  drawEye(500,400);
  drawEye(600,400);
  drawEye(700,400);
  drawEye(800,400);
   
 }
 
void drawEye(float minX, float maxX) {
   
   ellipse(map(mouseX,300,500,minX,maxX), map(mouseY,0,600,250,350), 50, 50);
  
   
}



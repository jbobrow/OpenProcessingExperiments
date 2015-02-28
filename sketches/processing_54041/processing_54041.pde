
PFont myfont;
 
void setup() {
  size(800, 800);
 
  myfont = loadFont("ChaparralPro-BoldIt-90.vlw");
  textFont(myfont);
  background(255);
  colorMode(RGB, 300 ,100, 100);
  smooth();
 
  noLoop(); //prevents draw from being called continuously
}
 
void draw(){
  for (int i = 0; i < 100;i++) {  
    fill(random(36)*10, 100, 100, 150);
   
    textSize(random(10, 90));
    text("Barylick\nWestminster\nPeck\nDorrace\nPost\nCongdon", random(-50,width), random(height));
  }}
  

void mousePressed(){
 background(255);
  redraw();
}               

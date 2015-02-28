

PFont font;
//opacity
float a = 0; 
float b = 0;
float c = 0;
float d = 0;
float e = 0;
 
void setup() {
  size(250, 250);
  // type
  font = loadFont("CenturyGothic-48.vlw"); 
  smooth();
}
  
void draw() {
  background(#947f79);
  
  //speed
  frameRate(10);    
  
  //subject 
  //top
  textFont(font, 130);
  fill(255, c); 
  text("L8E2A4", -30, 80);
  
  //middle
   textFont(font, 80);
  fill(255, a); 
  text("L8E", 0, 155);
  fill(255, b); 
  text("2A4", 130, 155);
  
  //bottom
       textFont(font, 40);
  fill(255, d); 
  text("L8E 2A4 L8E 2A4", 0, 200);
     textFont(font, 40);
  fill(255, e); 
  text("L8E 2A4 L8E 2A4", 0, 245);
 
  a += 6; 
  b += 5;
  c += 7;
  d += 8;
  e += 9;
   
  //pace
    
  if(a > 100){  
     a = 0;}
     if(b > 100){
     b = 0;}
     if(c > 100){
     c = 0;}
     if(d > 100){
     d = 0;}
     if(e > 100){
     e = 0;}
}



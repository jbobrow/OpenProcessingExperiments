
PFont font;
PFont font2;
float opacitym = 0; //opacity variables
float opacitya = 0;
float opacityt = 0;
float opacityt2 = 0;
float opacityc = 0;
float opacityh = 0;
float opacitya2 = 0;
float opacityn = 0;

void setup() {
  size(600, 100);
  font = loadFont("Futura-Medium-20.vlw"); //futura
  smooth();
}
  
void draw() {
  background(20);
  textFont(font);
  frameRate(15);
  
//MATT CHAN    
  fill(255, opacitym); //colour
  text("M", 20, 50);
  fill(255, opacitya); //colour
  text("A", 43, 50);
  fill(255, opacityt); //colour
  text("T", 62, 50);
  fill(255, opacityt2); //colour
  text("T", 82, 50);
  
  fill(255, opacityc); //colour
  text("C", 120, 50);
  fill(255, opacityh); //colour
  text("H", 140, 50);
  fill(255, opacitya2); //colour
  text("A", 160, 50);
  fill(255, opacityn); //colour
  text("N", 180, 50);
  
//ACTIVITY LOG
  font2 = loadFont("Futura-Medium-10.vlw"); //futura 10
  textFont(font2);
  
  fill(255, opacityt); //colour
  text("A", 20, 70);
  fill(255, opacitya); //colour
  text("C", 30, 70);
  fill(255, opacitym); //colour
  text("T", 41, 70);
  fill(255, opacityt2); //colour
  text("I", 50, 70);
  fill(255, opacityn); //colour
  text("V", 58, 70);
  fill(255, opacityt2); //colour
  text("I", 70, 70);
  fill(255, opacityc); //colour
  text("T", 78, 70);
  fill(255, opacityh); //colour
  text("Y", 88, 70);
  fill(255, opacitya2); //colour
  text("L", 110, 70);
  fill(255, opacityn); //colour
  text("O", 117, 70);
  fill(255, opacityt2); //colour
  text("G", 127, 70);
   
  opacitym += random(30); //increasing opacity from 0 at different rates
  opacitya += random(27);
  opacityt += random(24);
  opacityt2 += random(21);
  opacityc += random(18);
  opacityh += random(15);
  opacitya2 += random(12);
  opacityn += random(9);
   
  //rates of opacity change because speed of reachign 500 varies
    
  if(opacitym > 500){  //if opacity reaches 500, change back to 0
     opacitym = 0;}
   if(opacitya > 500){
     opacitya = 0;}
   if(opacityt > 500){
     opacityt = 0;}
   if(opacityt2 > 500){
     opacityt2 = 0;}
   if(opacityc > 500){
     opacityc = 0;}
   if(opacityh > 500){
     opacityh = 0;}
   if(opacitya2 > 500){
     opacitya2 = 0;}
   if(opacityn > 500){
     opacityn = 0;}
}



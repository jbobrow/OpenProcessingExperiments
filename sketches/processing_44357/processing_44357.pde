
String txt = "Glondola";
int x = 2;
int y = 0;

PFont font;

void setup (){
  size (500, 300);
  smooth();
  font = loadFont ("SwankyandMooMoo-48.vlw");
}

void draw(){
  background(134, 78, 195, 60);
  fill(89,176,134);
  textFont (font,89);
  text(txt,y-1,150);
 
  
  y+=2;
  if(y>500){
    y-=550;
    
    
  }}


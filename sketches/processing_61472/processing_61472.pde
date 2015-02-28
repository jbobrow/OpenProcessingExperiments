
PFont a;
 
void setup(){
  size(1024,768);
smooth();
background(0);
a = loadFont("Champagne&Limousines-48.vlw");
textFont(a);
}
 
void draw(){
if(mousePressed){
  smooth();
  fill (random(50),random(170),0,random(255));
  translate(mouseX,mouseY);
  textSize(random(372));
  text ("JP",-100,0);
  text ("Levet",100,0);
  fill (255,255,255,random(255));
}
else
{
   if(keyPressed) {
    if (key == ' ') {
     background(0);
    }
   }
}
 
 
}



PFont font;
void setup(){
 size(500,500);
   font = loadFont("GillSans-Bold-400.vlw");

textAlign(CENTER);

  
  
}

void draw(){
  background(0);
  textFont(font,400);
  text(key,250,400);
  saveFrame("images/export-"+"-#####.jpeg");
 if ( frameCount >= 6000 ) {
       exit();
   }  
  
  
}



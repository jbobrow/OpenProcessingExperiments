
PFont Typo1;
PFont Typo2;

void setup(){
  size(400,400);
  background(255);
  Typo1=loadFont("Aerosmith-48.vlw");
  Typo2=loadFont("TraditionalArabic-48.vlw");
  
}

void draw(){
  
  fill(random(20),random(299),random(299));
  textFont(Typo1);
  translate(mouseX,mouseY);
  text("trololol",mouseX,mouseY);
 
  fill(random(20),random(299),random(299));
  textFont(Typo2);
  translate(mouseX,mouseY);
  text("u mad?",random(400,400),random(400,400));
}


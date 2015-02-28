
String message = "ADHD";
float x, y; 
float hr, vr;


void setup(){
  
 size(500,500); 
  PFont font = loadFont("ArialRoundedMTBold-66.vlw");
  textFont(font);
  textAlign(CENTER,CENTER);
   hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;


  x = width / 2;
  y = height / 2;
}
  
  void draw(){
background(#E1F5E6); 
  

 text("ADHD", x, y*1.5);
 fill(224,52,52);

  if (abs(mouseX - x) < hr &&
      abs(mouseY - y*1.5) < vr) {
  

text("A", random(x), random(y));
text("D", random(x), sin(y)-random(1));
text("H", x-random(1.1), random(x));
text("D", 500-random(1), random(y));

  
       
  }













}
  




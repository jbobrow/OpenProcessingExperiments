
PFont font;
String s = "M5A";
String g ="3W7";
String b ="3w7";
int sDeg = 0;
int gDeg = 0;
int bDeg = 0;


void setup(){
font = loadFont("ACaslonPro-BoldItalic-48.vlw");
textFont(font,20);
size(250,250);
smooth();
strokeWeight(3);
stroke(#657a7a);


background(#88a4a4);
}


void draw(){
  pushMatrix();
  textFont(font,34);
  translate(95,125);
  rotate(radians(sDeg));
  fill(#fd04d7,10);
  text(s,0,0);
 popMatrix();
 
 pushMatrix();
 translate (200,200);
 textFont(font,24);
 rotate(radians(gDeg));
 fill(#a1fa2d,20);
 text(g,0,0);

  popMatrix();
 
  
 pushMatrix();
 translate (200,20);
 textFont(font,45);
 rotate(radians(gDeg));
 fill(#7902fe,10);
 text(g,0,0);
 
 pushMatrix();
  translate(230,10);
   textFont(font,59);
  rotate(radians(sDeg));
  fill(#02f9fc,10);
  text(s,0,0);
 popMatrix();
 
 pushMatrix();
  translate(20,280);
   textFont(font,69);
  rotate(radians(bDeg));
  fill(#ffb30f,10);
  text(b,0,0);
 popMatrix();

  popMatrix();
 
   if(mousePressed){
     sDeg++;
   gDeg--;
   bDeg++;
   }
}                               

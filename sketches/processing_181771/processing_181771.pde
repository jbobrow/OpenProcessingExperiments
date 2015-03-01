


float mesura=20;
float mida=10;

void setup () {
  size (400,400);
  
}

void draw () {
    background (230, 240, 67);
    // ........................................cara
    fill (255,245,214);
  ellipse (mouseX,mouseY,mesura*10,mesura*10);
  //...........................................boca
  fill (242,42,42);
  fill (mouseX, 25,25);
  ellipse (mouseX, mouseY+mesura*1.5,mida/10+mouseY/10,mida/10+mouseX/10);
//.............................................ull dret
fill (255);
ellipse (mouseX+mesura+15,mouseY-mesura*1.2, mida*3 , mida*4);
//nineta
fill (0);
ellipse (mouseX+mesura+15,mouseY-mesura*1.2, mida, mida);
// ............................................ull esquerre
fill (255);
ellipse (mouseX-mesura-15,mouseY-mesura*1.2, mida*3 , mida*4);
//nineta
fill (0);
ellipse (mouseX-mesura-15,mouseY-mesura*1.2, mida, mida);
}
  

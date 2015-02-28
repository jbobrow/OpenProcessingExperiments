
int patternSeperationX = 30;
int patternSeperationY =30;
PFont myFont;
PGraphics pattern;
PGraphics fontGraphics;
 
void setup(){
  size(300,600);
 
  pattern = createGraphics (width,height,JAVA2D);
  fontGraphics = createGraphics (width,height,JAVA2D);
  String[] fontList = PFont.list();
  //println(fontList);
  pattern.beginDraw();
  pattern.smooth();
  pattern.background(255, 255, 255);
  noLoop();
   
   
  //pattern.fill(255,20);
  //pattern.noStroke();
 // pattern.rect(0,0,patternSeperationX,patternSeperationY);
  //stroke(0);
   
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pattern.pushMatrix();
        pattern.translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        pattern.popMatrix();
      }
  }
  pattern.endDraw();
   
  drawFont();
  //image(fontGraphics,0,0);
   
   
  pattern.blend(fontGraphics,
                  0,
                  0,
                  width,
                  height,
                  0,
                 0,
                  width,
                  height,
                  MULTIPLY);
   
  image(pattern,0,0);
   
 
   
   
   
   
   
   
}
 
 
void draw()
{
  
 
}
 
 
void yourFunction()
{
  pattern.strokeWeight(8);
  pattern.stroke(23,random(23));
  pattern.fill(98,145,250,120);
  pattern.ellipseMode(CENTER);
pattern.ellipse(22.5, 22.5, 45, 45);
pattern.ellipseMode(CORNER);
pattern.ellipse(45, 45, 50, 50);
pattern.line(0,0,45,45);
pattern.line(0,45,45,0);
pattern.line(22.5,0,22.5,45);
pattern.line(0,22.5,45,22.5);
  
}
 
void drawFont (){
   
  fontGraphics.beginDraw();
  fontGraphics.background(0);
   fontGraphics.fill(255);
PFont font;
myFont = createFont("Futura-CondensedExtraBold", 70);
fontGraphics.textFont(myFont);
fontGraphics.textMode(MODEL);
fontGraphics.text("BUSINESS INSIGHT",50,90);
fontGraphics.text("BUSINESS INSIGHT",50,180);
fontGraphics.text("BUSINESS INSIGHT",50,270);
fontGraphics.text("BUSINESS INSIGHT",50,360);
fontGraphics.text("BUSINESS INSIGHT",50,450);
fontGraphics.text("BUSINESS INSIGHT",50,540);
fontGraphics.endDraw();
}
 
 


                
                

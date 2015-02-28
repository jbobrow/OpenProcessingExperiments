
PImage piramide1;
PImage esfera1;
PImage esferaylineanew;
PFont font;

void setup() {
size(700, 700);
smooth();
piramide1 = loadImage("piramide1.jpg");
esfera1 = loadImage("esfera1.jpg"); 
esferaylineanew = loadImage ("esferaylineanew.jpg");
font = loadFont ("ACharmingFont-48.vlw");
textFont (font);}
 
void draw() {
  int s = second(); 
  int m = minute();
  int h = hour();   
  
   
// center
  translate(25,12);
 noFill();
   
 //    stroke(0);
  background(0);
    
 // ellipse(300, 300, s*5, s*5);
   
   //hours
  fill(52, 231, 0,70 );
  image (esferaylineanew, 200,550, h*8, h*8);

   //minutes
 fill(52, 242, 0,170);
 image (piramide1,370,320, m*5, m*5);
//  ellipse(300, 300, m*6, m*6);
   
   
  
   //seconds

  fill(52, 70, 205,170);
  image (esfera1,110,5,s*5, s*5);
  
  textFont(font);   
textAlign(CENTER);
text("Segundos",500,100);
text("Minutos",250,380);
text("Horas",50,550);
}



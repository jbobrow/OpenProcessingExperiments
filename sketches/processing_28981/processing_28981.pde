
public class Organism{
  
 public float x, y;
 float prevX, prevY;
 public String dna;
 color dnaFill;
 color dnaStroke;
 public float nX, nY;
 public int diameter = 0;
 int nWidth = width+(width/2);
 int nHeight = height+(height/2);
 boolean up = true;
 public boolean horny = false;
 int hornyTime = 500;
 public int timer = int(random(hornyTime));

 
 Organism(float X, float Y, String DNA){
   nX = X;
   nY = Y;
   x = noise(nX)*nWidth-width/4;
   y = noise(nY)*nHeight-height/4;
   prevX = x;
   prevY = y;
   dna = DNA;

   dnaColor();
 }
 
 void dnaColor(){
   int R = int(dna.substring(0,3));
   int G = int(dna.substring(3,6));
   int B = int(dna.substring(6));
   
   dnaFill = color(R,G,B,10);
   dnaStroke = color(R,G,B);
 }
 
 public void drawOrganism(){
   diameter = timer/20;
   noStroke();
   fill(dnaFill);
   ellipse(x, y, diameter, diameter);
   stroke(dnaStroke);
   strokeWeight(3);
   //point(x, y);
   line(prevX,prevY,x,y);
 }
 
 public void moveOrganism(){
   prevX = x;
   prevY = y;
   x = noise(nX)*nWidth-width/4;
   y = noise(nY)*nHeight-height/4;
   if(up){
     nX += 0.005;
     nY += 0.005;
   }else{
     nX -= 0.005;
     nY -= 0.005;
   }
   if(nX>10000){
     up = false;
     nX = 10000;
   }else if(nX<-10000){
     up = true;
     nX = -10000;
   }
   if(nY>10000){
     up = false;
     nY = 10000;
   }else if(nY<-10000){
     up = true;
     nY = -10000;
   }
   if(timer<hornyTime){
     horny = false;
     timer++;
   }else{
     horny = true;
   }
 }
 
 public void reincarnate(float X2, float Y2, String DNA2){
   nX = X2;
   nY = Y2;
   x = noise(nX)*nWidth-width/4;
   y = noise(nY)*nHeight-height/4;
   prevX = x;
   prevY = y;
   dna = DNA2;

   dnaColor();
   
   horny = false;
   timer = 0;  //int(random(hornyTime));
 }
}


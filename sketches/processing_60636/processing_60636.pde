
void setup(){
  
  smooth();

  size(400,400);  
  background(255);
 
}


void draw(){
  
 noStroke();

for(int i=0; i < width; i =i + 95){
 for(int j=0; j< height; j = j +75) { 
   
   
fill(0);

//rechts schwarz
ellipse(j+50,i+45,30,55);


fill(255);
//rechts weiß
ellipse(j+43,i+30,15,30);


fill(0);
//mitte schwarz
ellipse(j+28,i+40,40,77);

fill(255);
//mitte weiß
ellipse(j+15,i+30,25,70);

fill(0);
//mitte dreieck
triangle(j+27,i+10,j+15,i+40,j+35,i+60);


fill(0);
//links schwarz

//ellipse(10,45,25,50);
//fill(255);
//ellipse(43,30,15,30);

triangle(j+17,i+10,j+20,i+55,j+0,i+40);
triangle(j+0,i+60,j+20,i+45,j+0,i+40);

fill(0);
//unten schwarz
ellipse(j+30,i+58,60,60);

fill(255);

ellipse(j+30,i+75,30,20);
triangle(j+25,i+78,j+33,i+53,j+45,i+78);
triangle(j+30,i+78,j+24,i+60,j+18,i+74);

 }}}

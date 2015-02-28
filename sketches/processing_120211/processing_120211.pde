
 import controlP5.*;
ControlP5 controlP5;
 
  
  float d;
  float b;
  float a=0;
  float c=5;
  float sp=50;
 

void setup () {
  size (900,300);
  smooth();
  background(50);


}

void draw() {
}

void mousePressed() {
  
  sp= 400;
   d= mouseX;
   
  stroke (200);
 
  for (b= mouseY;b<900; b+=20) {
    
    if (mouseButton == LEFT)
{

    noStroke();
    fill(100,75);
beginShape();
vertex (d,b);
vertex (d+sp, b+sp);
vertex (d-sp, b+sp);
    endShape();
    
stroke(20,200,2000);
strokeWeight(4);
line (d,b, d+sp, b+sp);
}


 else if (mouseButton == RIGHT) {
  
  sp= 400;
   d= mouseX;
   
  stroke (200);

    noStroke();
    fill(100,75);
beginShape();
vertex (d,b);
vertex (d+sp, b+sp);
vertex (d-sp, b+sp);
    endShape();
    
stroke(50,300,256);
strokeWeight(4);
line (d,b, d-sp, b+sp);}


  
  else if (mouseButton == CENTER) { background(50);}
  
    redraw();}
   
 
}


void mouseReleased()
{
    sp= 400;
   d= mouseX;
   
 stroke (200);
 
  for (b= mouseY;b>0; b-=20) {
    
    if (mouseButton == LEFT)
{

    noStroke();
    fill(100,75);
beginShape();
vertex (d,b);
vertex (d-sp, b-sp);
vertex (d+sp, b-sp);
    endShape();
    
stroke(300,200,90);
strokeWeight(6);
line (d,b, d-sp, b-sp);
}

 else if (mouseButton == RIGHT) {
  
  sp= 400;
   d= mouseX;
   
  stroke (200);

    noStroke();
    fill(100,75);
beginShape();
vertex (d,b);
vertex (d-sp, b-sp);
vertex (d+sp, b-sp);
    endShape();
    
stroke(41,171,226);
strokeWeight(2);
line (d,b, d+sp, b-sp);}
 

  redraw();}
 
}


void keyTyped() {
saveFrame(gimme_name("cage_"));
};
 
String gimme_name(String begin)
{
  String name = begin;
  name+=String.valueOf(year());
  name+=".";
  if(month()<10) name+="0";
  name+=String.valueOf(month());
  name+=".";
  if(day()<10) name+="0";
  name+=String.valueOf(day());
  name+="_";
  if(hour()<10) name+="0";
  name+=String.valueOf(hour());
  name+=".";
  if(minute()<10) name+="0";
  name+=String.valueOf(minute());
  name+=".";
  if(second()<10) name+="0";
  name+=String.valueOf(second());
  name+=".png";
  return name;

}





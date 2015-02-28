
//Info: http://processingjs.org/reference

// M_2_3_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Groß, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Groß, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// modified by franklin hernandez-castro

int pointCount;
int freq = 3;
float phi = 0;
float modFreq = 5;
float angle;
float y; 
float dia;
float winkel;
float h = 100;
float lang= 15;
float move;
float winkel_2;

void setup() {
  size(900, 600);
  smooth();
  pointCount = width;
    background(0);
}


void draw() {

fill(0,5);
rect(-50,-50,1400,900);
  strokeWeight(1);
  
   
  dia = sin(winkel)*250;
  winkel= winkel + 0.02;
 
  move = sin(winkel_2)*1+3;
  winkel_2= winkel_2 + 0.02;
 
  translate(0,300);
  
  
sinus();

  
}



void mouseReleased() 
{ 
  String startTime = year()+"-"+nf(month(),2)+
  "-"+nf(day(),2)+"_"+nf(hour(),2)+nf(minute(),2)
  +nf(second(),2);
  saveFrame(startTime);
  

}




void sinus()
{
 


  // draw oscillator with freq and phi
    stroke(170,10,255,50);
    strokeWeight(2);
    beginShape();
    for (int i=0; i<=pointCount; i++) {
      angle = map(i, 0,pointCount,lang ,move);
      y = sin(angle * freq + radians (phi));
      y = y * dia/4;
      vertex(i, y);
    }
    endShape();

  // draw oscillator with modFreq
    
    stroke(170,10,255,50);
     strokeWeight(2);
    beginShape();
    for (int i=0; i<=pointCount; i++) {
      angle = map(i, 0,pointCount, 0,move);
      y = cos(angle * modFreq);
      y = y * dia/2;
      vertex(i, y);
    }
    endShape(); 

 // draw both combined
  stroke(170,10,255,50);
  strokeWeight(2);
  beginShape();
  for (int i=0; i<=pointCount; i++) {
    angle = map(i, 0,pointCount, 0,move);
    
    float info = sin(angle * freq + radians(phi));
    float carrier = cos(angle * modFreq);
    y = info * carrier;
    
    y = y * dia/3;
    vertex(i, y);
  }
  endShape();
  
}




import processing.pdf.*;

  float faceoneColor = random(0,255);
  float facetwoColor = random(0,231);
  float facethreeColor = random(0,102);
  float headsize = random(210,250);
  float haironeColor = random(255,40);
  float hairtwoColor = random(149,244);
  float hairthreeColor = random(244,149);
  
  
void setup(){
  size(5000,5000);
  smooth(); 
  translate(250,250);
  noStroke();
  beginRecord(PDF, "faces.pdf");
  repeatShape();
  endRecord();
}
 
void repeatShape(){
  int x = 0;
  for (int i=0; i < 100; i++){
    makeShape();
    translate(500,0);
    x++;
    if (x == 10){
      translate(-5000,500);
      x = 0;
    }
  }
}
 
void makeShape(){
  
  //head
  //translate(250,250);
   float faceoneColor = random(0,255);
  float facetwoColor = random(0,231);
  float facethreeColor = random(0,102);
  float headsize = random(210,250);
fill(faceoneColor,facetwoColor,facethreeColor);
ellipse(0,0,230,310);



  //right eye
fill(255,255,255);
ellipse(40,-20,50,50);
 
//left eye
fill(255,255,255);
ellipse(-40,-20,50,50);
 
//nose
pushMatrix();
translate(0,30);
fill(246,141,200);
ellipse(0,-10,40,30);
popMatrix();
 
//eyepupil right
fill(0,0,150);
ellipse(40,-20,10,10);
 
// eye pupil left
fill(0,0,150);
ellipse(-40,-20,10,10);
 
//mouth
pushMatrix();
translate(0,30);
fill(218,21,63);
ellipse(0,50,100,30);
popMatrix();
 
//ear left
fill(246,199,255);
ellipse(-120,-40,50,80);

//earring
stroke(255,197,5);
fill(244,255,240);
ellipse(-120,20,20,50);
 
//ear right
noStroke(); 
fill(246,199,255);
ellipse(120,-40,50,80);

//hair
  float haironeColor = random(0,255);
  float hairtwoColor = random(0,255);
  float hairthreeColor = random(0,255);
 
fill(haironeColor,hairtwoColor,hairthreeColor);
ellipse(0,-180,200,50);

fill(haironeColor,hairtwoColor,hairthreeColor);
ellipse(0,-150,250,50);

fill(haironeColor,hairtwoColor,hairthreeColor);
ellipse(0,-150,250,50);

fill(haironeColor,hairtwoColor,hairthreeColor);
ellipse(0,-120,270,50);


}





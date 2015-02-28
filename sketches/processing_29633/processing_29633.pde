
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RShape txt;
float avance;


void setup(){
size(800,350);
RG.init(this);
txt =RG.getText("funk","Ayuthaya.ttf",250,CENTER);
txt = RG.centerIn(txt, g, 60);
smooth();

}

void draw(){

  background (0);
  pushMatrix();
  noStroke();
  fill(0);
  translate (width/2,height/2);
  textAlign(CENTER);
  RG.shape (txt);
  popMatrix();
  
  for (float i=0;i<width;i+=10){
    for (float j=0;j<height;j+=10){
    pushMatrix();
   translate (i,j);
  float r = random (0,255);
  float g = random (0,100);
   float b = random (0,100);
   float a = random (0,100);
   fill(r,g,b,a);
   noStroke();
  
 float sz= map (noise (2),0,1,1,10);
   
  ellipse (0,0,sz,sz);
  popMatrix();
  }}
  
 for (float i=0;i<0.9999;i+=0.001){
  RPoint punto =txt.getPoint(i); 
 pushMatrix();
  translate (width/2,height/2);

 pushMatrix();
 translate (punto.x,punto.y);
 noStroke();
 
 float r = random (0,150);
  float g = random (0,255);
   float b = random (0,255);
  float e = map (noise (frameCount/600.0),0,1,2,15);
   float s = map (noise (frameCount/600.0),0,1,170,255);
 fill(r,g,b);
 
// println(n);
 ellipse (random(0,20),random(0,20),e,e);
 popMatrix();
   popMatrix();
 
 }
 
}

void keyPressed (){
  saveFrame("screenshot-####.png");
}




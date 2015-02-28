
//NCKU 2013-14 processing practice of PeasyCam 3.0 - 
//HorusWang ,jan ,2014



import peasy.test.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;



import peasy.*;
PeasyCam horuscam ;

void setup() {
  size(500, 500, P3D);
  smooth();
  
  horuscam = new PeasyCam(this, 500);
  }

void draw() {
  background(255, 30, 170);
  stroke(255);
  fill(random(width/2), random(width+height/4), random(height/2));

  
  float c1 = random(100);
  float c2 = random(100);
  float c3 = random(50,100);

  for (float i=0;i<1080;i+=3) {
    
    pushMatrix(); 
    translate(300*cos(c1*i*(PI/180)), 150*sin(c2*i*(PI/180)), 100*sin(c3*i*(PI/180)));
    box(c1/2,c2/2,c3/2);
    popMatrix();
  
  }
    
if(mousePressed == true && mouseButton ==  RIGHT){
 saveFrame("pro3-FR-####.jpg") ;
}
  
  }





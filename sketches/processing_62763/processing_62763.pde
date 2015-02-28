
/**
 * dandilion
 * modified by Keith Rowell     2012
 * from example code: 
 * Esfera
 * by David Pena.  
 * 
 * Distribucion aleatoria uniforme sobre la superficie de una esfera. 
 */

//  import processing.opengl.*;  
import peasy.*;

PeasyCam cam;

int cuantos = 200;   /** number of hairs **/
pelo[] lista ;
float[] z = new float[cuantos]; 
float[] phi = new float[cuantos]; 
float[] largos = new float[cuantos]; 
float radio = 150;
float rx = 0;
float ry = 0;
/**  float tri = 1;   **/


void setup() {
//  size(500, 300, OPENGL);
    size(500, 300, P3D);
//    smooth(); 

  radio = height/5.5;  /** sphere size  - 3.5 **/
  
  lista = new pelo[cuantos];
  for (int i=0; i<cuantos; i++){
    lista[i] = new pelo();
  }
  noiseDetail(3);

}

void draw() {
  background(0);
  translate(width/2,height/2); /** center**/

  float rxp = ((mouseX-(width/2))*0.005);
  float ryp = ((mouseY-(height/2))*0.005);
  rx = (rx*0.9)+(rxp*0.1);
  ry = (ry*0.9)-(ryp*0.1);
  rotateY(rx);
  rotateX(ry);
  fill(0);
  noStroke();
  sphere(radio/2);

  for (int i=0;i<cuantos;i++){
    lista[i].dibujar();

  }
}


class pelo
{
  float z = random(-radio,radio);
  float phi = random(TWO_PI);
  float largo = random(1.4,3.6);    /** hair lenght 1.15,1.2**/
  float theta = asin(z/radio);

    void dibujar(){

    float off = (noise(millis() * 0.0005,sin(phi))-0.5) * 0.3;
    float offb = (noise(millis() * 0.0007,sin(z) * 0.01)-0.5) * 0.3;

    float thetaff = theta+off;
    float phff = phi+offb;
    float x = radio * cos(theta) * cos(phi);
    float y = radio * cos(theta) * sin(phi);
    float z = radio * sin(theta);
    float msx= screenX(x,y,z);
    float msy= screenY(x,y,z);

    float xo = radio * cos(thetaff) * cos(phff);
    float yo = radio * cos(thetaff) * sin(phff);
    float zo = radio * sin(thetaff);

    float xb = xo * largo +1;
    float yb = yo * largo +1;
    float zb = zo * largo +1;
    
/**    float xc = xb + tri;
    float yc = yb + tri;
    float zc = zb + tri;  **/

    strokeWeight(2);   
    
    beginShape(LINES);
    stroke(0);
    vertex(x,y,z);
    stroke(#CCFFAA,250);   
    vertex(xb,yb,zb);
    endShape();   
    
    strokeWeight(15);
   
    beginShape(POINTS);
    stroke(0);
    // vertex(x,y,z); 
    stroke(#928DC0,120);
//    stroke(#CC895B,120);
    vertex(xb,yb,zb);  
    endShape(); 
    
    strokeWeight(5);
    
    beginShape(POINTS);
    stroke(0);
    // vertex(x,y,z); 
    stroke(#5FEEFF,220);   
    vertex(xb,yb,zb);  
    endShape(); 

  }
}


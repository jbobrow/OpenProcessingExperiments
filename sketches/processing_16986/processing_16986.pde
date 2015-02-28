
import processing.opengl.*;

int num = 200;

float[] x = new float[num];
float[] z = new float[num];
float[] xM = new float[num];
float[] zM = new float[num];
float[] r = new float[num];
float[] g = new float[num];
float[] b = new float[num];

int oZ = 0;
float rO = 0;

void setup(){
  size(600,600,P3D);
  rectMode(CENTER);
  for(int n =0; n<num; n++){
    
    x[n] = random(-300,300);
    z[n] = random(-300,300);
     xM[n] = random(-200,200);
    zM[n] = random(-200,200);
    r[n] = random(255);
    g[n] = random(255);
    b[n] = random(255);
  }
  }

void draw(){
 background(0);
 pushMatrix();
 translate(width/2,0,-1000);
  translate(0, 0, oZ);
  rotateY(radians(rO));
  strokeWeight(2);
  for(int c = 0; c<num; c++){
     
    stroke(r[c],g[c],b[c]);
  line(x[c],-height*6,z[c],x[c]+xM[c],height*8,z[c]+zM[c]);  
  }
  fill(0,0,0, 230);
  noStroke();
  pushMatrix();
translate(0,height/2,0);
  box(500);
  popMatrix();
  popMatrix();
}
  
  void keyPressed(){
    if(keyCode == UP){
   oZ+=10;
    }
  
  else if(keyCode == DOWN){
  oZ-=10;
  }  
   
   if(keyCode == LEFT){
      rO-=.3;
    }
    
    else if(keyCode == RIGHT){
      rO+=.3;
    }
    }


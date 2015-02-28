
import org.jbox2d.p5.*;
int e = 1;
int num = 100000;
float GP = 0.05;
float R = 0.75;
float y[] = new float[num];
float vy[] = new float[num];
float x[] = new float[num];
float vx[] = new float[num];
int w[] = new int [num];
int cx = 200;
int cy = 150;
float cw = 400;
Physics physics;
void setup(){
  frameRate(200);
  size(400,800);
  smooth();
  noFill();
 for(int i=0; i<e; i++ ){
   x[i] = float(200);
   vx[i] = random(-1.2,1.2); 
   y[i] = int(150);
   vy[i] = GP;
   w[i] = int(10);
 }
// physics = new Physics(this, width, height);
}

void draw(){
  background(255,253,232);
  noStroke();
  fill(255,130,130);
 float GP = random(0.04,0.05);
 float R = random(0.60,0.75); 
  
for(int i= 0; i<e; i++){  
  if(y[i]>height){
    y[i] = 800;
    vy[i] *= -R;
    
    }
  if(x[i]<0){
    x[i] = 0;
    vx[i] *= -1;
  }
   if(x[i]>width){
    x[i] = 400;
    vx[i] *= -1;
  }

}
for(int i=0; i<e; i++){
  x[i] += vx[i];
  vx[i] = vx[i] ; 
  y[i] += vy[i];
  vy[i] += GP;
  ellipse(x[i],y[i],w[i],w[i]);
  }
  
ellipse(200,cy,cw,cw);

 if(mousePressed){
   e = e + 1;
   x[e] = float(200);
   vx[e] = random(-1.2,1.2); 
   y[e] = int(150);
   vy[e] = GP;
   w[e] = int(10);
   cw = cw - 0.1;
//   if(cw<10){
//     cw = cw + 0.1;
//   }
//   if(cw>400){
//     cw = cw - 0.1;
//   }
}
}





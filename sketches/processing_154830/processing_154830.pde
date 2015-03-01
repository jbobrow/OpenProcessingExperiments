
/*
*CreativeCoding
*Week 3 ,05 
*
*/

//declate
float[] x;
float[] y;
float[] dx;
float[] dy;
float[] bx;
float[] by;
float[] rad;
float[] rad_inc;
float[] tDist;
int num = 50;
float maximum = 0.5;
float minimum = 0.1;
int img =0;

void setup() {

  size(600,600);
    
  //allocate
  x = new float[num]; 
  y = new float[num];  
  dx = new float[num]; 
  dy = new float[num];
  rad = new float[num];
  rad_inc = new float[num];
  bx = new float[num];
  by = new float[num];
  tDist = new float[num];  
   
  //initiate
  for(int i=0; i<num; i++) {
    
     x[i] = width/2;
     y[i] = height/2;
     dx[i] = random(-1,1);
     dy[i] = random(-1,1);
     rad[i] = frameCount;
     rad_inc[i] = random(-1,1);
     bx[i] = 0;
     by[i] = 0;
     tDist[i] = random(10, 100);     
}
     //clear screen
     background(0);
} 
     
void draw() { 
  
   // slowly fade the image over time
  if (frameCount%100 == 0) {
    fill(0,100,100, 20);
    rect(0, 0, width, height);
  }
     
  for(int i=0; i<num; i++) {
     x[i] += dx[i];
     y[i] += dy[i];
     rad[i] += rad_inc[i];
     
     if(x[i] > width-30 || x[i] < 30) {
     dx[i] = dx[i]>0 ? -random(minimum,maximum) : random (min,max);
     }
     if(y[i]> height-30 || y[i]< 30) {
     dy[i] = dy[i]>0 ? -random(minimum,maximum) : random (min,max);
     }
     
     bx[i] = x[i] - 100*sin(rad[i]);
     by[i] = y[i] + 100*cos(rad[i]);
     
     fill(180); 

  }
  
     for(int i=0; i< num; i++) {
        for(int j=0; j<num; j++) {
        float dist = dist(x[i],y[i],x[j],y[j]);
        if(dist < tDist[i]) {         
           beginShape();
           stroke(255,10);
           noFill();
           vertex(x[i],y[i]);
           vertex(x[i], y[j]);                   
           vertex(x[j],y[j]);
           vertex(x[j], y[i]);           
           endShape();              
        }  
   float b_dist = dist(bx[i], by[i], bx[j], by[j]);
      if (b_dist < tDist[i]) {

        beginShape();
        noFill();
        stroke(255,10);      
        vertex(bx[i], by[i]+10);
        vertex(bx[i], by[j]+10);
        vertex(bx[j], by[i]+10);                
        vertex(bx[j], by[j]+10);        
        endShape();
    }    
   }     
  }
 }
void keyPressed() {
    if(keyPressed == true && key == 's'){
    saveFrame("image" +img+ ".jpg");
    img++;
    } 
} 
void mousePressed() {
  for(int i=0; i<num; i++) {
  x[i] = mouseX;
  y[i] =mouseY;
  }
}
  


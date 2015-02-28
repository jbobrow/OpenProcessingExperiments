
/**
 * Follow 1  
 * based on code from Keith Peters. 
 * 
 * A line segment is pushed and pulled by the cursor.
 */

int w = 240;
float hz = 1.0;
int N = 4;

float r = 60;
float[] A = new float[N];
PVector[] m = new PVector[N];


void setup() {

  frameRate(60);
  //size(w*N, w);
  size(960,240);

  noCursor();

  for(int j=0; j<N; j++){
    m[j] = new PVector(0,0);
  }

}


void draw() {
  background(0);
  

   float i = frameCount % 360*6*hz;
   float a = radians(i);


   for(int j=0; j<N; j++){
    
     if(frameCount % (j+1) == 0){
       A[j] = a;
       if(j*w < mouseX && mouseX < (j+1)*w) m[j].set(mouseX,mouseY);
     }

     strokeWeight(20.0);
     stroke(255, 100);
     float xb = j*w; 
     line(xb,0,xb,height);
  
     noStroke();
       
     resetMatrix();
     translate(j*w + w/2, w/2);
     text(nf(frameRate/(j+1),2,0),0,0);

     rotate(A[j]);
     translate(r,0);
     
     int s = 30;
     if(abs(mouseX - screenX(0, 0))<s/2 && abs(mouseY - screenY(0, 0))<s/2) fill(255,0,0);
     else fill(255);   
     ellipse(0, 0, s,s);
     
     resetMatrix();
     fill(200);
     ellipse(m[j].x, m[j].y, 10,10);
     
   }
    
}

